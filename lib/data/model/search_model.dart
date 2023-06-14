class SearchModel {
  String? docId;
  String? docName;
  String? docCat;
  String? docYear;
  String? docDes;
  String? docImg;
  String? docPaitent;
  String? docDoctor;
  String? docCity;

  SearchModel(
      {this.docId,
      this.docName,
      this.docCat,
      this.docYear,
      this.docDes,
      this.docImg,
      this.docPaitent,
      this.docDoctor,
      this.docCity});

  SearchModel.fromJson(Map<String, dynamic> json) {
    docId = json['doc_id'];
    docName = json['doc_name'];
    docCat = json['doc_cat'];
    docYear = json['doc_year'];
    docDes = json['doc_des'];
    docImg = json['doc_img'];
    docPaitent = json['doc_paitent'];
    docDoctor = json['doc_doctor'];
    docCity = json['doc_city'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['doc_id'] = this.docId;
  //   data['doc_name'] = this.docName;
  //   data['doc_cat'] = this.docCat;
  //   data['doc_year'] = this.docYear;
  //   data['doc_des'] = this.docDes;
  //   data['doc_img'] = this.docImg;
  //   data['doc_paitent'] = this.docPaitent;
  //   data['doc_doctor'] = this.docDoctor;
  //   data['doc_city'] = this.docCity;
  //   return data;
  // }
}
