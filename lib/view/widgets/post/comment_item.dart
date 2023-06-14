// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/colors.dart';

import '../../../data/model/comment_model.dart';

class CommentItem extends StatefulWidget {
  CommentModel commentModel;
  bool? user = true;
  CommentItem({super.key, required this.commentModel, this.user});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: white, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                      height: 50,
                      width: 50,
                      margin: const EdgeInsets.only(bottom: 30),
                      child: CircleAvatar(
                        backgroundColor: white,
                        backgroundImage: NetworkImage(
                          "${widget.commentModel.image}",
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.commentModel.username}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${widget.commentModel.time}',
                        style: const TextStyle(color: grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${widget.commentModel.textComment}",
                          // overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: grey, fontSize: 12.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
