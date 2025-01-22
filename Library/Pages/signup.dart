import 'package:flutter/material.dart';
import 'package:my_pro/pages/login.dart';
import 'package:my_pro/service/database.dart';
import 'package:my_pro/service/shared_pref.dart';
import 'package:my_pro/widgets/widget_support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_pro/pages/bottomnav.dart';
import 'package:random_string/random_string.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String email ="", password="", name="", confirmpassword="";

  TextEditingController namecontroller= new TextEditingController();

  TextEditingController emailcontroller  = new TextEditingController();

  TextEditingController passwordcontroller = new TextEditingController();

  TextEditingController confirmpasswordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration()async{
    if (password!=null){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(backgroundColor: Colors.pink,content: Text("Registered Successfully", style: TextStyle(fontSize: 20.0,color: Colors.white),))));
        String Id = randomAlphaNumeric(10);
        Map<String,dynamic> addUserInfo = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Wallet":"0",
          "Id":Id,
        };
        await DatabaseMethods().addUserDetail(addUserInfo, Id);
        await SharedPreferenceHelper().saveUserName(namecontroller.text);
        await SharedPreferenceHelper().saveUserEmail(emailcontroller.text);
        await SharedPreferenceHelper().saveUserWallet("0");
        await SharedPreferenceHelper().saveUserId(Id);


        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
      }on FirebaseException catch(e){

        if(e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password provided is too weak",style: TextStyle(fontSize: 18.0),)));


        }
        else if(e.code=='email-already-in-use'){

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.pink,
              content: Text("Account already exists",style: TextStyle(fontSize: 18.0),

              )));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Bottomnav()));
        }
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
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 25.0,right: 25.0,top: 80),
                child:
                Column(

                  children:

                  [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width/2.8,
                      height: MediaQuery.of(context).size.height/5.8,
                      child:
                      Material(

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
                        height: MediaQuery.of(context).size.height/1.7,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20.0)),
                        child:
                        Form(
                          key: _formkey,
                          child: Column(children: [
                            SizedBox(height: 30.0,),
                            Text("SignUp",style: AppWidget.HeadlineTextFeildStyle()),
                            SizedBox(height: 15.0,),
                            TextFormField(
                              controller: namecontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return 'Please Enter Name ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.person_outlined)),

                            ),
                            SizedBox(height: 12.0,),
                            TextFormField(
                              controller: emailcontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return 'Please Enter E-mail Id ';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.email)),

                            ),
                            SizedBox(height: 12.0,),

                            TextFormField(
                              controller: passwordcontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return 'Please Enter Password ';
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
                            TextFormField(
                              controller: confirmpasswordcontroller,
                              validator: (value){
                                if(value==null|| value.isEmpty){
                                  return 'Please Re-Enter Password ';
                                }
                                if(value!=passwordcontroller.text){
                                  return 'Password Does not Match';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: AppWidget.semiBoldTextFeildStyle(),
                                  prefixIcon: Icon(Icons.password_outlined)),

                            ),
                            SizedBox(height: 45.0,),

                            GestureDetector(
                              onTap: ()async{
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email= emailcontroller.text;
                                    name = namecontroller.text;
                                    password = passwordcontroller.text;
                                    confirmpassword = confirmpasswordcontroller.text;

                                  });
                                }
                                registration();
                              },
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 7.0),

                                  width: 200,
                                  decoration: BoxDecoration(color: Color(0xffff416c),borderRadius: BorderRadius.circular(15)),
                                  child:
                                  Center(
                                    child: Text("SIGNUP",style:
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
                    SizedBox(height: 40.0,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()));
                      },
                      child: Text("Have an account ? Login",style: TextStyle(
                        fontSize:18.0,
                        fontWeight:FontWeight.normal,
                        fontFamily: "Lora",),),
                    )
                  ],
                ),
              ),

            ],
          ),
        )


    );
  }
}
