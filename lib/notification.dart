enum NotificationType { background, terminated }

class Message {
  Message({required this.id, required this.body, required this.type});

  final int id;
  final String body;
  final String type;
}

class NotificationPayload {
  NotificationPayload({required this.type, required this.message});

  final NotificationType type;
  final Message message;
}
