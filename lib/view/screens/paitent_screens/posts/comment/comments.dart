// ignore_for_file: implementation_imports, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../../core/cubit/home_layout/states.dart';
import '../../../../../../data/auth_service/crud.dart';
import '../../../../../../data/model/comment_model.dart';
import '../../../../widgets/post/comment_item.dart';


class CommentScreen extends StatefulWidget {
  dynamic posts;
   CommentScreen({super.key,required this.posts});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> with Crud {
  TextEditingController myconroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final timeFormat = DateFormat('hh:mm a');
    final formattedTime = timeFormat.format(now);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: pageColor,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Add Comment'),
                      content: TextFormField(
                        controller: myconroller,
                        decoration: const InputDecoration(
                          hintText: 'Enter your comment',
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('SAVE'),
                          onPressed: () async {
                            await cubit.addCommentUser(context,
                                time: formattedTime,
                                postid: widget.posts['id'].toString(),
                                comment: myconroller);
                            // Perform some action when the saRve button is pressed
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );

                // Perform some action when the button is pressed
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: const Center(child: Text("Answers")),
            ),

            body: ListView(children: [
              FutureBuilder(
                  future: cubit.getComment(postid:widget.posts['id'].toString(),),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'failed') {
                        return const Center(
                          child: Text('no comments'),
                        );
                      }
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          // scrollDirection: Axis.vert,
                          itemBuilder: (context, i) {
                            return CommentItem(commentModel: CommentModel.fromJson(snapshot.data['data'][i],),
                            user: true,);
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Center(
                      child: Text("Loading ..."),
                    );
                  }),
            ]),
          );
        });
  }
}
