
# Region Detector

Listen to user click and drag events over specific regions of your app. When the drag enters a region enclosed by a `RegionDetector` widget,
a callback is triggered. A callback is also triggered when the pointer (user finger) leaves the `RegionDetector`.

## Features

![Screen Recording 2022-09-26 at 03 57 17](https://user-images.githubusercontent.com/37802577/192186634-57c35c21-8f8f-454a-87e1-2584667f4dfb.gif)


All `RegionDetector` widgets in the `FocusArea` can trigger callbacks: `onFocused` and `onFocusLoss`.


**FocusArea**: This widget provides a listener for pointer up and down events and then trigger callbacks on `RegionDetector` widgets when the pointer enters the region of such widgets. This widget must be an ancestor of `RegionDetector`.

**RegionDetector**: This widget is meant to wrap target child widgets whose regions are to be monitored for touch events and must be one of the children of a `FocusArea`. It turns the region/widget wrapped by this widget into a listener for callbacks.

**onFocused**: A callback function parameter attached to a `RegionDetector` which is called exactly once when the pointer enters the region of this widget while the pointer is clicked (down) or when the pointer is clicked while in the region of this widget.

**onFocusLoss**: A callback function parameter attached to a `RegionDetector` which is called exactly once when the pointer leaves the region of this widget while the pointer is clicked or when the pointer goes up while in the region of this widget.


## Getting started

Add dependency to project pubspec.yaml file.
```yaml
dependencies:
  flutter:
    sdk: flutter

  ...
  region_detector: [latest_version]
  ```

Add import statement to target dart file.

```dart
import 'package:region_detector/region_detector.dart';
```


## Usage

Check project in the `/example` folder for elaboration.

As earlier stated, the `FocusArea` must be an ancestor of `RegionDetector` widgets as shown below.

```dart
  Color color1 = Colors.amber;
  Color color2 = Colors.amber;
  Color color3 = Colors.amber;
  Color color4 = Colors.amber;
  
 @override
    Widget build(BuildContext context) {
        return Scaffold(
      body: Container(
        child: FocusArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RegionDetector(
                  onFocused: (){
                    setState(() {
                      color1 = Colors.pinkAccent;
                    });
                  },
                  onFocusLoss: (){
                    setState(() {
                      color1 = Colors.amber;
                    });
                  },
                  child: Container(
                    key: Key('con1'),
                    height: 100,
                    width: 100,
                    color: color1,
                  )
              ),
              RegionDetector(
                  onFocused: (){
                    setState(() {
                      color2 = Colors.pinkAccent;
                    });
                  },
                  onFocusLoss: (){
                    setState(() {
                      color2 = Colors.amber;
                    });
                  },
                  child: Container(
                    key: Key('con2'),
                    height: 100,
                    width: 100,
                    color: color2,
                  )
              ),
              RegionDetector(
                  onFocused: (){
                    setState(() {
                      color3 = Colors.pinkAccent;
                    });
                  },
                  child: Container(
                    key: Key('con3'),
                    height: 100,
                    width: 100,
                    color: color3,
                  )
              ),
              RegionDetector(
                  onFocused: (){
                    setState(() {
                      color4 = Colors.pinkAccent;
                    });
                  },
                  onFocusLoss: (){
                    setState(() {
                      color4 = Colors.amber;
                    });
                  },
                  child: Container(
                    key: Key('con4'),
                    height: 100,
                    width: 100,
                    color: color4,
                  )
              ),
            ],
          ),
        ),
      )
    );
  }

  ```

Resulting screen behaviour.

![Screen Recording 2022-09-26 at 05 10 47](https://user-images.githubusercontent.com/37802577/192192486-945688b4-e526-418f-a3a9-88c529ba845b.gif)


## Additional information

The use of Listener, MouseRegion or GestureDetector widgets lower down the widget tree after the `FocusArea` makes the widget tree prone to erratic behaviour. Common gestures can easily be replaced by `onFocused` event callback.

For contributions, feel free to open pull requests and file issues on the main github repository.

HAVE FUN !
