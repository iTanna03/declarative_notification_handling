import 'package:flutter/material.dart';
import 'package:notification_handling/counter_notifier.dart';
import 'package:notification_handling/notification.dart';
import 'package:notification_handling/some_screen.dart';
import 'package:provider/provider.dart';

/// This class abstracts notification side-effects from the UI layer.
/// Whether it's navigation, refreshing data, or showing a dialog,
/// keep all action logic here.
class NotificationUtility {
  static void onMessageTap(
    BuildContext context, {
    required NotificationPayload payload,
  }) {
    // At this point in the code, we are guaranteed to have valid BuildContext
    // hence there is no need to add checks like `if(context.mounted)`
    if (payload.message.type == 'counter_notification') {
      context.read<Counter>().increment();
    } else if (payload.message.type == 'navigation_notification') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => SomeScreen()));
    }
  }
}
