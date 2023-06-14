class CommentModel {
  String? id;
  String? username;
  String? time;
  String? image;
  String? textComment;
  String? idPost;
  String? idUser;
  String? idDoc;

  CommentModel(
      {this.id,
      this.username,
      this.time,
      this.image,
      this.textComment,
      this.idPost,
      this.idUser,
      this.idDoc});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    time = json['time'];
    image = json['image'];
    textComment = json['text_comment'];
    idPost = json['id_post'];
    idUser = json['id_user'];
    idDoc = json['id_doc'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['username'] = this.username;
  //   data['time'] = this.time;
  //   data['image'] = this.image;
  //   data['text_comment'] = this.textComment;
  //   data['id_post'] = this.idPost;
  //   data['id_user'] = this.idUser;
  //   data['id_doc'] = this.idDoc;
  //   return data;
  // }
}