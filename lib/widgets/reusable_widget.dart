import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

TextField reusableTextField (String text, bool isPassword, TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPassword,
    enableSuggestions: !isPassword,
    autocorrect: !isPassword,
    cursorColor: Colors.black,
    style: TextStyle(color: HexColor("#3E3A39"), fontFamily: 'Bainsley'),
    decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: const BorderSide(width: 0, style: BorderStyle.none))
    ),
    keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}
Image catWidget(String imageName){
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 271,
    height: 300
  );
}