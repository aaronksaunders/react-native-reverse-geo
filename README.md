# react-native-reverse-geo

React Native module bridge to convert address to geo coordinates.

Makes use of the following native iOS classes: 
* [CLGeocoder](https://developer.apple.com/library/prerelease/ios/documentation/CoreLocation/Reference/CLGeocoder_class/index.html)
* [CLPlacemark](https://developer.apple.com/library/prerelease/ios/documentation/CoreLocation/Reference/CLPlacemark_class/index.html)
* [MKPlacemark](https://developer.apple.com/library/mac/documentation/MapKit/Reference/MKPlacemark_Class/index.html)

## API


## Getting Started (and running the demo project)

1. From inside your project run `npm install react-native-reverse-geo --save`
2. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
3. Go to `node_modules` ➜ `react-native-reverse-geo` and add `RNReverseGeo.xcodeproj`
4. In XCode, in the project navigator, select your project. Add `libRNReverseGeo.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
5. Click `RNReverseGeo.xcodeproj` in the project navigator and go the `Build Settings` tab. Make sure 'All' is toggled on (instead of 'Basic'). Look for `Header Search Paths` and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React` - mark both as `recursive`.
6. RNReverseGeoRun your project (`Cmd+R`)

## Usage Example

```js
var React = require('react-native');

// Load Up our Native Module..
var {
    RNReverseGeo
} = require('NativeModules');

  componentDidMount: function() {
    RNReverseGeo.geoCodeAddress("370 Tompkins Ave, Brooklyn, NY 11216", 
      function(_results){
        console.log(_results);
        this.setState({
          reverseGeoResults : JSON.stringify(_results)
        })
      });
  },
```

There is an example project supplied with the repo in the RNReverseGeoDemo folder.