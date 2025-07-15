part of '../r.dart';

/// this class is used to handle different api call endpoints
class ApiString {
  ApiString._();

  static String get v1 => 'v1/api/';

  static String get validate => '${v1}auth/validate';

  static String get deviceList => '${v1}device/list';

  static String get devicePower => '${v1}device/power/';

  static String get deviceTotal => '${v1}device/total';

  static String get deviceDetail => '${v1}device/details/';

  static String get deviceTime => '${v1}device/timing/';

  static String get electricDataUsage => '${v1}electric-usage/device/';

  static String get addNewDevice => '${v1}device/add';

  static String get phantomLoadHunt => '${v1}missions/phantom-load';

  static String get phantomLoadHuntWatts => '${v1}missions/phantom-load/total-watts';

  static String get greenReferralCode => '${v1}missions/green-team/referral-code';

  static String get applyGreenReferralCode => '${v1}missions/green-team/apply-referral-code';

  static String get greenReferralCodeStats => '${v1}missions/green-team/stats';

  static String get attendanceStats => '${v1}attendance/stats';

  static String get getAttendance => '${v1}attendance';
}
