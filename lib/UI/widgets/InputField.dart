import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InputField extends StatelessWidget {
  final String labelText;
  final Function(String)? onSubmit;
 /* final bool multiline;
  final bool enabled;
  final bool isPassword;
  final bool isUsername;
  final Function(String) onChanged;

  final Function() onTap;
  final int maxLength;
  final TextAlign textAlign;*/
  final TextEditingController controller;
  //final TextInputType keyboardType;


  const InputField({ Key ?key, required this.labelText,required this.controller,this.onSubmit}) : super(key:key);
    //required this.onChanged, required this.onSubmit, required this.onTap, required this.keyboardType, required this.multiline, required this.textAlign, required this.maxLength, this.isPassword = false, this.isUsername = false, this.enabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: TextField(
       /* enabled: enabled,
        maxLength: maxLength,
        obscureText: isPassword,
        textAlign: this.textAlign == null ? TextAlign.left : this.textAlign,
        maxLines: multiline != null && multiline == true ? null : 1,
        keyboardType: keyboardType,
        inputFormatters: keyboardType == TextInputType.number ? <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ] : null,
        onChanged: onChanged,
        onSubmitted: onSubmit,
        onTap: onTap,*/
        onSubmitted: onSubmit,
        controller: controller,
        cursorColor: Colors.deepOrangeAccent.shade400,
        style: TextStyle(
          height: 1.0,
          color: Colors.deepOrangeAccent.shade400,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.deepOrangeAccent.shade400,
            ),
          ),
          fillColor: Colors.deepOrangeAccent.shade400,
          focusedBorder: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(30.0),
            borderSide: BorderSide(
              color: Colors.deepOrangeAccent.shade400,
            ),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.deepOrangeAccent.shade400,
          ),
        ),
      ),
    );
  }


}