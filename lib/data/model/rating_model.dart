class RatingModel {
  String? id;
  String? username;
  String? docRating;
  String? docNoterating;
  String? userId;
  String? docId;

  RatingModel(
      {this.id,
      this.username,
      this.docRating,
      this.docNoterating,
      this.userId,
      this.docId});

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    docRating = json['doc_rating'];
    docNoterating = json['doc_noterating'];
    userId = json['user_id'];
    docId = json['doc_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['username'] = this.username;
  //   data['doc_rating'] = this.docRating;
  //   data['doc_noterating'] = this.docNoterating;
  //   data['user_id'] = this.userId;
  //   data['doc_id'] = this.docId;
  //   return data;
  // }
}