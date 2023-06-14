
// // class AppointmentModel {
// //   String? id;
// //   String? appointmentTime;
// //   String? appointmentDate;
// //   String? appointmentType;
// //   String? appointmentDoctor;
// //   String? appointmentPlace;
// //   String? appointmentId;

// //   AppointmentModel(
// //       {this.id,
// //       this.appointmentTime,
// //       this.appointmentDate,
// //       this.appointmentType,
// //       this.appointmentDoctor,
// //       this.appointmentPlace,
// //       this.appointmentId});

// //   AppointmentModel.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     appointmentTime = json['appointment_time'];
// //     appointmentDate = json['appointment_date'];
// //     appointmentType = json['appointment_type'];
// //     appointmentDoctor = json['appointment_doctor'];
// //     appointmentPlace = json['appointment_place'];
// //     appointmentId = json['appointment_id'];
// //   }

// //   // Map<String, dynamic> toJson() {
// //   //   final Map<String, dynamic> data = new Map<String, dynamic>();
// //   //   data['id'] = this.id;
// //   //   data['appointment_time'] = this.appointmentTime;
// //   //   data['appointment_date'] = this.appointmentDate;
// //   //   data['appointment_type'] = this.appointmentType;
// //   //   data['appointment_doctor'] = this.appointmentDoctor;
// //   //   data['appointment_place'] = this.appointmentPlace;
// //   //   data['appointment_id'] = this.appointmentId;
// //   //   return data;
// //   // }
// // }

// // ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

// class AppointmentModel {
//   String? id;
//   String? appointmentTime;
//   String? appointmentDate;
//   String? appointmentType;
//   String? appointmentDoctor;
//   String? appointmentPlace;
//   String? appointmentId;
//   String? appoinmentDocId;

//   AppointmentModel(
//       {this.id,
//       this.appointmentTime,
//       this.appointmentDate,
//       this.appointmentType,
//       this.appointmentDoctor,
//       this.appointmentPlace,
//       this.appointmentId,
//       this.appoinmentDocId});

//   AppointmentModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     appointmentTime = json['appointment_time'];
//     appointmentDate = json['appointment_date'];
//     appointmentType = json['appointment_type'];
//     appointmentDoctor = json['appointment_doctor'];
//     appointmentPlace = json['appointment_place'];
//     appointmentId = json['appointment_id'];
//     appoinmentDocId = json['appoinment_doc_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['appointment_time'] = this.appointmentTime;
//     data['appointment_date'] = this.appointmentDate;
//     data['appointment_type'] = this.appointmentType;
//     data['appointment_doctor'] = this.appointmentDoctor;
//     data['appointment_place'] = this.appointmentPlace;
//     data['appointment_id'] = this.appointmentId;
//     data['appoinment_doc_id'] = this.appoinmentDocId;
//     return data;
//   }
// }
class AppointmentModel {
  String? id;
  String? username;
  String? appointmentTime;
  String? appointmentDate;
  String? appointmentType;
  String? appointmentDoctor;
  String? appointmentPlace;
  String? appointmentId;
  String? appoinmentDocId;

  AppointmentModel(
      {this.id,
      this.username,
      this.appointmentTime,
      this.appointmentDate,
      this.appointmentType,
      this.appointmentDoctor,
      this.appointmentPlace,
      this.appointmentId,
      this.appoinmentDocId});

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    appointmentTime = json['appointment_time'];
    appointmentDate = json['appointment_date'];
    appointmentType = json['appointment_type'];
    appointmentDoctor = json['appointment_doctor'];
    appointmentPlace = json['appointment_place'];
    appointmentId = json['appointment_id'];
    appoinmentDocId = json['appoinment_doc_id'];
  }
}