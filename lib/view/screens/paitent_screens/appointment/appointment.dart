// ignore_for_file: depend_on_referenced_packages, must_be_immutable, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../componants/components.dart';

class Appointment extends StatefulWidget  {
  final dynamic data;
  const Appointment({Key? key, required this.data}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment>with Crud {
  var formkey = GlobalKey<FormState>();

  var timecontroller = TextEditingController();

  var datecontroller = TextEditingController();
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
            Icons.arrow_back,
          ),
        ),
        title: const Padding(
          padding: EdgeInsetsDirectional.only(start: 55.0),
          child: Text(
            'Appointment',
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  formFieldApintMent(
                    controller: datecontroller,
                    type: TextInputType.datetime,
                    label: 'Date Title',
                    perfix: Icons.calendar_today,
                    titlevalidate: 'date must not be empty',
                    ontap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2024-03-30'),
                      ).then((value) {
                        timecontroller.text =
                            DateFormat.Hms().format(DateTime.now());
                        print(timecontroller.text);
                        //datecontroller.text = DateFormat.yMd().format(value!);
                        //  datecontroller.text = dateStr;
                        datecontroller.text =
                            DateFormat('yyyy-MM-dd').format(value!);
                        print(datecontroller.text);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  formFieldApintMent(
                    controller: timecontroller,
                    type: TextInputType.datetime,
                    label: 'Time Title',
                    perfix: Icons.watch_later_outlined,
                    titlevalidate: 'time must not be empty',
                    ontap: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        timecontroller.text = value!.format(context).toString();
                        print(value.format(context));
                      });
                    },
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  defaultButton(
                    text: 'Confirm Appointment',
                    radius: 10,
                    onpressed: () async {
                      // await addAppointment(context);
                      cubit.addAppointment(context, formkey: formkey, timecontroller: timecontroller, datecontroller: datecontroller, type: '${widget.data['doc_cat']}', doctor: '${widget.data['doc_name']}', place: '${widget.data['doc_city']}',docid: '${widget.data['doc_doctor']}');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
   });
  }}

// class DateFormat {
//   static yMMMd() {}
// }
