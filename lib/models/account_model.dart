import 'package:flutter/material.dart';
import 'package:zenbank/utils/color_constants.dart';

class AccountModel {
  String name;
  String type;
  String balance;
  String number;
  String moreIcon;
  String cardBackground;
  Color bgColor;
  Color firstColor;
  Color secondColor;

  AccountModel(
      {this.name,
      this.type,
      this.balance,
      this.number,
      this.moreIcon,
      this.cardBackground,
      this.bgColor,
      this.firstColor,
      this.secondColor});
}

final account = AccountModel(
  name: "Savings",
  type: "assets/images/mastercard_logo.png",
  balance: "6 352 250",
  number: "3461097656",
  moreIcon: 'assets/icons/more_icon_grey.svg',
  cardBackground: 'assets/icons/mastercard_bg.svg',
  bgColor: kMasterCardColor,
  firstColor: kGreyColor,
  secondColor: kBlackColor,
);
