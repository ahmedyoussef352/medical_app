// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, avoid_print, unnecessary_string_interpolations, sort_child_properties_last, duplicate_ignore, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../core/constant/colors.dart';

Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );

Widget formFieldApintMent({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData perfix,
  required String titlevalidate,
  VoidCallback? ontap,
  bool obscure = false,
  IconData? suffix,
  VoidCallback? suffixpress,
}) =>
    TextFormField(
      onTap: ontap,
      keyboardType: type,
      controller: controller,
      obscureText: obscure,
      onFieldSubmitted: (String value) {
        print(value);
      },
      onChanged: (String value) {
        print(value);
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          // ignore: unnecessary_brace_in_string_interps
          return '${titlevalidate}';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          perfix,
        ),
        suffix: suffix != null
            ? IconButton(
                onPressed: suffixpress,
                icon: Icon(suffix),
              )
            : null,
      ),
    );

Widget listTile(
    {required String title,
    required IconData iconData,
    required Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            onTap: onTap,
            leading: Icon(
              iconData,
              size: 28,
            ),
            title: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ),
  );
}

Widget defaultButton({
  double width = double.infinity,
  Color background = decolor,
  bool isUpperCase = true,
  double radius = 10.0,
  required String text,
  required VoidCallback onpressed,
}) =>
    Container(
      width: width,
      height: 60.0,
      // ignore: sort_child_properties_last
      child: MaterialButton(
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );
Widget myItem(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    // alignment: Alignment.centerLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 25.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(
                      30.0,
                    ),
                    topEnd: Radius.circular(
                      30.0,
                    ),
                    topStart: Radius.circular(
                      30.0,
                    ),
                  ),
                ),
                child: Text(
                  'Hello from other side',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '12',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.grey.shade400,
                    fontSize: 12),
              )
            ],
          ),
        ),
        imagechat(),
      ],
    ),
  );
}

Widget docItem(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    // alignment: Alignment.centerLeft,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        imagechat(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 25.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(
                      30.0,
                    ),
                    topEnd: Radius.circular(
                      30.0,
                    ),
                    topStart: Radius.circular(
                      30.0,
                    ),
                  ),
                ),
                child: Text(
                  'Hello from other side',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '12',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.grey.shade400,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget imagechat() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(
      bottom: 5.0,
    ),
    child: Container(
      width: 45,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        image: const DecorationImage(
          image: NetworkImage(
            'https://brooklynintergroup.org/brooklyn/wp-content/uploads/2021/01/flower-729512__340-1.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget defultButtonMyAppoint({
  context,
  onpressed,
  required Color color,
  required String text,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onpressed,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );

void navigatTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
void navigatandFinish(context, widget) => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget showLoadingIndicator() {
  return const Center(
    child: CircularProgressIndicator(
      color: Colors.blue,
    ),
  );
}

Widget appBar(String txt, context) {
  return SafeArea(
    child: Container(
      height: 60,
      color: Colors.white,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Text(
                  txt,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              width: 50,
            )
          ],
        ),
      ),
    ),
  );
}

Widget title(String txt) {
  return Expanded(
    child: Text(
      txt,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.grey,
      ),
    ),
  );
}

///profile
Widget lable({
  required String label,
  FontWeight? fontWeight,
}) {
  return
      // Expanded(child:
      Text(
    label,
    style: TextStyle(
      color: Colors.grey.shade800,
      fontWeight: fontWeight,
      fontSize: 14,
    ),
    //),
  );
}

Widget textformField(context, {required String text}) {
  return Container(
    width: MediaQuery.of(context).size.width - 70,
    height: 55,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      style: const TextStyle(
        fontSize: 17,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enabled: false,
        labelStyle: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1.5,
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}

Widget textformFieldedit(context,
    {required String text,
    required TextEditingController mycontroller,
    required String? Function(String?)? valid}) {
  return Container(
    width: MediaQuery.of(context).size.width - 70,
    height: 55,
    decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10)),
    child: TextFormField(
      validator: valid,
      controller: mycontroller,
      style: const TextStyle(
        fontSize: 17,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(color: Colors.black, fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}

Widget defaultFormFieldAuth({
  TextEditingController? controller,
  TextInputType? type,
  bool isPassword = false,
  final String? Function(String?)? validate,
  String? text,
  final Function()? onTap,
  bool isClickable = true,
}) =>
    Container(
      child: TextFormField(
        maxLines: 1,
        controller: controller,
        validator: validate,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onTap: onTap,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: const TextStyle(color: blackgrey, fontSize: 14),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: blue, width: 5, style: BorderStyle.solid),
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );

Widget custimFormFieldSearch({
  TextEditingController? controller,
  TextInputType? type,
  bool isPassword = false,
  Function? validate,
  String? text,
  final Function()? onTap,
  bool isClickable = true,
  IconData? icon,
}) =>
    Container(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                child: TextFormField(
                  controller: controller,
                  keyboardType: type,
                  enabled: isClickable,
                  onTap: onTap,
                  decoration: InputDecoration(
                    hintText: text,
                    hintStyle: const TextStyle(color: blackgrey, fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  child: Icon(
                icon,
                color: blackgrey,
              )),
              flex: 1,
            ),
          ],
        ),
      ),
    );

Widget notificationItem({
  required String title,
  required String content,
  required String time,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 30.0),
            child: Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue[100]),
              child: const Icon(
                Icons.notifications_active_outlined,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title',
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '$content',

                        // overflow: TextOverflow.ellipsis,

                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                    Text(
                      '$time',
                      style:
                          const TextStyle(color: Colors.black, fontSize: 10.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider()
              ],
            ),
          ),
        ],
      ),
    );

Widget defaultOpject({
  required VoidCallback function,
  required String name,
  required String experience,
  required String photo,
  required String patient,
}) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 5.0, end: 5.0, top: 15.0, bottom: 0),
        child: MaterialButton(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          onPressed: function,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: Expanded(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$name',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Text(
                              'Medicine Specialist',
                              style: TextStyle(fontSize: 11.0),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Experience',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0),
                                ),
                                Text(
                                  '$experience',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Patients',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 12.0),
                            ),
                            Text(
                              '$patient',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: 70,
                        height: 100,
                        child: Image.network(
                          '$photo',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
