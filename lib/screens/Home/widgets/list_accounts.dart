import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/models/account_model.dart';

Widget listAccounts() {
  return Builder(
    builder: (context) {
      return Container(
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
                  '₦ ' + account.balance,
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
                  account.number,
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
      );
    },
  );
}
