import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/models/transaction_model.dart';
import 'package:zenbank/utils/color_constants.dart';

Widget listTransactions() {
  return Container(
    height: 190,
    child: ListView.builder(
      padding: EdgeInsets.only(left: 16, right: 8),
      scrollDirection: Axis.horizontal,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(right: 8),
          height: 190,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                  color: Color(0x04000000),
                  blurRadius: 10,
                  spreadRadius: 10,
                  offset: Offset(0.0, 8.0))
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 16,
                left: 16,
                child: SvgPicture.asset(transactions[index].type),
                height: 24,
                width: 24,
              ),
              Positioned(
                top: 64,
                left: 16,
                child: Text(
                  transactions[index].signType +
                      '₦ ' +
                      transactions[index].amount,
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: transactions[index].colorType),
                ),
              ),
              Positioned(
                left: 16,
                top: 106,
                child: Text(
                  transactions[index].information,
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kGreyColor),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 48,
                child: Text(
                  transactions[index].recipient,
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: kBlackColor),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 22,
                child: Text(
                  transactions[index].date,
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kGreyColor),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
