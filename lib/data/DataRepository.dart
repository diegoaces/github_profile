import 'dart:convert';

import 'package:github_profile/data/models/Profile.dart';
import 'package:http/http.dart';

import 'models/Profile.dart';

class DataRepository {
  Future<Profile> fetchUser(String userName) async {
    String api = 'https://api.github.com/users/$userName';
    return await get(api).then((data) {
      final jsonData = json.decode(data.body);

      if (jsonData['message'] == "Not Found") {
        throw UserNotFoundException();
      } else {
        return Profile.fromJson(jsonData);
      }
    }).catchError((context) {
      throw UserNotFoundException();
    });
  }
}

class UserNotFoundException implements Exception {}
