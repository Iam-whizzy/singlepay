import 'package:singlepay/screens/request.dart';
import 'package:singlepay/screens/send.dart';
//import 'package:singlepay/screens/topUp.dart';
import 'package:singlepay/screens/pay.dart';
import 'package:singlepay/apis/individual_registration.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          //Container for top data
          Container(
            margin: EdgeInsets.symmetric(horizontal: 22, vertical: 55),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    new Image.asset(
                      'assets/singlepaymainlogo6.png',
                      height: 5.0,
                      width: 20.0,
                      //fit: BoxFit.contain,
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/dp2.jpg",
                                //fit: BoxFit.contain,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: IconButton(
                              onPressed: () {
                                _navigateToNextScreen(context);
                              },
                              icon: Icon(Icons.arrow_upward),
                              color: Colors.blue[900],
                              iconSize: 30,
                            ),
                            padding: EdgeInsets.all(4),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Send",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.blue[100]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: IconButton(
                              onPressed: () {
                                _navigateToRequestScreen(context);
                                // navigateToSend(context);
                              },
                              icon: Icon(Icons.arrow_downward),
                              //Icon: Icons.send,
                              color: Colors.blue[900],
                              iconSize: 30,
                            ),
                            padding: EdgeInsets.all(4),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Receive",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.blue[100]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: IconButton(
                              onPressed: () {
                                _navigateToFormPageScreen(context);
                                // navigateToSend(context);
                              },
                              icon: Icon(Icons.trending_up),
                              //Icon: Icons.send,
                              color: Colors.blue[900],
                              iconSize: 30,
                            ),
                            padding: EdgeInsets.all(4),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Top Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.blue[100]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 245, 248, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: IconButton(
                              onPressed: () {
                                _navigateToPayScreen(context);
                                // navigateToSend(context);
                              },
                              icon: Icon(Icons.payment),
                              //Icon: Icons.send,
                              color: Colors.blue[900],
                              iconSize: 30,
                            ),
                            padding: EdgeInsets.all(4),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Pay",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.blue[100]),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 32, 0, 14),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "\Ksh 2589.90",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Available Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Colors.blue[100]),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          //draggable sheet
          DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                margin: new EdgeInsets.fromLTRB(0, 80, 0, 0),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Recent Transactions",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Text(
                              "See all",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.grey[800]),
                            )
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12),
                      ),
                      SizedBox(
                        height: 24,
                      ),

                      //Container for buttons
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                "All",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.grey[900]),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.0,
                                        spreadRadius: 4.5)
                                  ]),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.green,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Income",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.grey[900]),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.0,
                                        spreadRadius: 4.5)
                                  ]),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Expenses",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Colors.grey[900]),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.0,
                                        spreadRadius: 4.5)
                                  ]),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),
                      //Container Listview for expenses and incomes
                      Container(
                        child: Text(
                          "TODAY",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.lightBlue[900],
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Payment",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment from Bob",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "+\Ksh 6000.0",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.lightGreen),
                                    ),
                                    Text(
                                      "02 Mar",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        child: Text(
                          "YESTERDAY",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[500]),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 32),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: Icon(
                                    Icons.payment_outlined,
                                    color: Colors.lightBlue[900],
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Petrol",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment to Gulf Energy",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "-\Ksh 5000.0",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "28 Feb",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.all(0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: Icon(
                                    Icons.payment_outlined,
                                    color: Colors.lightBlue[900],
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Brake Pads Repair",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment to Phoenix Mechanics",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "-\Ksh 3500.0",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "28 Feb",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 32),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(18))),
                                  child: Icon(
                                    Icons.payment_outlined,
                                    color: Colors.lightBlue[900],
                                  ),
                                  padding: EdgeInsets.all(12),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Oil",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[900]),
                                      ),
                                      Text(
                                        "Payment to Gulf Energy",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.grey[500]),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "-\Ksh 700.0",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.orange),
                                    ),
                                    Text(
                                      "28 Feb",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[500]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        itemCount: 1,
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        controller: ScrollController(keepScrollOffset: false),
                      ),

                      //now expense
                    ],
                  ),
                  controller: scrollController,
                ),
              );
            },
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 1,
          )
        ],
      ),
    );
  }
}

//On tap icons functions
void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FirstApp()));
}

void _navigateToRequestScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => ReceiveApp()));
}

void _navigateToFormPageScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => FormPage()));
}

void _navigateToPayScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PayScreen()));
}
