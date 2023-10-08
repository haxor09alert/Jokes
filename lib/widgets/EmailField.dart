import 'package:flutter/material.dart';

class EmailWidget extends StatefulWidget {
  EmailWidget({
    super.key,
    required this.controller
  });
  TextEditingController controller;
  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}
bool valid = false;

class _EmailWidgetState extends State<EmailWidget> {
  @override
   Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (String? value){
          if(value !=null && !RegExp(r'^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$').hasMatch(value)){
            setState(() {
              valid = false;
            });
          }else{
            setState(() {
              valid= true;
            });
          }
      },
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.check, color: valid ? Colors.green : Colors.grey,)
        ),
      validator:(value){
        if(value!.isEmpty){
          return 'Please enter your email.';
        }
        return null;
      }
    );
  }
}