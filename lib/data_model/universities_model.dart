class Admission {
  bool admission;
  String bgImage;
  String description;
  String email;
  String lastDate;
  String link;
  String location;
  String name;
  String phoneNo;
  int rank;
  String logo;
  String scholarshipsLink;

  Admission({
    required this.admission,
    required this.bgImage,
    required this.description,
    required this.email,
    required this.lastDate,
    required this.link,
    required this.location,
    required this.name,
    required this.phoneNo,
    required this.rank,
    required this.logo,
    required this.scholarshipsLink,
  });

  factory Admission.fromJson(Map<String, dynamic> json) {
    return Admission(
      admission: json['admission'] ?? false,
      bgImage: json['bgImage'] ?? '',
      description: json['description'] ?? '',
      email: json['email'] ?? '',
      lastDate: json['lastDate'] ?? '',
      link: json['link'] ?? '',
      location: json['location'] ?? '',
      name: json['name'] ?? '',
      phoneNo: json['phoneNo'] ?? '',
      rank: json['rank'] ?? 0,
      logo: json['logo'] ?? '',
      scholarshipsLink: json['scholarshipsLink'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'admission': admission,
      'bgImage': bgImage,
      'description': description,
      'email': email,
      'lastDate': lastDate,
      'link': link,
      'location': location,
      'name': name,
      'phoneNo': phoneNo,
      'rank': rank,
      'logo': logo,
      'scholarshipsLink': scholarshipsLink,
    };
  }
}
