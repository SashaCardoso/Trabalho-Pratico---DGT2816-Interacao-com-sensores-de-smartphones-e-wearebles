import 'package:flutter_notification_listener/flutter_notification_listener.dart';

class NotificationService {

    static final NotificationService _notificationService = NotificationService._internal();

    factory NotificationService() {
        return _notificationService;
    }

    NotificationService._internal();

    var onNotificationArray = <Function(NotificationEvent)>{};

    void onData(NotificationEvent event) {
        for (var fun in onNotificationArray) {
            fun(event);
        }
    }

    void registerFunction(Function(NotificationEvent) fun) {
        onNotificationArray.add(fun);
    }

    Future<void> initPlatformState() async {
        NotificationsListener.initialize();
        NotificationsListener.receivePort?.listen((evt) => onData(evt));
    }
}