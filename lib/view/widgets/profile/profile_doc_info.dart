// ignore_for_file: must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:medical_app/data/model/info_model.dart';
import 'package:medical_app/view/screens/doctor_screens/home_doc/home_layout_doc.dart';

import '../../../core/constant/image.assets.dart';
import '../../../core/constant/linkapi.dart';
import '../../componants/components.dart';

class ProfileItemDoc extends StatefulWidget {
  final InfoModel infoModel;

  const ProfileItemDoc({
    Key? key,
    required this.infoModel,
  }) : super(key: key);

  @override
  State<ProfileItemDoc> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItemDoc> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              // Expanded(
              //child:
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: 150,
                  child: Image.asset(
                    coverProfile,
                  ),
                ),
              ),
              // ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              navigatTo(context, const HomeLayoutDoc());
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                        const Text('Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 42),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 68,
                            backgroundColor: const Color(0x1AFFFFFF),
                            backgroundImage: NetworkImage(
                                '$linkImageRoot/${widget.infoModel.docImg}'),
                            //

                            // child: Expanded(
                            //   child:
                            // )
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              lable(label: "Name"),
              const SizedBox(
                height: 10,
              ),
              textformField(context, text: "${widget.infoModel.docName}"),
              //
              const SizedBox(
                height: 25,
              ),
              lable(label: 'Category'),
              const SizedBox(
                height: 12,
              ),
              textformField(
                context,
                text: "${widget.infoModel.docCat}",
              ),
              const SizedBox(
                height: 25,
              ),
              lable(label: 'About'),
              const SizedBox(
                height: 12,
              ),
              textformField(
                context,
                text: "${widget.infoModel.docDes}",
              ),
              const SizedBox(
                height: 25,
              ),
              lable(label: 'Experience'),
              const SizedBox(
                height: 12,
              ),
              textformField(
                context,
                text: "${widget.infoModel.docYear} Years",
              ),
              const SizedBox(
                height: 25,
              ),
              lable(label: 'Paitents'),
              const SizedBox(
                height: 12,
              ),
              textformField(
                context,
                text: "${widget.infoModel.docPaitent} Paitents",
              ),

              const SizedBox(
                height: 25,
              ),
              lable(label: 'Address'),
              const SizedBox(
                height: 12,
              ),
              textformField(
                context,
                text: "${widget.infoModel.docCity}",
              ),

              //
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
