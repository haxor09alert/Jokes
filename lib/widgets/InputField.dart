import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({
    super.key,
    required this.controller
  });
  TextEditingController controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}
bool showPassword = false;
class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: showPassword ? 
          IconButton(
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(Icons.visibility)
          ):
          IconButton(
            onPressed: (){
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(Icons.visibility_off),
      ),),
      obscureText: showPassword,
      validator:(value){
        if(value!.isEmpty){
          return 'Please enter your password.';
        }

        return null;
      }
    );
  }
}