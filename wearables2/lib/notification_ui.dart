import 'package:flutter/material.dart';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:provider/provider.dart';
import 'package:wearables2/notification_service.dart';
import 'package:wearables2/tts.dart';


class NotificationUi extends StatefulWidget {
  const NotificationUi({
    super.key,
    required BuildContext context
  });

  @override
  State<NotificationUi> createState() => _NotificationUiState();
}

class _NotificationUiState extends State<NotificationUi> {
  bool _shouldShow = false;
  String _text = "";
TtsProvider get ttsProvider => Provider.of<TtsProvider>(context, listen: false);
  

  void updateOnNotification(NotificationEvent event) async {
    setState(() {
      _shouldShow = true;
      _text = event.toString();
    });
    if (event.text != null) {
      await ttsProvider.speak(event.text!);
    }
    setState(() {
      _shouldShow = false;
      _text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    var notifications = NotificationService();
    
    notifications.registerFunction(updateOnNotification);
    return Column(
      children: [
        Text("Your messages:"),
        Text(_text)
      ],
    );
  }
}