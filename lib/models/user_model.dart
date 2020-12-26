class UserData {
  final String uid;
  final String displayName;
  final int accountNumber;

  const UserData({
    this.accountNumber,
    this.uid,
    this.displayName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'accountNumber': accountNumber
    };
  }

  UserData.fromFirestore(Map<String, dynamic> firestore)
      : uid = firestore['uid'],
        displayName = firestore['displayName'],
        accountNumber = firestore['accountNumber'];
}
