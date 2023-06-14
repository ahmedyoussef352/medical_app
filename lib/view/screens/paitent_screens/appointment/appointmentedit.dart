// ignore_for_file: depend_on_referenced_packages, must_be_immutable, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/cubit/home_layout/cubit.dart';
import '../../../../core/cubit/home_layout/states.dart';
import '../../../../data/auth_service/crud.dart';
import '../../../componants/components.dart';

class EditAppointment extends StatefulWidget with Crud {
  dynamic appointments;
  EditAppointment({Key? key, this.appointments}) : super(key: key);

  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> with Crud {
  var formkey = GlobalKey<FormState>();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  @override
  void initState() {
    timecontroller.text = widget.appointments['appointment_time'];
    datecontroller.text = widget.appointments['appointment_date'];
    super.initState();
  }

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
                  'EditAppointment',
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
                              //datecontroller.text = DateFormat.yMd().format(value!);
                              // datecontroller.text = dateStr;
                              datecontroller.text =
                                  DateFormat('yyyy-MM-dd').format(value!);
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
                              timecontroller.text =
                                  value!.format(context).toString();
                              print(value.format(context));
                            });
                          },
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        defaultButton(
                          text: 'Editing Appointment',
                          radius: 10,
                          onpressed: () async {
                            cubit.editAppointment(context,
                                formkey: formkey,
                                timecontroller: timecontroller,
                                id: '${widget.appointments["id"]}',
                                datecontroller: datecontroller);
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
  }
}
