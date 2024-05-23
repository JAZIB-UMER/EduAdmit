import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipCard extends StatelessWidget {
  final String scholarshipName;
  final String provider;
  final String deadline;
  final String description;
  final String link;
  final String date;
  final String userLevel;
  final VoidCallback onPress;

  const ScholarshipCard({
    required this.scholarshipName,
    required this.provider,
    required this.deadline,
    required this.description,
    required this.link,
    required this.onPress,
    required this.date,
    required this.userLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    onTap: onPress,
                    child: Icon(
                      size: userLevel == 'admin' ? 20 : 0,
                      Icons.delete,
                      color: Colors.red,
                    )),
              ),
              Text(
                scholarshipName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Provider: $provider',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                'Deadline: $deadline',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(link));
                },
                child: Text(
                  link,
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  date,
                  style: const TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
