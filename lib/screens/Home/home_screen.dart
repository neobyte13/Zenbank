import 'package:flutter/material.dart';
import 'package:zenbank/screens/Home/widgets/list_accounts.dart';
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
  @override
  Widget build(BuildContext context) {
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
            listAccounts(context),
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
            listQuickActions()
          ],
        ),
      ),
    );
  }
}
