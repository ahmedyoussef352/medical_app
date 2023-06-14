// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/image.assets.dart';
import 'package:medical_app/data/model/post_model.dart';

import '../../../core/constant/colors.dart';
import '../../../core/constant/linkapi.dart';

class PostItem extends StatefulWidget {
  bool user;
  final PostModel postModel;
  final dynamic edit;
  final dynamic comment;
  final dynamic delete;
  PostItem(
      {
      required this.comment,
      required this.user,
      super.key,
      required this.postModel,
      required this.edit,
      required this.delete});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.postModel.userName}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        // widget.postModel.posttime!=null? Text(
                        //   '${widget.postModel.posttime}',
                        //   style: const TextStyle(
                        //     fontSize: 12,
                        //     color: grey,
                        //   ),
                        // ):
                        // const Text(
                        //   '45 min',
                        //   style: TextStyle(
                        //     fontSize: 12,
                        //     color: grey,
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                widget.user == true
                    ? MaterialButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (contxet) => Container(
                                    height: 120,
                                    color: black,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: primaryColor,
                                            ),
                                            child: InkWell(
                                              onTap: widget.edit,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: const Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Divider(),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: ercolor,
                                            ),
                                            child: InkWell(
                                              onTap: widget.delete,
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: double.infinity,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: const Text(
                          '...',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text('${widget.postModel.postContent}'),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: NetworkImage(
                        '$linkImageRootPost/${widget.postModel.postImage}',
                      ),
                      fit: BoxFit.cover),
                  color: grey),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: decolor,
              ),
              child: MaterialButton(
                onPressed: widget.comment,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: const [
                      Text(
                        'Answers',
                        style: TextStyle(
                            fontSize: 16,
                            color: white,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.question_answer_outlined,
                        color: white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
