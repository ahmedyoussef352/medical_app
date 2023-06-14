import 'package:flutter/material.dart';
import 'package:medical_app/core/constant/colors.dart';

import '../../data/model/appoint_model.dart';
import '../componants/components.dart';

class AppointCartDoc extends StatefulWidget {
  final bool date;
  final dynamic delete;

  final dynamic cancel;
  final AppointmentModel appointmentmodel;
  const AppointCartDoc(
      {Key? key,
      required this.date,
      required this.appointmentmodel,
      required this.delete,
      required this.cancel})
      : super(key: key);

  @override
  State<AppointCartDoc> createState() => _AppointCartDocState();
}

class _AppointCartDocState extends State<AppointCartDoc> {
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
                          title('Date'),
                          Expanded(
                              child: Text(
                            "${widget.appointmentmodel.appointmentDate}",
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Time'),
                          Expanded(
                              child: Text(
                            "${widget.appointmentmodel.appointmentTime}",
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Patient'),
                          Expanded(
                              child: Text(
                            '${widget.appointmentmodel.username}',
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
                          title('Type'),
                          Expanded(
                              child: Text(
                            '${widget.appointmentmodel.appointmentType}',
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          title('Place'),
                          Expanded(
                              child: Text(
                            '${widget.appointmentmodel.appointmentPlace}',
                            maxLines: 1,
                          ))
                        ],
                      ),
                    ),
                    Expanded(
                        child:
                            widget.date == true
                                ? defultButtonMyAppoint(
                                    onpressed: widget.delete,
                                    text: 'Delete',
                                    color: ercolor)
                                :
                            defultButtonMyAppoint(
                                onpressed: widget.cancel,
                                text: 'Cancle',
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
