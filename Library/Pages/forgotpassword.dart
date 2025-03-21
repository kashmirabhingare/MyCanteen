import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_pro/pages/signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller = new TextEditingController();

  String email="";

  final _formkey = GlobalKey<FormState>();

  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset Password email has been sent !",style: TextStyle(fontSize: 18.0),)));
    }on FirebaseException catch(e){
      if(e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No user found with this email.",style: TextStyle(fontSize: 18.0),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Column(
        children: [
          SizedBox(height: 70.0,),
          Container(
            alignment: Alignment.topCenter,
            child: Text("Password Recovery",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0,),
          Text("Enter your mail",style:
          TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold),),
          Expanded(
            child:Form(
              key: _formkey,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0,right: 10.0),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10.0,right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return 'Please Enter an Email';
                          }
                          return null;
                        },
                        style: TextStyle(
                        ),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 18.0,
                            ),
                            prefixIcon: Icon(Icons.person,
                              size: 30.0,),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 40.0,),

                    GestureDetector(
                      onTap: (){
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            email=mailcontroller.text;
                          });
                          resetPassword();
                        }
                      },
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text("Send Email",style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?",style: TextStyle(fontSize: 18,),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                          },
                          child: Text(" Create an Account",style: TextStyle(color: Color.fromARGB(
                              229, 238, 32, 120),fontSize: 20.0,fontWeight: FontWeight.bold,fontFamily: 'Lora'),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],),),
    );
  }
}
