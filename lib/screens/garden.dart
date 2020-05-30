import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;

class Garden extends StatefulWidget {
  Garden({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GardenState createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GFButton(
        color: Constants.accentColor,
        textColor: Constants.textColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => UnityViewPage()));
          },
        text: "Open Garden",
        size: GFSize.LARGE,
        shape: GFButtonShape.pills,
      ),
    );
  }
}

class UnityViewPage extends StatefulWidget {
  @override
  _UnityViewPageState createState() => _UnityViewPageState();
}

class _UnityViewPageState extends State<UnityViewPage> {
  UnityViewController unityViewController;

  double _sliderValue = 1.0;
  String _projectKey = 'withered-bar-7665';
  String _entryID = '970b8253-718e-4728-aa11-3e9a2ddd342e';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('echoAR unity app'),
      ),
      body: Stack(
        children: <Widget>[
          UnityView(
            onCreated: onUnityViewCreated,
            onReattached: onUnityViewReattached,
            onMessage: onUnityViewMessage,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              elevation: 10,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text("Model Scale:"),
                  ),
                  Slider(
                    onChanged: (value) {
                      setState(() {
                        _sliderValue = value;
                      });
                      setScale(value.toString());
                    },
                    value: _sliderValue,
                    min: 0.1,
                    max: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onUnityViewCreated(UnityViewController controller) {
    print('onUnityViewCreated');

    unityViewController = controller;
  }

  void onUnityViewReattached(UnityViewController controller) {
    print('onUnityViewReattached');
  }

  void onUnityViewMessage(UnityViewController controller, String message) {
    print('onUnityViewMessage');

    print(message);
  }

  void setScale(String scale) {
    String url = 'https://console.echoar.xyz/post';
    print(scale);
    http.post(url, body: {
      'key': _projectKey,
      'entry': _entryID,
      'data': 'scale',
      'value': scale
    }).then((value) => print(value.body));
  }
}
