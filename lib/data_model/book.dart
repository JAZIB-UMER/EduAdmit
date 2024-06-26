import 'package:flutter/material.dart';

class Book with ChangeNotifier {
  final String? title;
  final String? author;
  final String? rating;
  final String? thumbnailUrl;
  final String? description;
  final String? previewLink;

  Book({
    required this.title,
    required this.author,
    this.rating,
    this.thumbnailUrl,
    this.description,
    this.previewLink,
  });
}
