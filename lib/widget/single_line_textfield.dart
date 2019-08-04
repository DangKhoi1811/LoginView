import 'package:flutter/material.dart';

class SingleLineTextField extends StatefulWidget {
  final String title;
  final bool isPassword;
  final Function(String) validator;
  final TextEditingController controller;
  final TextInputType inputType;

  final bool enabled;

  final double size;

  SingleLineTextField(
      {@required this.title,
        this.isPassword = false,
        this.validator,
        this.controller,
        this.inputType = TextInputType.text,
        this.enabled = true,
        this.size = 260});

  @override
  _SingleLineTextFieldState createState() => _SingleLineTextFieldState();
}

class _SingleLineTextFieldState extends State<SingleLineTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: widget.size,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
//            height: 45,
            child: TextFormField(
              keyboardType: widget.inputType,
              controller: widget.controller,
              validator: widget.validator,
              maxLines: 1,
              obscureText: widget.isPassword,
              enabled: widget.enabled,
              decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
