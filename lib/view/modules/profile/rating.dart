// ignore_for_file: unused_local_variable, must_be_immutable, library_private_types_in_public_api, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../core/constant/image.assets.dart';
import '../../../core/cubit/home_layout/cubit.dart';
import '../../../core/cubit/home_layout/states.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/my_appiontment/appointment_screen.dart';

class RatingDialogWidget extends StatefulWidget {
  dynamic docid;
  RatingDialogWidget({Key? key, required this.docid}) : super(key: key);

  @override
  _RatingDialogWidgetState createState() => _RatingDialogWidgetState();
}

class _RatingDialogWidgetState extends State<RatingDialogWidget> {
  late final RatingDialog _dialog;
  GlobalKey<FormState> form = GlobalKey();

  @override
  // void initState() {
  //   super.initState();

  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                // set to false if you want to force a rating
                builder: (context) => RatingDialog(
                  initialRating: 1.0,
                  title: const Text(
                    'Rating doctor',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  message: const Text(
                    'Tap a star to set your rating. Add more description here if you want.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                  image: Image.asset(
                    logo,
                    width: 200,
                    height: 200,
                  ),
                  submitButtonText: 'Submit',
                  submitButtonTextStyle: const TextStyle(
                      color: Color.fromARGB(255, 255, 25, 21),
                      fontWeight: FontWeight.bold),
                  commentHint: 'Set your custom comment hint',
                  onCancelled: () => print('cancelled'),
                  onSubmitted: (response) {
                  final  TextEditingController comment = TextEditingController();
                    TextEditingController rating = TextEditingController();
                    setState(() {
                       rating.text = 
                       //"4";
                    response.rating.toString();
                    comment.text = response.comment;
                    });
                    setState(() {
                      cubit.addRating(context,
                          docid: widget.docid,
                          rating: rating,
                          comment: comment);
                    });
                    navigatTo(context, const MyAppointMent());
                    // setState(() {
                    //  var x = response.rating.toString();
                    //  var commentController = response.comment;
                    //   navigatTo(context, const MyAppointMent());
                    // });

                    print(
                        'rating: ${response.rating}, comment: ${response.comment}');
                  },
                ),
              );
              setState(() {});
            },
            child: const Text('Show Rating Dialog'),
          );
        });
  }
}


