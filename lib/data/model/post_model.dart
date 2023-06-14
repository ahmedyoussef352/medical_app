
class PostModel {
  String? id;
  String? postContent;
  String? userName;
  String? postImage;
  String? idUser;

  PostModel(
      {this.id, this.postContent, this.userName, this.postImage ,this.idUser});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postContent = json['post_content'];
    userName = json['user_name'];
    postImage = json['post_image'];
    idUser = json['id_user'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['post_content'] = this.postContent;
  //   data['user_name'] = this.userName;
  //   data['post_image'] = this.postImage;
  //   data['id_user'] = this.idUser;
  //   return data;
  // }
}