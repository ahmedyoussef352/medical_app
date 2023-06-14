
class InfoModel {
  String? docId;
  String? docName;
  String? docCat;
  String? docYear;
  String? docDes;
  String? docImg;
  String? docPaitent;
  String? docDoctor;
  String? docCity;

  InfoModel(
      {this.docId,
      this.docName,
      this.docCat,
      this.docYear,
      this.docDes,
      this.docImg,
      this.docPaitent,
      this.docDoctor,
      this.docCity});

  InfoModel.fromJson(Map<String, dynamic> json) {
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
}