// ignore_for_file: prefer_const_constructors, avoid_print, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:medical_app/core/cubit/home_layout/states.dart';
import 'package:medical_app/view/screens/paitent_screens/profile/profile_screen.dart';
import '../../../data/auth_service/crud.dart';
import '../../../main.dart';
import '../../../view/componants/components.dart';
import '../../../view/modules/home_screen/home_screen.dart';
import '../../../view/modules/notifications/notifications.dart';
import '../../../view/screens/paitent_screens/auth/login/login_screen.dart';
import '../../../view/screens/doctor_screens/auth_doctor/login_doctor.dart';
import '../../../view/screens/doctor_screens/home_doc/home_layout_doc.dart';
import '../../../view/screens/paitent_screens/home/home_layout.dart';
import '../../../view/screens/paitent_screens/my_appiontment/appointment_screen.dart';
import '../../../view/screens/paitent_screens/posts/post.dart';
import '../../constant/linkapi.dart';

class AppCubit extends Cubit<AppStates> with Crud {
  AppCubit() : super(AppInitialState());

  static AppCubit get(
    context,
  ) =>
      BlocProvider.of(context);

  int currentIndex = 0;
  bool isloading = false;

  List screens = [
    HomeScreen(),
    PostsScreen(),
    Notifications(),
  ];
  void changeIndex(index, context) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }
  //

  int currentIndex2 = 0;

  List screens2 = [
    HomeScreen(),
    PostsScreen(),
    Notifications(),
  ];
  void changeIndex2(index, context) {
    currentIndex2 = index;
    emit(AppChangeBottomNavBarState());
  }

  getidUser({required String id}) async {
    var response = await postRequest(linkViewidprofile, {"id": id});
    return response;
  }

  //authuser
  var taaaa;

  Future? signUp(
    context, {
    required TextEditingController email,
    required TextEditingController username,
    required TextEditingController phone,
    required TextEditingController password,
    required TextEditingController confirmPassword,
    required GlobalKey<FormState> formstate,
    required bool user,
  }) async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      if (password.text == confirmPassword.text) {
        isloading = true;
        emit(LoadingTrue());

        var response =
            await postRequest(user == true ? linkSignUp : linkSignUpDoc, {
          "username": username.text,
          "email": email.text,
          "phone": phone.text,
          "password": password.text,
        });
        isloading = false;
        emit(LoadingFalse());
        if (response["status"] == "success") {
          emit(SuccessSignUp());

          user == true
              ? navigatTo(context, const LoginScreen())
              : navigatTo(context, const LoginDoctor());
        } else {
          print('signUp fail');
        }
      } else {
        return Fluttertoast.showToast(
            msg: "Your Passwordrs aren't identical",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[600],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
  getidDoc({required String id}) async {
    var response = await postRequest(linkViewIdDoc, {"id": id});
    return response;
  }

  getNotes({
    required String category,
  }) async {
    var response = await postRequest(linkView, {"category": category});
    return response;
  }

  var n;

  addInfo(
    context, {
    required GlobalKey<FormState> formstate,
    required TextEditingController name,
    // required String? id,
    required String category,
    required TextEditingController year,
    required TextEditingController describtion,
    required TextEditingController paitent,
    required TextEditingController city,
    File? myfile,
  }) async {
    if (myfile == null) {
      return AwesomeDialog(
          context: context,
          title: "هام",
          body: const Text(" please enter your photo"))
        ..show();
    }

    if (formstate.currentState!.validate()) {
      // isloading = true;
      emit(LoadingTrue());

      var response = await postRequestWithFile(
          linkInfo,
          {
            "id": sharedPrefDoc.getString("id"),
            "name": name.text,
            "category": category,
            "year": year.text,
            "desc": describtion.text,
            "paitent": paitent.text,
            "city": city.text,
          },
          myfile);
      // isloading = false;
      emit(LoadingFalse());
      if (response["status"] == "success") {
        emit(AddInfoSuccess());
        // sharedPrefid.setString("name", response['data']['name']);
        print('---------------------------------');
        //  sharedPrefInfo.setString("id", sharedPrefDoc.getString("id").toString());
        navigatTo(context, const HomeLayoutDoc());
      } else {
        emit(AddInfoError("Failed to add note"));
        print(
            '******************************************************************');
        print('signUp fail');
      }
    }
  }

  getdoc({required String id}) async {
    var response = await postRequest(linkViewdoc, {"id": id});
    return response;
  }

  ///appointment

  addAppointment(
    context, {
    required GlobalKey<FormState> formkey,
    required TextEditingController timecontroller,
    // required String? id,
    required TextEditingController datecontroller,
    required String type,
    required String doctor,
    required String place,
    required String docid,
  }) async {
    if (formkey.currentState!.validate()) {
      emit(LoadingTrue());
      var response = await postRequest(linkAddAppointment, {
        "time": timecontroller.text,
        "username":sharedPrefUser.getString("username"),
        "date": datecontroller.text,
        "type": type,
        "doctor": doctor,
        "place": place,
        "id": sharedPrefUser.getString("id"),
        "docid": docid,
      });

      if (response['status'] == "success") {
        emit(AddapointmentSuccess());
        navigatTo(context, const MyAppointMent());
      } else {
        emit(AddapointmentFailed());
      }
    }
  }

  editAppointment(
    context, {
    required GlobalKey<FormState> formkey,
    required TextEditingController timecontroller,
    required String id,
    required TextEditingController datecontroller,
  }) async {
    if (formkey.currentState!.validate()) {
      var response = await postRequest(linkEditAppointment, {
        "time": timecontroller.text,
        "date": datecontroller.text,
        "id": id,
      });

      if (response['status'] == "success") {
        emit(EditapointmentSuccess());
        navigatTo(context, MyAppointMent());
      } else {
        emit(EditapointmentFailed());
      }
    }
  }

  getAppointmentPast() async {
    var response = await postRequest(
        linkPastAppointment, {"id": sharedPrefUser.getString("id")});
    print(response);
    return response;
  }

  getUpcomming() async {
    var response = await postRequest(
        linkcommingAppointment, {"id": sharedPrefUser.getString("id"),
        });
    print(response);
    return response;
  }
//doc
    getAppointmentPastDoc() async {
    var response = await postRequest(
        linkPastAppointmentDoc, {"id": sharedPrefDoc.getString("id")});
    print(response);
    return response;
  }

  getUpcommingDoc() async {
    var response = await postRequest(
        linkcommingAppointmentDoc, {"id": sharedPrefDoc.getString("id"),
        });
    print(response);
    return response;
  }

  /// Profile
  ///add profile data
  addProfile(
    context, {
    required GlobalKey<FormState> formstate,
    required TextEditingController name,
    // required String? id,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController address,
    File? myfile,
  }) async {
    if (myfile == null) {
      return AwesomeDialog(
          context: context,
          title: "alert!",
          body: const Text(" please enter your photo"))
        ..show();
    }

    if (formstate.currentState!.validate()) {
      // isloading = true;
      emit(LoadingTrue());

      var response = await postRequestWithFile(
          linkAddPrdofle,
          {
            "id_user": sharedPrefUser.getString("id"),
            "name": name.text,
            "email": email.text,
            "phone": phone.text,
            "address": address.text,
          },
          myfile);
      // isloading = false;
      emit(LoadingFalse());
      if (response["status"] == "success") {
        emit(AddProfileSuccess());
        print('---------------------------------');
        //  sharedPrefInfo.setString("id", sharedPrefDoc.getString("id").toString());
        // t = '${sharedPrefUser.getString("id").toString()}+1';
        navigatTo(context, const HomeLayout());
      } else {
        emit(AddProfileError("Failed to add note"));
        print(
            '******************************************************************');
        print('signUp fail');
      }
    }
  }

  editProfile(
    context, {
    required GlobalKey<FormState> formstate,
    required TextEditingController name,
    required String id,
    required String file,
    required TextEditingController email,
    required TextEditingController phone,
    required TextEditingController address,
    File? myfile,
  }) async {
    if (formstate.currentState!.validate()) {
      // isloading = true;
      emit(LoadingTrue());
      var response;
      if (myfile == null) {
        response = await postRequest(linkEditPrdofle, {
          "id": id,
          "name": name.text,
          "email": email.text,
          "phone": phone.text,
          "address": address.text,
          "file": file,
        },);
      } else {
        response = await postRequestWithFile(
            linkEditPrdofle,
            {
              "id": id,
              "name": name.text,
              "email": email.text,
              "phone": phone.text,
              "address": address.text,
              "file": file,
            },
            myfile);
      }
      // isloading = false;
      emit(LoadingFalse());
      if (response["status"] == "success") {
        emit(AddProfileSuccess());
        print('---------------------------------');
        //  sharedPrefInfo.setString("id", sharedPrefDoc.getString("id").toString());
        // t = '${sharedPrefUser.getString("id").toString()}+1';
        navigatTo(context, const ProfileScreen());
      } else {
        emit(AddProfileError("Failed to add note"));
        print(
            '******************************************************************');
        print('signUp fail');
      }
    }
  }
  //get

  getProfiledata({required String id}) async {
    var response = await postRequest(linkViewProfile, {"id": id});
    print(response);
    return response;
  }
  getDoc({required String id}) async {
    var response = await postRequest(linkViewdoc, {"id": id});
    print(response);
    return response;
  }

  ///Rating
  addRating(
    context, {
    // required String? id,
    required String docid,
    required TextEditingController rating,
    required TextEditingController comment,
  }) async {
    emit(LoadingTrue());
    var response = await postRequest(linkAddRaing, {
      "user_id": sharedPrefUser.getString("id"),
      "doc_id": docid,
      "rating": rating.text,
      "comment": comment.text,
      "name":sharedPrefUser.getString("username"),
    });

    if (response['status'] == "success") {
      emit(AddapointmentSuccess());
      // navigatTo(context, const MyAppointMent());
      print(response);
    } else {
      emit(AddapointmentFailed());
    }
  }

  getRaingdata({required String id}) async {
    var response = await postRequest(linkViewRating, {"doc_id": id});
    print(response);
    return response;
  }

  //posts
  addPost(
    context, {
    required GlobalKey<FormState> formstate,
    required TextEditingController content,
    File? myfile,
  }) async {
    if (formstate.currentState!.validate()) {
      // isloading = true;
      emit(LoadingTrue());

      var response = await postRequestWithFile(
          linkAddPosts,
          {
            "id_user": sharedPrefUser.getString("id"),
            "username": sharedPrefUser.getString("username"),
            "content": content.text,
            // "phone": phone.text,
            // "address": address.text,
          },
          myfile!);
      // isloading = false;
      emit(LoadingFalse());
      if (response["status"] == "success") {
        emit(AddPostSuccess());
        print('---------------------------------');
        //  sharedPrefInfo.setString("id", sharedPrefDoc.getString("id").toString());
        // t = '${sharedPrefUser.getString("id").toString()}+1';
        Navigator.pop(context);
      } else {
        emit(AddPostError("Failed to add note"));
        print(
            '******************************************************************');
        print('signUp fail');
      }
    }
  }

  getPostUser({required String id}) async {
    var response = await postRequest(
        linkGetPostsUser, {"id_user": id});
    print(response);
    return response;
  }
  getPostDoc() async {
    var response = await postRequest(linkGetPostDoc,{});
    print(response);
    return response;
  }


  getProfiledataDoc({required String id}) async {
    var response = await postRequest(linkViewProfile, {"id": id});
    print(response);
    return response;
  }
  ///comment
  addCommentUser(
    context, {
    required String time,
    required String postid,
    required TextEditingController comment,
  }) async {
    emit(LoadingTrue());
    var response = await postRequest(linkAddComment, {
      "id_user": sharedPrefUser.getString("id"),
      "id_post": postid,
      "time": time,
      "image":"data:image/png;base64,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",
      "text_comment": comment.text,
      "username": sharedPrefUser.getString("username"),
    });

    if (response['status'] == "success") {
      print(response);
      emit(AddCommentSuccess());
      // navigatTo(context, const MyAppointMent());
      print(response);
    } else {
      emit(AddCommentError());
      print(response);
    }
  }
    addCommentDoc(
    context, {
    required String time,
    required String postid,
    required TextEditingController comment,
  }) async {
    emit(LoadingTrue());
    var response = await postRequest(linkAddCommentdoc, {
      "id_doc": sharedPrefDoc.getString("id"),
      "id_post": postid,
      "time": time,
      "image":"https://cdn-icons-png.flaticon.com/512/8604/8604476.png",
      "text_comment": comment.text,
      "username": sharedPrefUser.getString("username"),
    });

    if (response['status'] == "success") {
      print(response);
      emit(AddCommentSuccess());
      // navigatTo(context, const MyAppointMent());
      print(response);
    } else {
      emit(AddCommentError());
      print(response);
    }
  }

  getComment({required String postid}) async {
    var response = await postRequest(linkGetComment, {"id_post": postid});
    print(response);
    return response;
  }
    //search
    getSeach({
    required String category,
    required String city,
      }) async {
    var response = await postRequest(linkSearch, {
      "category": category,
      "city": city
      });
    print(response);
    return response;
  }


///chat
addChatUser(
    context, {
    required String time,
    required String docid,
    required TextEditingController text,
  }) async {
    emit(LoadingTrue());
    var response = await postRequest(linkChatAdd, {
      "id_user": sharedPrefUser.getString("id"),
      "id_doc": docid,
      "time": time,
      //"https://cdn-icons-png.flaticon.com/512/8604/8604476.png",
      "text": text.text,
      "username": sharedPrefUser.getString("username"),
    });

    if (response['status'] == "success") {
      print(response);
      emit(AddChatSuccess());
      // navigatTo(context, const MyAppointMent());
      print(response);
    } else {
      emit(AddChatError());
      print(response);
    }
  }
    getChat({required String docid,required String userid}) async {
    var response = await postRequest(linkChatGet, {
      "id_user": userid,
      "id_doc":docid
      
      });
    print(response);
    return response;
  }

  
  addChatDoc(
    context, {
    required String time,
    required String userId,
    required TextEditingController text,
  }) async {
    emit(LoadingTrue());
    var response = await postRequest(linkChatAdd, {
      "id_user": userId,
      "id_doc": sharedPrefDoc.getString("id"),
      "time": time,
      //"https://cdn-icons-png.flaticon.com/512/8604/8604476.png",
      "text": text.text,
      "username": sharedPrefDoc.getString("username"),
    });

    if (response['status'] == "success") {
      print(response);
      emit(AddChatSuccess());
      // navigatTo(context, const MyAppointMent());
      print(response);
    } else {
      emit(AddChatError());
      print(response);
    }
  }

   getUserProfiles() async {
    var response = await postRequest(linlProfileAll,{});
    return response;
  }




////jihascuajk
  //////////imagePacker

  // late File profileImage;
  // var picker = ImagePicker();

  // Future <void> getProfileImage() async{
  //   final pickedFile = await picker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if(pickedFile != null){
  //     profileImage = File(pickedFile.path);
  //     emit(ProfileImagePickedSuccessState());
  //   }else{
  //     print('No image selected');
  //     emit(ProfileImagePickedErorrState());
  //   }
  // }

  // var database;
  // List<Map> newTasks = [];
  // List<Map> doneTasks = [];
  // List<Map> archivedTasks = [];

  // void createDatabase() {
  //   openDatabase(
  //     'todo.ff',
  //     version: 3,
  //     onCreate: (database, version) {
  //       // id integer
  //       // title String
  //       // date String
  //       // time String
  //       // status String

  //       print('database created');
  //       database
  //           .execute(
  //               'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, type TEXT, descreption TEXT, category TEXT)')
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('Error When Creating Table ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       getDataFromDatabase(database);
  //       print('database opened');
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }

  // insertToDatabase({
  //   required String title,
  //   required String type,
  //   required String descreption,
  //   required String category,
  // }) async {
  //   await database.transaction((txn) {
  //     txn
  //         .rawInsert(
  //       'INSERT INTO tasks(title, type, descreption, category) VALUES("$title", "$type","$descreption", "$category")',
  //     )
  //         .then((value) {
  //       print('$value inserted successfully');

  //       emit(AppInsertDatabaseState());

  //       getDataFromDatabase(database);
  //     }).catchError((error) {
  //       print('Error When Inserting New Record ${error.toString()}');
  //     });

  //     return null;
  //   });
  // }

  // updateToDatabase({
  //   required String title,
  //   required String type,
  //   required String descreption,
  //   required String category,
  //   required int id,
  // }) async {
  //   await database.transaction((txn) {
  //     txn.rawUpdate(
  //       ''' UPDATE tasks SET
  //       title = "$title",
  //       type = "$type",
  //       descreption = "$descreption",
  //       category = "$category"
  //       WHERE id = "$id"''',
  //     ).then((value) {
  //       print('$value updated successfully');

  //       emit(UpdateDatabaseState());

  //       getDataFromDatabase(database);
  //     }).catchError((error) {
  //       print('Error When Updating New Record ${error.toString()}');
  //     });

  //     return null;
  //   });
  // }

  // void getDataFromDatabase(database) {
  //   newTasks = [];
  //   doneTasks = [];
  //   archivedTasks = [];

  //   emit(AppGetDatabaseLoadingState());

  //   database.rawQuery('SELECT * FROM tasks').then((value) {
  //     value.forEach((element) {
  //       // if(element['status'] == 'new') {
  //       //   newTasks.add(element);
  //       // } else if(element['status'] == 'done') {
  //       //   doneTasks.add(element);
  //       // } else {
  //       //   archivedTasks.add(element);
  //       // }
  //       newTasks.add(element);
  //     });

  //     emit(AppGetDatabaseState());
  //   });
  // }

  // void updateData({
  //   required String status,
  //   required int id,
  // }) async {
  //   database.rawUpdate(
  //     'UPDATE tasks SET status = ? WHERE id = ?',
  //     ['$status', id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppUpdateDatabaseState());
  //   });
  // }

  // void deleteData({
  //   required int id,
  // }) async {
  //   database.rawDelete(
  //     'DELETE FROM tasks WHERE id = ?',
  //     [id],
  //   ).then((value) {
  //     getDataFromDatabase(database);
  //     emit(AppDeleteDatabaseState());
  //   });
  // }

  // bool isBottomSheetShown = false;
  // IconData fabIcon = Icons.edit;
}
