import 'package:flutter/material.dart';
import 'package:wear_plus/wear_plus.dart';
import 'package:wearables2/notification_ui.dart';

class WatchFace extends StatelessWidget {
  const WatchFace({super.key});

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NotificationUi(context: context,)
          ],
        );
      },
    );
  }
}