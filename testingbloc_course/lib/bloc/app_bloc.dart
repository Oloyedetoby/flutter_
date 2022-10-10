import 'package:bloc/bloc.dart';
import 'package:testingbloc_course/api/login_api.dart';
import 'package:testingbloc_course/api/note_api.dart';
import 'package:testingbloc_course/bloc/actions.dart';
import 'package:testingbloc_course/bloc/app_state.dart';
import 'package:testingbloc_course/models.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NoteApiProtocols noteApi;

  AppBloc({
    required this.loginApi,
    required this.noteApi,
  }) : super(const AppState.empty()) {
    on<LoginAction>(
      (event, emit) async {
        //start loading
        emit(
          const AppState(
            isLoading: true,
            loginError: null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
        //log the user in
        final loginHandle = await loginApi.login(
          email: event.email,
          password: event.password,
        );
        emit(
          AppState(
            isLoading: false,
            loginError: loginHandle == null ? LoginErrors.invalidHandle : null,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
      },
    );
    on<LoadNotesAction>(
      (event, emit) async {
        //start loading Note
        emit(
          AppState(
            isLoading: true,
            loginError: null,
            loginHandle: state.loginHandle,
            fetchedNotes: null,
          ),
        );
        //get the log In handles
        final loginHandle = state.loginHandle;
        if (loginHandle != const LoginHandle.foobar()) {
          //invalid login handle, cannot fetch notes
          emit(
            AppState(
              isLoading: false,
              loginError: LoginErrors.invalidHandle,
              loginHandle: loginHandle,
              fetchedNotes: null,
            ),
          );
          return;
        }
        //we have a valid login handle and we want to fetch notes
        final notes = await noteApi.getnotes(
          loginHandle: loginHandle!,
        );
        emit(
          AppState(
            isLoading: false,
            loginError: null,
            loginHandle: loginHandle,
            fetchedNotes: notes,
          ),
        );
      },
    );
  }
}
