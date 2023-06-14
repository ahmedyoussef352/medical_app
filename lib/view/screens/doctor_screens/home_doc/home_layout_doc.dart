// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_element, unused_local_variable, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constant/colors.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../../data/model/post_model.dart';
import '../../paitent_screens/posts/edit_post.dart';
import '../../paitent_screens/posts/post.dart';
import '../drawer/drawer.dart';
import '../../../componants/components.dart';
import '../../../widgets/post/post_item.dart';
import '../comment_screen/comment_doc.dart';

class HomeLayoutDoc extends StatefulWidget {
  const HomeLayoutDoc({super.key});

  @override
  _HomeLayoutDocState createState() => _HomeLayoutDocState();
}

class _HomeLayoutDocState extends State<HomeLayoutDoc> with Crud {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            drawer: DrawerSide(),
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Some Questions',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            backgroundColor: pageColor,
            body: ListView(children: [
              FutureBuilder(
                  future: cubit.getPostDoc(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'failed') {
                        return const Center(
                          child: Text('not found Posts'),
                        );
                      }
                      return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          // scrollDirection: Axis.vert,
                          itemBuilder: (context, i) {
                            return PostItem(
                              comment: () async {
                                navigatTo(
                                    context,
                                    CommentScreenDoc(
                                      posts: snapshot.data['data'][i],
                                    ));
                              },
                              delete: () async {
                                var response =
                                    await postRequest(linkDeletePost, {
                                  "id_post":
                                      snapshot.data['data'][i]['id'].toString(),
                                });

                                if (response['status'] == "success") {
                                  navigatTo(context, const PostsScreen());
                                }
                              },
                              edit: () async {
                                navigatTo(
                                    context,
                                    EditPost(
                                      posts: snapshot.data['data'][i],
                                    ));
                              },
                              postModel:
                                  PostModel.fromJson(snapshot.data['data'][i]),
                              user: false,
                            );
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
