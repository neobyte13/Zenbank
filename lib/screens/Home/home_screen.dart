import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zenbank/models/account_model.dart';
import 'package:zenbank/screens/Home/widgets/list_quick_actions.dart';
import 'package:zenbank/screens/Home/widgets/list_transactions.dart';
import 'package:zenbank/utils/color_constants.dart';
import 'package:zenbank/utils/custom_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/utils/shared_prefs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int accBal = 0;
  String accNum = "000000000";

  @override
  void initState() {
    getDetails();
    Timer.periodic(Duration(seconds: 5), (timer) {
      getDetails();
    });
    AwesomeNotifications().actionStream.listen((receivedNotification) {
      Navigator.of(context).pushNamed('/home' //arguments: {
          // id: receivedNotification.id
          //} // your page params. I recommend to you to pass all *receivedNotification* object
          );
    });
    super.initState();
  }

  Future getDetails() {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    int _accBal;
    String _accNum;
    return FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .get()
        .then((value) {
      _accBal = value.data()["accountBalance"];
      accBal = _accBal;

      _accNum = value.data()["accountNumber"];
      accNum = _accNum;
      print(accNum);
    });
  }

  @override
  Widget build(BuildContext context) {
    String _accNumBuild = accNum;
    int _accBalBuild = accBal;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            MyFlutterApp.navigation_drawer,
            color: kBlackColor,
          ),
          onPressed: () {},
          padding: EdgeInsets.only(left: 8),
        ),
      ),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Greeting
            Padding(
              padding: EdgeInsets.only(left: 24, top: 8, bottom: 16),
              child: Text(
                "Welcome, ${sharedPrefs.username}",
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ),
            ),
            //Show account (accounts)
            Container(
              height: 175,
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 8),
                margin: EdgeInsets.only(right: 8),
                height: 175,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: account.bgColor,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0.0, 8.0))
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 16,
                      top: 12,
                      child: Image.asset(
                        account.type,
                        height: 22,
                        width: 33,
                      ),
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: SvgPicture.asset(account.cardBackground),
                    ),
                    Positioned(
                      top: 14,
                      right: 12,
                      child: Text(
                        account.name,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: account.firstColor),
                      ),
                    ),
                    Positioned(
                      top: 63,
                      left: 16,
                      child: Text(
                        'Current Balance',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: account.firstColor),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 81,
                      child: Text(
                        '₦ ' + _accBalBuild.toString(),
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: account.secondColor),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 30,
                      child: Text(
                        'Account Number',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: account.firstColor),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 12,
                      child: Text(
                        _accNumBuild,
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: account.secondColor),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: SvgPicture.asset(
                        account.moreIcon,
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            //Show most recent transactions.
            Padding(
              padding:
                  EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Last Transactions',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor,
                    ),
                  ),
                  Text(
                    'See all transactions',
                    style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
            ),
            listTransactions(),
            // Top Up Section
            Padding(
              padding:
                  EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
              child: Text(
                'Quick actions',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ),
            ),
            listQuickActions(context)
          ],
        ),
      ),
    );
  }
}
