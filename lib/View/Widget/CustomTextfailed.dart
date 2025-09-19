import 'package:flutter/material.dart';

class Customtextfailed extends StatelessWidget {
  String lableText;
  String hintText;
  IconData iconData;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;

  TextEditingController controller;
   Customtextfailed({
     super.key, required this.iconData,required this.hintText,
     required this.lableText,required this.controller, this.validator,
     this.onTapIcon, this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator,
      controller:controller,
      obscureText:obscureText,
      decoration: InputDecoration(
          floatingLabelBehavior:FloatingLabelBehavior.always,
          contentPadding:const EdgeInsets.symmetric(vertical:5,horizontal:18),
          label: Text(lableText),
          hintText:hintText,
          suffixIcon:  InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(25),
          )
      ),
    );
  }
}
