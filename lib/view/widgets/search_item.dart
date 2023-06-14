// ignore_for_file: file_names, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:medical_app/data/model/search_model.dart';

import '../../core/constant/linkapi.dart';

class SearchItem extends StatefulWidget {
  SearchModel searchModel;
  void Function()? ontap;
  SearchItem({super.key, required this.searchModel, required this.ontap});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: InkWell(
            onTap: widget.ontap,
            child: Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.white),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        '$linkImageRoot/${widget.searchModel.docImg}',
                        // 'https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*',
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Dr ${widget.searchModel.docName}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 15.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '${widget.searchModel.docCat} (MBBS,FCPS)',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              // Icon(
                              //   Icons.av_timer,
                              //   size: 12.0,
                              // ),
                              // Text(
                              //   '12.00pm - 4.00pm',
                              //   style: TextStyle(fontSize: 11),
                              // ),
                              // SizedBox(
                              //   width: 4,
                              // ),
                              const Icon(
                                Icons.location_on,
                                size: 12.0,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: Text(
                                  '${widget.searchModel.docCity}',
                                  style: const TextStyle(fontSize: 15),
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
                    // Column(children: [
                    //   IconButton(
                    //       onPressed: () {},
                    //       icon: const Icon(Icons.more_vert_rounded)),
                    //   const SizedBox(
                    //     height: 30,
                    //   )
                    // ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
