import 'dart:async';

import 'package:flutter/services.dart';

import 'reminder.dart';
export 'reminder.dart';

class Reminders {
  static const MethodChannel _channel = const MethodChannel('reminders');

  static Future<bool> get hasAccess async {
    return await _channel.invokeMethod('hasAccess');
  }

  static Future<String> get defaultList async {
    final String list = await _channel.invokeMethod('getDefaultList');
    return list;
  }

  static Future<List<dynamic>> get allLists async {
    return await _channel.invokeMethod("getAllLists");
  }

  static Future<List<Reminder>> getReminders(String list) async {
    var reminders =
        await _channel.invokeMethod("getReminders", {"calendar": list});
    return reminders
        .map<Reminder>((reminder) => Reminder.fromJson(reminder))
        .toList();
  }

  static Future deleteReminder(String reminder) async {
    String result =
        await _channel.invokeMethod("deleteReminder", {"reminder": reminder});
    print(result);
  }
}
