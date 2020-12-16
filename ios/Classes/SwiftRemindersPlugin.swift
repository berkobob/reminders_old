import Flutter
// import UIKit

public class SwiftRemindersPlugin: NSObject, FlutterPlugin {
    
    let reminders = Reminders()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "reminders", binaryMessenger: registrar.messenger())
        let instance = SwiftRemindersPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {

        case "hasAccess":
            DispatchQueue.main.async {
                result(self.reminders.hasAccess)
            }

        case "defaultList":
            DispatchQueue.main.async {
                result(self.reminders.defaultList?.title)
            }   

        case "lists":
            DispatchQueue.main.async {
                result(self.reminders.allLists())
            }

        case "getReminders":
            if let args = call.arguments as? [String: String] {
                if let calendar = args["calendar"] {
                    reminders.getReminders(calendar) { (reminders) in 
                        result(reminders)
                    }
                }       
            }

        case "deleteReminderWithId":
            if let args = call.arguments as? [String: String] {
                if let id = args["reminder"] {
                    reminders.deleteReminder(id)
                }
            }
            

        default:
            DispatchQueue.main.async {
                result(FlutterMethodNotImplemented)
            }
        }
    }
}

