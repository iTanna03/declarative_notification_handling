import 'package:flutter/material.dart';
import 'package:notification_handling/notification_notifier.dart';
import 'package:notification_handling/notification_utility.dart';
import 'package:provider/provider.dart';

/// This widget sits above your app's navigation stack and listens to
/// changes from [NotificationNotifier].
///
/// It ensures notifications are handled with a valid [BuildContext] by
/// wiring them up through [NotificationUtility], avoiding runtime context errors.
class NotificationListener extends StatefulWidget {
  const NotificationListener({required this.child, super.key});
  final Widget child;

  @override
  State<NotificationListener> createState() => _NotificationListenerState();
}

class _NotificationListenerState extends State<NotificationListener> {
  late final NotificationNotifier _notificationNotifier;

  @override
  void initState() {
    super.initState();
    _notificationNotifier = context.read<NotificationNotifier>();
    _notificationNotifier.addListener(_onNotification);
  }

  @override
  void dispose() {
    _notificationNotifier.removeListener(_onNotification);
    super.dispose();
  }

  void _onNotification() {
    final payload = _notificationNotifier.notificationPayload;
    if (payload == null) return;

    // We add the onMessageTap inside addPostFrameCallback to ensure the context
    // is valid
    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationUtility.onMessageTap(context, payload: payload);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
