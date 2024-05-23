class UserData {
  final String? name;
  final String? email;
  final String? level;

  UserData({
    this.name,
    this.email,
    this.level,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      name: json['username'],
      level: json['level'],
    );
  }
}
