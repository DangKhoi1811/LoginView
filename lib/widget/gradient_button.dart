import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final EdgeInsetsGeometry margin;

  GradientButton({
    this.title = '',
    @required this.onTap,
    this.margin = const EdgeInsets.only(top: 20, bottom: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: double.infinity,
      width: 260,
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Colors.blue,
            Colors.blueGrey
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
      ),
    );
  }
}
