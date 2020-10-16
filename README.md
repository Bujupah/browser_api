# Browser API

A library to easily implement the browser API native features into the flutter web such as [MediaStream Recorder](https://developer.mozilla.org/en-US/docs/Web/API/MediaRecorder), [Geolocation](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API), [Notifications](https://developer.mozilla.org/en-US/docs/Web/API/notification), etc...

![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)
[![pub package](https://img.shields.io/pub/v/browser_api.svg)](https://pub.dartlang.org/packages/browser_api)

**Show some ❤️ and shoot some stars to support the project**
## Usage

* **MediaStream Recorder**
    ```dart
    import 'package:browser_api/browser_api.dart';

    BrowserApi _browserApi = BrowserApi();

    _browserApi.audioRecorder.startRecording(onDataAvailable: (data) { });
    _browserApi.audioRecorder.stopRecording();
    _browserApi.audioRecorder.playAudio();
    _browserApi.audioRecorder.audioData
    ```
* **Web Notifications**
    ```dart
    import 'package:browser_api/browser_api.dart';

    BrowserApi _browserApi = BrowserApi();

    _browserApi.notify('Hello Peeps', onClick: () { print('Yay'); });
    ```

## Example
Import the library via

```dart
import 'package:browser_api/browser_api.dart';
```

Then use the `BrowserApi` in your code. To see how this is done,
check out the [browser_api example app](/example).

## Todo
- [x] Web Notification
- [ ] Web Audio Player
- [ ] Web Authentication
- [ ] Web Workers
- [ ] Web RTC
- [x] MediaStream Audio Recorder
- [ ] MediaStream Video Recorder
- [ ] Image Capture
- [ ] Geolocation
- [ ] Gamepad
- [ ] Fullscreen
- [ ] Battery
- [ ] Bluetooth
- [ ] etc...

## MIT License
```
Copyright (c) 2018 Khalil Mejdi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```