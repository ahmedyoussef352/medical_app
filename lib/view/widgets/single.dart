// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../core/constant/linkapi.dart';
import '../../data/model/info_model.dart';

class SingleCardDoc extends StatefulWidget {
  final void Function()? ontap;
  final InfoModel infoModel;
  const SingleCardDoc({super.key,required this.ontap,
      required this.infoModel,});

  @override
  State<SingleCardDoc> createState() => _SingleCardDocState();
}

class _SingleCardDocState extends State<SingleCardDoc> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, top: 5.0, bottom: 0.0),
          child: Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 10, top: 5, bottom: 8),
        child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      'Dr. ${widget.infoModel.docName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '${widget.infoModel.docCat} Specialist',
                      style: const TextStyle(fontSize: 11.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 15.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Column(
                      children:  [
                        const Text(
                          'Experience',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12.0),
                        ),
                        Text(
                           '${widget.infoModel.docYear} Years',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    // const Container(
                    //   child: ,
                    //  // backgroundColor: Colors.white,
          
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Column(
                  children: [
                    const Text(
                      'Patients',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 12.0),
                    ),
                    Text(
                      '${widget.infoModel.docPaitent}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 70,
              height: 180,
              child: Image.network(
                '$linkImageRoot/${widget.infoModel.docImg}',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        ),
          ),
          ),
      ),
      );
  }
}
