import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zenbank/models/quick_actions_model.dart';
import 'package:zenbank/utils/color_constants.dart';

Widget listQuickActions() {
  return Container(
    height: 304,
    child: ListView.builder(
      padding: EdgeInsets.only(left: 16, right: 16),
      itemCount: wallets.length,
      itemBuilder: (context, index) {
        return Container(
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
                        image: AssetImage(wallets[index].walletLogo),
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
                        wallets[index].name,
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: kBlackColor),
                      ),
                      Text(
                        wallets[index].wallet,
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
        );
      },
    ),
  );
}
