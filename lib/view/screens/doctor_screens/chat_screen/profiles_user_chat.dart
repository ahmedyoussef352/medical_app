// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/model/profile_model.dart';
import '../../../../../view/componants/components.dart';
import '../../../../../view/widgets/profiles_users/single_profile_chat.dart';

import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import 'chat/chat_screen_doc.dart';

class ChatsProfiles extends StatefulWidget {
  const ChatsProfiles({super.key});

  @override
  State<ChatsProfiles> createState() => _ChatsProfilesState();
}

class _ChatsProfilesState extends State<ChatsProfiles> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Chats'),
              elevation: 0,
            ),
            backgroundColor: Colors.blue[50],
            body: FutureBuilder(
                future: cubit.getUserProfiles(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'failed') {
                      return const Center(
                        child: Text('not found chats'),
                      );
                    }
                    return Container(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return SingleItemChats(
                              profileModel: ProfileModel.fromJson(
                                  snapshot.data['data'][i]),
                              ontap: () {
                                navigatTo(
                                  context,
                                   ChatScreenDoc(
                                    data:snapshot.data['data'][i]

                                   ),
                                );
                              },
                            );
                          }),
                    );
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
          );
        });
  }
}
