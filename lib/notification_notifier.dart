import 'package:flutter/foundation.dart';
import 'package:notification_handling/notification.dart';

/// This acts as a bridge between Firebase and our app.
/// It listens to Firebase messages and exposes notifiers to inform the UI layer what to do next.
class NotificationNotifier extends ChangeNotifier {
  NotificationNotifier() {
    _init();
  }

  NotificationPayload? notificationPayload;

  void _init() {
    // TODO: Initialize your firebase listeners here to make them available as soon as the app is running
    // FirebaseMessaging.onMessageOpenedApp.listen(_backgroundNotificationListener);
    // FirebaseMessaging.instance.getInitialMessage().then(_terminatedNotificationListener);
  }

  void simulateNotification({required Message message}) {
    notificationPayload = NotificationPayload(
      // The type here isn’t needed for the demo,
      // but you can use it in real apps to tell if the tap came from
      // a background or terminated state — just pass it through your firebase listeners.
      type: NotificationType.background,
      message: message,
    );
    notifyListeners();
  }
}
