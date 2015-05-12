/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
} = React;


// Load Up our Native Module..
var {
    RNReverseGeo
} = require('NativeModules');

var RNReverseGeoDemo = React.createClass({

  componentDidMount: function() {
    RNReverseGeo.geoCodeAddress("370 Tompkins Ave, Brooklyn, NY 11216", 
      function(_results){
        console.log(_results);
        this.setState({
          reverseGeoResults : JSON.stringify(_results)
        })
      });
  },

  render: function() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          {this.state.reverseGeoResults}
        </Text>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RNReverseGeoDemo', () => RNReverseGeoDemo);
