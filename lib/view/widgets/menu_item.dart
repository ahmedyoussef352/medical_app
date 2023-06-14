// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  bool? doc =false;
  String title;
  IconData icon;
  Function ontap;

     MenuItem({
      this.doc,
       required this.title,
    required this.icon,
    required this.ontap,
      super.key});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: (){
      setState(() {
        widget.ontap();
      });
    },
    child: Padding(
      padding:  const EdgeInsets.symmetric( horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Row(
            children: [
              CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.icon,
                    color: widget.doc==true ?const Color.fromARGB(255, 247, 79, 67): Colors.blue,
                  )),
               const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.title,
                  style:  const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
              const SizedBox(width: 100),
                const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 20,),
          const Divider(
            height: 5,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
  }
}