import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:my_pro/pages/home.dart';
import 'package:my_pro/pages/order.dart';
import 'package:my_pro/pages/wallet.dart';
import 'package:my_pro/pages/profile.dart';
class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {

  int currentTabIndex=0;
  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Wallet wallet;
  late Order order;

  @override
  void initState() {
    homepage=Home();
    order=Order();
    wallet=Wallet();
    profile=Profile();
    pages=[homepage,order,wallet,profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: [
          Icon(Icons.home_outlined,color: Colors.white,),
          Icon(Icons.shopping_bag_outlined,color: Colors.white,),
          Icon(Icons.wallet_outlined,color: Colors.white,),
          Icon(Icons.person_outlined,color: Colors.white,)

        ],),
      body: pages[currentTabIndex],



    );
  }
}
