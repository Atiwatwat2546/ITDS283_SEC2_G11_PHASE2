import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final String name;
  final Timestamp datetime;
  final String location;
  final String detail;

  Activity({
    required this.name,
    required this.datetime,
    required this.location,
    required this.detail,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'datetime': datetime,
      'location': location,
      'detail': detail,
    };
  }
}

