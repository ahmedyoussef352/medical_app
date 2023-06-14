class ChatModel {
  String? id;
  String? username;
  String? time;
  String? text;
  String? idDoc;
  String? idUser;

  ChatModel(
      {this.id,
      this.username,
      this.time,
      this.text,
      this.idDoc,
      this.idUser});

  ChatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    time = json['time'];
    text = json['text'];
    idDoc = json['id_doc'];
    idUser = json['id_user'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['username'] = this.username;
  //   data['image'] = this.image;
  //   data['time'] = this.time;
  //   data['text'] = this.text;
  //   data['id_doc'] = this.idDoc;
  //   data['id_user'] = this.idUser;
  //   return data;
  // }
}