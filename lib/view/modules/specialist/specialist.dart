import 'package:flutter/material.dart';
import '../../componants/components.dart';
import '../../screens/paitent_screens/search/search_screen.dart';
import '../../widgets/info/info_widget.dart';

class Specialist extends StatelessWidget {
  
   const Specialist({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Available',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
              ),
              Text(
                'Specialist',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
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
                )),
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const MessageScreen()));
            //     },
            //     icon: const Icon(
            //       Icons.message_outlined,
            //       size: 30.0,
            //     )),
          ],
          bottom: const TabBar(
            indicatorWeight: 3.0,
            labelColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Pediatrician',
              ),
              Tab(
                text: 'Neurosurgeon',
              ),
              Tab(
                text: 'Cardiologist',
              ),
              Tab(
                text: 'Psychiatrist',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InfoWidget(
              category: "Pediatrician",
            ),
            InfoWidget(
              category: "Neurosurgeon",
            ),
            InfoWidget(
              category: "Cardiologist",
            ),
            InfoWidget(
              category: "Psychiatrist",
            )
          ],
        ),
      ),
    );
  }
}
