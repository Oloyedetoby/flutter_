class UserM {
  final String uid;
  UserM({required this.uid});
}

class UserData {
  final String? uid;
  final String? name;

  final String? sugar;
  final int strength;

  UserData({
    required this.uid,
    required this.name,
    required this.sugar,
    required this.strength,
  });
}
