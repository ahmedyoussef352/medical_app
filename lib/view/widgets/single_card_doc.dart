// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../../core/constant/linkapi.dart';
import '../../data/model/info_model.dart';

class SingleCard extends StatefulWidget {
  final void Function()? ontap;
  final InfoModel infoModel;
  const SingleCard({super.key,required this.ontap,
      required this.infoModel,});

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, top: 5.0, bottom: 10.0,left: 5),
        child: MaterialButton(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          onPressed: widget.ontap,
          child: Container(
            width: double.infinity,
            height: double.infinity,
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
                  Expanded(
                  flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              'Dr ${widget.infoModel.docName}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0,
                                  ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                const Text(
                                  'Experience',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300, fontSize: 12.0),
                                ),
                                Text(
                                  '${widget.infoModel.docYear} Years',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 12.0),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text(
                              'Patients',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12.0),
                            ),
                            Text(
                              '${widget.infoModel.docPaitent}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          width: 70,
                          height: 150,
                         
                          child: Image.network(
                            '$linkImageRoot/${widget.infoModel.docImg}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 
                          8,
                        )
                      ],
                      
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
