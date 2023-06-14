// ignore_for_file: implementation_imports, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/linkapi.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../data/model/chat_model.dart';
import '../../../../../main.dart';
import '../../../../widgets/chat/chat_item.dart';

class ChatScreenDoc extends StatefulWidget {
  dynamic data;
  ChatScreenDoc({
    super.key,
    required this.data,
  });

  @override
  State<ChatScreenDoc> createState() => _ChatScreenDocState();
}

class _ChatScreenDocState extends State<ChatScreenDoc> {
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
            backgroundColor: Colors.blue[50],
            appBar: AppBar(
              title: Text("${widget.data['name']}"),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Image.network(
                      '$linkImageRootprofile/${widget.data['image']}'),
                )
              ],
            ),
            body: ListView(
              children: [
                FutureBuilder(
                    future: cubit.getChat(
                        docid: sharedPrefDoc.getString("id").toString(),
                        //'${widget.data['doc_id']}',
                        userid: '${widget.data['id_user']}'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data['status'] == 'failed') {
                          return const Center(
                            child: Text('not found Massages'),
                          );
                        }
                        return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            // scrollDirection: Axis.vert,
                            itemBuilder: (context, i) {
                              return ChatItemU(
                                chatModel: ChatModel.fromJson(
                                  snapshot.data['data'][i],
                                ),
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                          child: TextField(
                            controller: myconroller,
                            decoration: const InputDecoration(
                                hintText: 'Type a message ...'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: white,
                        ),
                        width: 50,
                        child: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: decolor,
                            size: 20,
                          ),
                          onPressed: () async {
                            await cubit.addChatDoc(context,
                                time: formattedTime,
                                userId: widget.data['id_user'].toString(),
                                text: myconroller);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
