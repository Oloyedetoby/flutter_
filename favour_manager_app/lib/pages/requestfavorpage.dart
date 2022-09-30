import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RequestFavorPage extends StatefulWidget {
  const RequestFavorPage({Key? key}) : super(key: key);

  @override
  State<RequestFavorPage> createState() => _RequestFavorPageState();
}

class _RequestFavorPageState extends State<RequestFavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requesting a favor"),
        leading: CloseButton(),
        actions: <Widget>[
          TextButton(
            child: Text("SAVE", style: TextStyle(color: Colors.white)),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField(
            items: friends
                .map(
                  (f) => DropdownMenuItem(
                    child: Text(f.name),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
          TextFormField(
            maxLines: 5,
            inputFormatters: [LengthLimitingTextInputFormatter(200)],
          ),
          DateTimePickerFormField(
            inputType: InputType.both,
            format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
            editable: false,
            decoration: InputDecoration(
                labelText: 'Date/Time', hasFloatingPlaceholder: false),
            onChanged: (dt) {},
          ),
          
        ],
      ),
    );
  }
}
