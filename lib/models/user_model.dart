class UserData {
  final String uid;
  final String displayName;
  final String creationDate;
  final int avatar;

  const UserData({
    this.uid,
    this.displayName,
    this.creationDate,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uid: json['uID'].toString(),
      displayName: json['displayName'].toString(),
      creationDate: json['creationDate'].toString(),
      avatar: json['avatar'] as int,
    );
  }
}
