//ignore_for_file: avoid_print, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/colors.dart';
import '../../../core/constant/image.assets.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/search/search_screen.dart';
import '../../widgets/carousel_slider.dart';
import '../../widgets/cat_itm.dart';
import '../../widgets/info/info_psychiatrist.dart';
import '../specialist/specialist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> items = [
     SliderItem(category: 'Psychiatrist', image: 'https://purepng.com/public/uploads/large/purepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-1421526857248uragw.png', name: 'Serina Jogn',),
     SliderItem(category: 'Pediatrician', image: 'https://purepng.com/public/uploads/large/purepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctor-1421526856715fcree.png', name: 'Michale Lois',),
     SliderItem(category: 'Neurosurgeon', image: 'https://purepng.com/public/uploads/large/purepng.com-doctordoctorsdoctors-and-nursesclinicianmedical-practitionernotepadfemale-142152685722142y8x.png', name: 'Lili yacoup',),
     SliderItem(category: 'Neurosurgeon', image: 'https://purepng.com/public/uploads/large/purepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctornotepad-1421526856962ngglq.png', name: 'George Epril',),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageColor,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 10,
            ),
            Text(
              'Find Your',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
            ),
            Text(
              'Specialist',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigatTo(context, SearchScreen());
            },
            icon: const Icon(
              Icons.search,
              size: 30.0,
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const MessageScreen(),
          //       ),
          //     );
          //   },
          //   icon: const Icon(
          //     Icons.message_outlined,
          //     size: 30.0,
          //   ),
          // ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                print(currentIndex);
              }),
              child: CarouselSlider(
                items: items,
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 200),
                  viewportFraction: 0.8,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(),
                      SizedBox(
                        width: 10.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              child: Expanded(
                child: DefaultTabController(
                  length: 4,
                  initialIndex: 0,
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 105,
                          child: ButtonsTabBar(
                              borderWidth: 1,
                              borderColor: Colors.transparent,
                              radius: 20,
                              elevation: 0,
                              unselectedBorderColor: white,
                              physics: const BouncingScrollPhysics(),
                              tabs: const [
                                Tab(
                                  child: CatItem(
                                    image: pediatrician,
                                    label: 'Pediatrician',
                                  ),
                                ),
                                Tab(
                                  child: CatItem(
                                    image: neurosurgeon,
                                    label: 'Neurosurgeon',
                                  ),
                                ),
                                Tab(
                                  child: CatItem(
                                    image: cardiologist,
                                    label: 'Cardiologist',
                                  ),
                                ),
                                Tab(
                                  child: CatItem(
                                    image: psychatrist,
                                    label: 'Psychatrist',
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Available Doctor',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Expanded(child: SizedBox()),

                              InkWell(
                                onTap: (() {
                                  navigatTo(context, const Specialist());
                                }),
                                child: const Text(
                                  'See All',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              //  Text('see all',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                              const SizedBox(
                                width: 10.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TabBarView(
                            children: [
                              Expanded(
                                  child: InfoPsychiatrist(
                                category: 'Pediatrician',
                              )),
                              Expanded(
                                  child: InfoPsychiatrist(
                                category: 'Neurosurgeon',
                              )),
                              Expanded(
                                  child: InfoPsychiatrist(
                                category: 'Cardiologist',
                              )),
                              Expanded(
                                  child: InfoPsychiatrist(
                                category: 'Psychiatrist',
                              )),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
