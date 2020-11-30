import 'dart:async';

import 'package:flutter/services.dart';

import 'reminder.dart';
export 'reminder.dart';

class Reminders {
  static const MethodChannel _channel = const MethodChannel('reminders');

  /// Check whether you have access to the ios Reminders
  static Future<bool> get hasAccess async {
    return await _channel.invokeMethod('hasAccess');
  }

  /// Returns the name of the default list of reminders
  static Future<String> get defaultList async {
    final String list = await _channel.invokeMethod('getDefaultList');
    return list;
  }

  /// Returns a list of all the reminder list names
  static Future<List<dynamic>> get allLists async {
    return await _channel.invokeMethod("getAllLists");
  }

  /// Returns a list of [Reminder]s found in a list
  static Future<List<Reminder>> getReminders(String list) async {
    var reminders =
        await _channel.invokeMethod("getReminders", {"calendar": list});
    return reminders
        .map<Reminder>((reminder) => Reminder.fromJson(reminder))
        .toList();
  }

  /// Deletes a [Reminder] given it's id
  static Future deleteReminder(String reminder) async {
    await _channel.invokeMethod("deleteReminder", {"reminder": reminder});
  }
}
