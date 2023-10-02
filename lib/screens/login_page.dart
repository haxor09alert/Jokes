import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context){
    myColor =Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home.jpg"),
           fit: BoxFit.cover,
           colorFilter: 
           ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top:80, child:_buildTop()),
          Positioned(bottom: 0, child:_buildBottom()),
         ]),
      ),
    );
  }


  Widget _buildTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_sharp,
          size: 100,
          color: Colors.white,
          ),
          Text("VISION GO",
          style: TextStyle
          (color:Colors.white,
          fontSize :40,
          fontWeight: FontWeight.bold,
          letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _buildForm(),
        ),
      ),
    );
  }
  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome", style: TextStyle(
          color: myColor,
          fontSize: 32,
          fontWeight: FontWeight.w500
          ),
        ),
        _buildGreyText("Proceed to login to your account."),
        const SizedBox(height: 60),
        _buildGreyText("Email Address"),
        _buildInputField(emailcontroller),
        const SizedBox(height: 40),
        _buildGreyText("Password"),
        _buildInputField(passwordcontroller,isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForget(),
        const SizedBox(height: 20),
        _buildLoginButton(),
      ],
    );
  }

  Widget _buildGreyText(String text){
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }


  Widget _buildInputField(TextEditingController controller,
  {isPassword = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword ? Icon(Icons.remove_red_eye):Icon(Icons.done),
      ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: rememberUser, onChanged: (value){
              setState(() {
                
              });
            },
            ),
            _buildGreyText("Remember Me"),
          ],
        ),
        TextButton(onPressed: (){}, child: _buildGreyText("I forgot my password"))
      ],
    );
  }
  Widget _buildLoginButton(){
    return ElevatedButton(onPressed: (){
      debugPrint("Email: ${emailcontroller.text}");
      debugPrint("Pressed : ${passwordcontroller.text}");
    },
    style: ElevatedButton.styleForm(
      shape: const StadiumBorder(),
      elevation:20,
      shadowColor:myColor,
      minimumSize: const Size.fromHeight(60),
    ),
    child: const Text("LOGIN"),
    );
  }
}