import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/utils/color_constants.dart';

class RequestLoanScreen extends StatefulWidget {
  @override
  _RequestLoanScreenState createState() => _RequestLoanScreenState();
}

class _RequestLoanScreenState extends State<RequestLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
          onPressed: Navigator.of(context).pop,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'Loan Request',
          style: GoogleFonts.nunito(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: kBlackColor,
          ),
        ),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(left: 24, top: 32, bottom: 16, right: 24),
                child: Text(
                  'Amount',
                  style: GoogleFonts.nunito(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, bottom: 16, right: 24),
                child: Container(
                  height: 30,
                  child: TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: "Enter the required amount",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val.length == 0) {
                        return "Amount cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () async {
                    if (_amountController.text.isNotEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                "Your loan request is being reviewed and you will be notified of the status in 36 hours."),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () async {
                                  try {
                                    var firebaseUser =
                                        FirebaseAuth.instance.currentUser;
                                    int oldAccountBalance;

                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(firebaseUser.uid)
                                        .get()
                                        .then((value) {
                                      oldAccountBalance =
                                          value.data()["accountBalance"];
                                    });

                                    int newAccountBalance = oldAccountBalance +
                                        int.parse(_amountController.text);

                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(firebaseUser.uid)
                                        .update({
                                      "accountBalance": newAccountBalance
                                    }).then((_) {
                                      print("success!");
                                    });
                                  } catch (e) {
                                    print(e);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text(e.toString()),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: new Text("OK"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                _amountController.clear();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                  Navigator.of(context).pop();
                                  Future.delayed(const Duration(seconds: 3),
                                      () {
                                    AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                          id: 10,
                                          channelKey: 'basic_channel',
                                          title: 'Loan Request Approved',
                                          body:
                                              'Your loan request has been approved. You will be credited shortly.'),
                                    );
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                                'Please enter the amount you want to borrow'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _amountController.clear();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    width: MediaQuery.of(context).size.width * 0.55,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    child: Text(
                      "Request Loan",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}