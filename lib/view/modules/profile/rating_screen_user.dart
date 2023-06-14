// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant/colors.dart';
import '../../../../../core/constant/linkapi.dart';
import '../../../../../core/cubit/home_layout/cubit.dart';
import '../../../../../core/cubit/home_layout/states.dart';
import '../../../../../data/auth_service/crud.dart';
import '../../../../data/model/rating_model.dart';
import '../../componants/components.dart';
import '../../screens/doctor_screens/my_rating/rating_doc.dart';
import '../../widgets/rating_item.dart';


class RatingScreenUser extends StatefulWidget {
  String id;
   RatingScreenUser({super.key,required this.id});

  @override
  State<RatingScreenUser> createState() => _RatingScreenUserState();
}

class _RatingScreenUserState extends State<RatingScreenUser> with Crud {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(title:const Text("My Rating"),),
              backgroundColor: pageColor,
              body: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                    FutureBuilder(
                        future: cubit.getRaingdata(
                            id: widget.id),
                        builder:
                            (BuildContext contnext, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data['status'] == "failed") {
                              return const Center(
                                  child: Text(
                                'My Rating',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ));
                            }
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data['data']!.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, i) {
                                    return RatingItem(
                                      delete: () async {
                                        var response = await postRequest(
                                            linkDeleteRating, {
                                          "id": snapshot.data['data'][i]['id']
                                              .toString(),
                                        });

                                        if (response['status'] == "success") {
                                          navigatTo(context, const RatingDoc());
                                        }
                                      },
                                      ratingModel: RatingModel.fromJson(
                                          snapshot.data['data'][i]),
                                    );
                                  }),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const Center(
                              child: Text("loading ..."),
                            );
                          }
                          return const Center(
                            child: Text("loading ..."),
                          );
                        }),
                  ])));
        });
  }
}
