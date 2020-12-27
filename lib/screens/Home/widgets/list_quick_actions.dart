import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/utils/color_constants.dart';

Widget listQuickActions(BuildContext context) {
  return Container(
    height: 304,
    child: ListView(
      padding: EdgeInsets.only(left: 16, right: 16),
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 8),
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color(0x04000000),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0.0, 8.0))
              ],
              color: kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhiteGreyColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/dana_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Mobile Top Up',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Text(
                        'Buy airtime or data',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: kGreyColor),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color(0x04000000),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0.0, 8.0))
              ],
              color: kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhiteGreyColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/gopay_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Send Money',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Text(
                        'Easily send money anywhere',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: kGreyColor),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color(0x04000000),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0.0, 8.0))
              ],
              color: kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhiteGreyColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/gopay_logo.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Pay Bills',
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Text(
                        'Pay all bills from a single spot',
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: kGreyColor),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pushNamed('/loan'),
          child: Container(
            margin: EdgeInsets.only(bottom: 8),
            height: 68,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x04000000),
                      blurRadius: 10,
                      spreadRadius: 10,
                      offset: Offset(0.0, 8.0))
                ],
                color: kWhiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kWhiteGreyColor,
                        image: DecorationImage(
                          image: AssetImage('assets/images/gopay_logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Loans',
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: kBlackColor),
                        ),
                        Text(
                          'Get loans completely hassle free',
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: kGreyColor),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
