import 'package:echoar_unity_demo/constants.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Container(
          height: 375,
          width: 325,
          decoration: BoxDecoration(
            color: Constants.accentColor,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              Text("You received an arctic fox!", style: TextStyle(color: Constants.textColor, fontSize: 25)),
              Spacer(),
              Image.network(
                "https://media.discordapp.net/attachments/258768634283819008/716330977101611098/leonzafox.png",
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
