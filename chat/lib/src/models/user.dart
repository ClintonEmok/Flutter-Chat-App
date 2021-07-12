import 'package:flutter/foundation.dart';

// User
class User {
  String get id => _id;
  String username;
  String photoUrl;
  String _id;
  bool active;
  DateTime lastseen;

  User(
      {@required String this.username,
      @required String this.photoUrl,
      @required bool this.active,
      @required DateTime this.lastseen});

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
        active: json['active'],
        lastseen: json['lastseen']);
    user._id = json['id'];
    return user;
  }
}
