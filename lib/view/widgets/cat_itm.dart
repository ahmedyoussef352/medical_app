import 'package:flutter/material.dart';

class CatItem extends StatefulWidget {
  final String label;
  final String image;
  const CatItem({required this.label, required this.image, super.key});

  @override
  State<CatItem> createState() => _CatItemState();
}

class _CatItemState extends State<CatItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.image,
              width: 40,
              height: 40,
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              widget.label,
              style: const TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
