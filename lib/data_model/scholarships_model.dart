class Scholarship {
  final String name;
  final String provider;
  final String deadline;
  final String description;
  final String scholarshipId;
  final String link;
  final String date;

  Scholarship({
    required this.name,
    required this.provider,
    required this.deadline,
    required this.description,
    required this.scholarshipId,
    required this.link,
    required this.date,
  });

  factory Scholarship.fromJson(Map<String, dynamic> json) {
    return Scholarship(
      name: json['name'] ?? '',
      provider: json['provider'] ?? '',
      deadline: json['deadline'] ?? '',
      description: json['description'] ?? '',
      scholarshipId: json['scholarshipId'] ?? '',
      link: json['link'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'provider': provider,
      'deadline': deadline,
      'description': description,
      'scholarshipId': scholarshipId,
      'link': link,
      'date': date,
    };
  }
}
