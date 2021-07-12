import 'package:flutter/foundation.dart';

// User properties
class User {
  String get id => _id;
  String username;
  String photoUrl;
  String _id;
  bool active;
  DateTime lastseen;

  User(
      {@required String username,
      @required String photoUrl,
      @required bool active,
      @required DateTime lastseen});

// Maps user properties to json object
  toJson() => {
        'username': username,
        'photo_url': photoUrl,
        'active': active,
        'last_seen': lastseen
      };

  factory User.fromJson(Map<String, dynamic> json) {
    final user = User(
        username: json['username'],
        photoUrl: json['photoUrl'],
        active: ['active'],
        lastseen: ['lastseen']);
    user._id = json['id'];
    return user;
  }
}
