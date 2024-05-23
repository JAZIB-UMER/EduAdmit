import 'package:flutter/material.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =
        TextEditingController(); // Add TextEditingController for search functionality

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              border: showBorder ? Border.all(color: Colors.grey) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextField(
                  enabled: false,
                  controller:
                      searchController, // Assign controller to TextField
                  decoration: InputDecoration.collapsed(
                    hintText: text,
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                  onChanged: (value) {
                    // Handle search logic here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
