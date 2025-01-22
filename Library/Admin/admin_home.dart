import 'package:flutter/material.dart';
import 'package:my_pro/admin/add_food.dart';
import 'package:my_pro/widgets/widget_support.dart';
class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),

        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Center(
              child: Text("Admin Home Page",style: AppWidget.HeadlineTextFeildStyle(),),),
            SizedBox(height: 30.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFood()));
              },
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xffff416c), Color(0xffff4b2b)],
                          begin: Alignment.topLeft,end: Alignment.bottomRight,),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.all(6.0),
                          child: Image.asset("images/add_food_logo.jpg",height: 100,width: 100,fit: BoxFit.cover),),
                      SizedBox(width: 30,),
                        Text("Add Food Items",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        
      ),
    );
  }
}
