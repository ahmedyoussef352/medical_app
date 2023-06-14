// ignore_for_file: prefer_collection_literals

class ProfileModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? idUser;

  ProfileModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.image,
      this.idUser});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['image'] = image;
    data['id_user'] = idUser;
    return data;
  }
}