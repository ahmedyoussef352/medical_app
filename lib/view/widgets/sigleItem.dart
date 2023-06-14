// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SigleItem extends StatefulWidget {
  const SigleItem({super.key});

  @override
  State<SigleItem> createState() => _SigleItemState();
}

class _SigleItemState extends State<SigleItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 120,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Colors.white),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 70,
                height: 70,
                child: Image.network(
                  'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Text(
                            'Dr.Malek Khan',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 12.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                      'Carddiologist (MBBS,FCPS)',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.av_timer,
                          size: 12.0,
                        ),
                        Text(
                          '12.00pm - 4.00pm',
                          style: TextStyle(fontSize: 11),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(
                          Icons.location_on,
                          size: 12.0,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Text(
                            'New City Clinic',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
              Column(children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
                const SizedBox(
                  height: 30,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
