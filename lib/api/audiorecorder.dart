import 'dart:html';
import 'dart:js';
import 'dart:typed_data';

class BrowserRecorder {

  MediaRecorder _recorder;
  AudioElement _audioElement;
  AudioData _audioData;

  static BrowserRecorder instance;
  factory BrowserRecorder() => instance ??= BrowserRecorder._internal();
  BrowserRecorder._internal();

  
/// ```dart
/// class AudioData {
///   final int size;
///   final String type;
///   final String url;
///   final Uint8List data;
/// 
///   AudioData(this.size, this.type, this.url, this.data);
/// 
///   @override
///   String toString() {
///     return 'AudioData(size: $size, type: $type, url: $url)';
///   }
/// }
/// ```
/// {@end-tool}
/// {@tool snippet}
  AudioData get audioData => _audioData;

  String get status => _recorder?.state ?? 'recording';
  
  bool get hasData => _audioData != null;
  
  void startRecording({Function(AudioData) onDataAvailable}) {
    window.navigator.mediaDevices.getUserMedia({ 'audio': true })
    .then((stream) {
      _recorder = MediaRecorder(stream);
      _recorder.start();
      _recorder.addEventListener("dataavailable", (event) {
        // Retreive audio data chunks from js object then
        // Convert it to a single audio data blob
        Blob blob = JsObject.fromBrowserObject(event)['data'];
        
        // Create a URL for that single audio data blob
        final audioUrl = Url.createObjectUrl(blob);

        FileReader reader = FileReader();
        // Convert the blob to a flutter readable object Uint8List
        reader.readAsArrayBuffer(blob);

        reader.onLoadEnd.listen((event) async {
          _audioData = AudioData(blob.size, blob.type, audioUrl, reader.result);
          onDataAvailable?.call(_audioData);
          // Can call a callback from here
        });

      });
    });
  }

  void stopRecording() {
    _recorder.stop();
  }

  void playAudio() {
    if(_audioData?.url == null) 
      print('No audio data');
    _audioElement = AudioElement();
    _audioElement.src = _audioData.url;
    _audioElement.volume = .8;
    _audioElement.play();
  }

  void stopAudio() {
    _audioElement?.pause();
  }
}

class AudioData {
  final int size;
  final String type;
  final String url;
  final Uint8List data;

  AudioData(this.size, this.type, this.url, this.data);

  @override
  String toString() {
    return 'AudioData(size: $size, type: $type, url: $url)';
  }
}