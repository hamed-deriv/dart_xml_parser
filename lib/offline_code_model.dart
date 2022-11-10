import 'dart:convert';

import 'enums.dart';

class OfflineCodeModel {
  OfflineCodeModel({required this.offlineCodes});

  factory OfflineCodeModel.fromMap(Map<String, dynamic> map) =>
      OfflineCodeModel(
        offlineCodes: OfflineCodes.fromMap(map['OFFLINE_CODES']),
      );

  factory OfflineCodeModel.fromJson(String json) =>
      OfflineCodeModel.fromMap(jsonDecode(json));

  final OfflineCodes offlineCodes;
}

class OfflineCodes {
  OfflineCodes({required this.code});

  factory OfflineCodes.fromMap(Map<String, dynamic> map) => OfflineCodes(
        code: List<Code>.from(
          map['CODE'].map((dynamic item) => Code.fromMap(item)),
        ),
      );

  factory OfflineCodes.fromJson(String json) =>
      OfflineCodes.fromMap(jsonDecode(json));

  final List<Code> code;
}

class Code {
  Code({
    required this.name,
    required this.brand,
    required this.token,
    required this.user,
    required this.active,
    required this.startEnd,
    required this.endDate,
    required this.created,
    required this.modified,
  });

  factory Code.fromMap(Map<String, dynamic> map) => Code(
        name: map['NAME'],
        brand: Brand.fromMap(map['BRAND']),
        token: map['TOKEN'],
        user: User.fromMap(map['USER']),
        active: map['ACTIVE'] == ActivateStatus.active.name
            ? ActivateStatus.active
            : ActivateStatus.inactive,
        startEnd: DateTime.parse(map['START_END']),
        endDate: DateTime.parse(map['END_DATE']),
        created: DateTime.parse(map['CREATED']),
        modified: DateTime.parse(map['MODIFIED']),
      );

  factory Code.fromJson(String json) => Code.fromMap(jsonDecode(json));

  final String name;
  final Brand brand;
  final String? token;
  final User user;
  final ActivateStatus active;
  final DateTime startEnd;
  final DateTime endDate;
  final DateTime created;
  final DateTime modified;
}

class Brand {
  Brand({required this.name, required this.text});

  factory Brand.fromMap(Map<String, dynamic> map) => Brand(
        name: map['NAME'],
        text: map['text'],
      );

  factory Brand.fromJson(String json) => Brand.fromMap(jsonDecode(json));

  final String name;
  final String text;
}

class User {
  User({required this.username, required this.text});

  factory User.fromMap(Map<String, dynamic> map) => User(
        username: map['USERNAME'],
        text: map['text'],
      );

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));

  final String username;
  final String text;
}
