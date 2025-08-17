import 'package:flutter/material.dart' hide NotificationListener;
import 'package:notification_handling/notification_notifier.dart';
import 'package:provider/provider.dart';

import 'counter_notifier.dart';
import 'notification.dart';
import 'notification_listener.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationNotifier()),
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NotificationListener(child: HomeScreen()),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Handling Notification Declaratively')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text(
              'Tap on the below given notification UI to simulate the notification tap event',
            ),
            ListTile(
              onTap: () {
                context.read<NotificationNotifier>().simulateNotification(
                  message: Message(
                    id: 1,
                    body: 'Hello World!!!',
                    type: 'counter_notification',
                  ),
                );
              },
              leading: FlutterLogo(),
              title: Text('Counter Notification'),
              subtitle: Text('Tap to increment the counter'),
            ),
            const Divider(height: 2),
            ListTile(
              onTap: () {
                context.read<NotificationNotifier>().simulateNotification(
                  message: Message(
                    id: 1,
                    body: 'Hello World!!!',
                    type: 'navigation_notification',
                  ),
                );
              },
              leading: FlutterLogo(),
              title: Text('Navigation Notification'),
              subtitle: Text('Tap to Navigate to a new screen'),
            ),
            Consumer<Counter>(
              builder: (context, notifier, child) {
                return Text(
                  '${notifier.counter}',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
