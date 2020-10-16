import 'dart:html';

class BrowserNotify{

  static BrowserNotify instance;
  factory BrowserNotify() => instance ??= BrowserNotify._internal();
  BrowserNotify._internal();

  void show(String title, {Function onClick, String dir, String body, String lang, String tag, String icon}) {
    if (!Notification.supported) {
      window.alert('Desktop notifications not available in your browser. Try Chromium.');
      return;
    }
    if (Notification.permission != 'granted')
      Notification.requestPermission();
    else {
      var notification = new Notification(title ?? 'Notification', 
        icon: icon ?? './favicon.ico',
        body: body,
        dir: dir,
        lang: lang,
        tag: tag
      );
      
      notification.onClick.listen((event) {
        if(event.type == 'click') {
          onClick();
        }
      });
    }
  }

}