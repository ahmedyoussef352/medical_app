// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/model/search_model.dart';

import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../componants/components.dart';
import '../../../modules/profile/profiledoc.dart';
import '../../../widgets/search_item.dart';

class SelectedArea extends StatefulWidget {
  String category;
  String city;
  SelectedArea({super.key, required this.category, required this.city});

  @override
  State<SelectedArea> createState() => _SelectedAreaState();
}

class _SelectedAreaState extends State<SelectedArea> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
              title: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Selected area',
                      style: TextStyle(
                          color: Color.fromARGB(255, 199, 181, 181),
                          fontSize: 12),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Row(
                        children: [
                          Text(
                            widget.city,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 24),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_drop_down_sharp)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.blue[50],
            body: FutureBuilder(
                future: cubit.getSeach(
                    category: widget.category, city: widget.city),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data['status'] == 'failed') {
                      return const Center(
                        child: Text('لا يوجد ملاحظات'),
                      );
                    }
                    return Container(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: snapshot.data['data'].length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return SearchItem(
                              searchModel: SearchModel.fromJson(
                                  snapshot.data['data'][i]),
                              ontap: () {
                                navigatTo(context,
                                    Profiledoc(data: snapshot.data['data'][i],));
                                    
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
