import 'package:flutter/material.dart';
import 'package:login/widget/dialog/noti_dialog.dart';
import 'package:login/widget/gradient_button.dart';

const double padding = 14.0;

class ErrorDialog extends StatelessWidget {
  final VoidCallback onPress;

  ErrorDialog({
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: padding * 2,
            bottom: padding ,
            left: padding*2,
            right: padding*2,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                'LOGIN_ERROR',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

              GradientButton(
                title: 'OK',
                onTap: onPress,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
