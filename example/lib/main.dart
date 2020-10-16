import 'package:browser_api/browser_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  BrowserApi _browserApi = BrowserApi();

  void startRecording(){
    _browserApi.audioRecorder.startRecording();
  }

  void stopRecording(){
    _browserApi.audioRecorder.stopRecording();
  }

  void playAudio() {
    _browserApi.audioRecorder.playAudio();
  }

  void getAudioData() {
    showSnackbar(_browserApi.audioRecorder.audioData);
  }

  void openNotification() {
    _browserApi.notify.show('Hello Peeps', 
      onClick: () {
        print('Do something');
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('MediaRecorder'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildBtn('Record', Icons.radio, () => startRecording()),
                buildBtn('Stop', Icons.stop, () => stopRecording()),
                buildBtn('Play', Icons.play_arrow, () => playAudio()),
                buildBtn('Get Audio', Icons.info, () => getAudioData()),
              ],
            ),
            Text('Notification'),
            buildBtn('Notify', Icons.notification_important, () => openNotification()),
          ],
        ),
        ),
      ),
    );
  }
  
  Widget buildBtn(String label, IconData icon, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton.icon(
        label: Text(label),
        icon: Icon(icon),
        onPressed: onTap,
      ),
    );
  }

  void showSnackbar(message) {
    final snackBar = SnackBar(
      content: Text(message.toString()),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
