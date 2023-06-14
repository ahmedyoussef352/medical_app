// ignore_for_file: sized_box_for_whitespace, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class SliderItem extends StatefulWidget {
  String name;
  String category;
  String image;
  SliderItem(
      {super.key,
      required this.name,
      required this.category,
      required this.image});

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.only(left: 10, top: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Looking For Your Desire',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Specialist Doctor ?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. ${widget.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${widget.category} Spelist',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          'Good Health Clinic',
                          style: TextStyle(color: Colors.white, fontSize: 12.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Image.network(
                '${widget.image}',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
