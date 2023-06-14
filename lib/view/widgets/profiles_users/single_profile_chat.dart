// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:medical_app/data/model/profile_model.dart';

import '../../../core/constant/linkapi.dart';

class SingleItemChats extends StatefulWidget {
  final void Function()? ontap;
  final ProfileModel profileModel;
  const SingleItemChats({
    super.key,
    required this.ontap,
    required this.profileModel,
  });

  @override
  State<SingleItemChats> createState() => _SingleItemChatsState();
}

class _SingleItemChatsState extends State<SingleItemChats> {
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
                        '$linkImageRootprofile/${widget.profileModel.image}',
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
                                '${widget.profileModel.name}',
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
                          Text(
                            '${widget.profileModel.email}',
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
                                  '${widget.profileModel.address}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Text(
                              '${widget.profileModel.phone}',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
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
