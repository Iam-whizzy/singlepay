//import 'package:Singlepay/SplashScreen.dart';
import 'package:singlepay/screens/CardScreen.dart';
import 'package:singlepay/screens/HomeScreen.dart';
//import 'package:Singlepay/src/welcomePage.dart';
//import 'package:Singlepay/src/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/*var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Singlepay(),
};*/
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Singlepay',
      theme: ThemeData(
        //Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      home: Singlepay(),
      //home: Singlepay(),
      //routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
class Singlepay extends StatefulWidget {
  @override
  _SinglepayState createState() => _SinglepayState();
}
class _SinglepayState extends State<Singlepay> {
  var screens = [
    HomeScreen(),
    CardScreen(),
  ]; //screens for each tab
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), title: Text("Account")),
        ],
        onTap: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        showUnselectedLabels: true,
        iconSize: 30,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 3,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[selectedTab],
    );
  }
}

