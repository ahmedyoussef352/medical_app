import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/colors.dart';
import 'package:medical_app/data/model/rating_model.dart';

import '../componants/components.dart';

class RatingItem extends StatefulWidget {
  final dynamic delete;
  final RatingModel ratingModel;
  const RatingItem({
    Key? key,
    required this.ratingModel,
    required this.delete,
  }) : super(key: key);

  @override
  State<RatingItem> createState() => _RatingItemState();
}

class _RatingItemState extends State<RatingItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        width: double.infinity,
        height:
            // widget.rate == true ? 200 :
            150,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white,
        ),
        child: Expanded(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Paitent'),
                          Expanded(
                              child: Text(
                            "${widget.ratingModel.username}",
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Rating'),
                          Expanded(
                              child: Text(
                            '${widget.ratingModel.docRating} / 5',
                            maxLines: 1,
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Comment'),
                          Expanded(
                              child: Text(
                            '${widget.ratingModel.docNoterating}',
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                        child: defultButtonMyAppoint(
                            onpressed: widget.delete,
                            text: 'Delete',
                            color: ercolor)),
                  ],
                ),
              ),
              // widget.rate == true
              //     ? Expanded(
              //         child: Container(
              //             padding: const EdgeInsetsDirectional.symmetric(
              //                 vertical: 5),
              //             child: widget.rate == true
              //                 ? defultButtonMyAppoint(
              //                     onpressed: () {
              //                       navigatTo(context, RatingDialogWidget(
              //                         docid:
              //                             '${widget.appointmentmodel.appoinmentDocId}',
              //                       ));

              //                       widget.rate = false;
              //                     },
              //                     text: 'Rating',
              //                     color: yellow)
              //                 : const SizedBox()))
              //     :
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
