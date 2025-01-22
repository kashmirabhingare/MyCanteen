import 'package:flutter/material.dart';
import 'package:my_pro/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pro/pages/bottomnav.dart';
import 'package:my_pro/pages/forgotpassword.dart';
import 'package:my_pro/widgets/widget_support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email ="", password="";

  final _formkey= GlobalKey<FormState>();

  TextEditingController useremailcontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();

  userLogin()async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(backgroundColor: Colors.pink,content: Text("Login Successfully", style: TextStyle(fontSize: 20.0,color: Colors.white),))));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
    }on FirebaseException catch(e){
      //print(e.code);
      if(e.code=='channel-error'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white70,content: Text("No user Found with this email!",style: TextStyle(fontSize: 18.0,color: Colors.black),)));
      }else if(e.code=='invalid-credential'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.white70,content: Text("Incorrect Password!",style: TextStyle(fontSize: 18.0,color: Colors.black),)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child:
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(gradient: LinearGradient(
                  colors: [Color(0xffff416c), Color(0xffff4b2b)], stops: [0, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,





                ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5),
                height:  MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
                child:
                Text(""),
              ),
              Container(
                margin: EdgeInsets.only(left: 25.0,right: 25.0,top: 80.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width/2.8,
                      height: MediaQuery.of(context).size.height/5.8,
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        child: Center(
                          child: Image.asset("images/final_logo.jpg",
                            width: MediaQuery.of(context).size.width/3,
                            height: MediaQuery.of(context).size.height/6,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Material(
                      borderRadius: BorderRadius.circular(20.0),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/2,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.0)),
                        child:
                        Form(
                          key: _formkey,
                          child: Column(children: [
                            SizedBox(height: 30.0,),
                            Text("Login",style: AppWidget.HeadlineTextFeildStyle()),
                            SizedBox(height: 12.0,),
                            TextFormField(
                              controller: useremailcontroller,
                              validator: (value){
                                if (value==null||value.isEmpty){
                                  return 'Please Enter Email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.email)),

                            ),
                            SizedBox(height: 30.0,),

                            TextFormField(
                              controller: userpasswordcontroller,
                              validator: (value){
                                if (value==null||value.isEmpty){
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.password)),

                            ),
                            SizedBox(height: 12.0,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                              },
                              child: Container(
                                alignment: Alignment.topRight,
                                child:
                                Text(
                                  "Forgot Password ?",style: TextStyle(fontSize: 18,fontFamily: "Lora"),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0,),
                            GestureDetector(
                              onTap: (){
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email=useremailcontroller.text;
                                    password=userpasswordcontroller.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 5.0),

                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xffff416c),borderRadius: BorderRadius.circular(15)),
                                  child:
                                  Center(
                                    child: Text("LOGIN",style:
                                    TextStyle(color: Colors.white,
                                        fontSize: 20.0,fontFamily: "Lora",fontWeight: FontWeight.bold)
                                      ,),
                                  )
                                  ,),
                              ),
                            ),

                          ],),
                        ),),
                    ),
                    SizedBox(height: 70.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      },
                      child: Text("Don't have an account ? SignUp",style: TextStyle(
                        fontSize:18.0,
                        fontWeight:FontWeight.normal,
                        fontFamily: "Lora",),),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
