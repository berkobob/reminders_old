import 'dart:async';

import 'package:flutter/services.dart';

import 'reminder.dart';
export 'reminder.dart';

class Reminders {
  static const MethodChannel _channel = const MethodChannel('reminders');

  /// Check for access to the ios Reminders
  Future<bool> get hasAccess async {
    return await _channel.invokeMethod('hasAccess');
  }

  /// Return the name of the default list of reminders
  Future<String> get defaultList async {
    final String list = await _channel.invokeMethod('defaultList');
    return list;
  }

  /// Return a list of all the reminder list names
  Future<List<dynamic>> get lists async {
    return await _channel.invokeMethod("lists");
  }

  /// Return a list of [Reminder]s found in a list
  /// Pass an empty string to return all reminders in all lists
  Future<List<Reminder>> getReminders(String list) async {
    var reminders =
        await _channel.invokeMethod("getReminders", {"calendar": list});
    return reminders
        .map<Reminder>((reminder) => Reminder.fromJson(reminder))
        .toList();
  }

  /// Deletes a [Reminder] given it's id
  Future deleteReminderWithId(String reminder) async {
    await _channel.invokeMethod("deleteReminderWithId", {"reminder": reminder});
  }
}
