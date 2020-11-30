# Reminders

This is a simple package that gives a dart app access to Apple Reminders. 

## Current functionality:

This is the only functionality I need for my app:

* Get the name of the default Reminder list `defaultLit`
* Get a list of all the Reminder list names `allLists`
* Get all the reminders in a list `getReminders(String list)`
* Delete a reminder `deleteReminder(String reminderId)`

## iOS integration

Add the following key/value pair to your Info.plist
>
> `<key>NSCalendarsUsageDescription</key>`
> 
> `<string>INSERT_REASON_HERE</string>`
> 

## Possible features to be developed

I'm willing to add more functionality if needed. For example:

* Mark a reminder as done or undone
* Create a new reminder
* Set the start date or dueDate
* Move a reminder from one list to another