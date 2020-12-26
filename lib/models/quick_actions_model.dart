class WalletModel {
  String name;
  String wallet;
  String walletLogo;
  String walletNumber;

  WalletModel(this.name, this.wallet, this.walletLogo, this.walletNumber);
}

List<WalletModel> wallets = walletData
    .map((item) => WalletModel(
        item['name'], item['wallet'], item['walletLogo'], item['walletNumber']))
    .toList();

var walletData = [
  {
    "name": "Mobile Top Up",
    "wallet": "Buy airtime or data",
    "walletLogo": 'assets/images/dana_logo.png',
    "walletNumber": '+62*** **** 1932'
  },
  {
    "name": "Send Money",
    "wallet": "Easily send money anywhere",
    "walletLogo": 'assets/images/gopay_logo.png',
    "walletNumber": '+62*** **** 2245'
  },
  {
    "name": "Pay Bills",
    "wallet": "Pay all bills from a single spot",
    "walletLogo": 'assets/images/gopay_logo.png',
    "walletNumber": '+62*** **** 2245'
  },
  {
    "name": "Loans",
    "wallet": "Get loans completely hassle free",
    "walletLogo": 'assets/images/gopay_logo.png',
    "walletNumber": '+62*** **** 1932'
  }
];
