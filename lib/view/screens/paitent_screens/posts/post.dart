// ignore_for_file: implementation_imports, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/data/model/post_model.dart';
import 'package:medical_app/view/widgets/post/post_item.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/linkapi.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../../main.dart';
import '../../../componants/components.dart';
import 'comment/comments.dart';
import 'create_post.dart';
import 'edit_post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> with Crud {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Your Questions',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: decolor,
                        borderRadius: BorderRadiusDirectional.circular(30)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreatePost2(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 25.0,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: pageColor,
            body: ListView(children: [
              FutureBuilder(
                  future: cubit.getPostUser(id: sharedPrefUser.getString("id").toString()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['status'] == 'failed') {
                        return const Center(
                          child: Text('لا يوجد ملاحظات'),
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
                                    CommentScreen(
                                        posts: snapshot.data['data'][i],));
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
                              user: true,
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
