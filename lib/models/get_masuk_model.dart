class MasukModel{
  int id;
  String usersId;
  String name;
  String description;
  String price;
  String date;
 

  MasukModel({
    this.id,
    this.usersId,
    this.name,
    this.description,
    this.price,
    this.date,
  });

   MasukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    name = json['nama_masuk'];
    description = json['deskripsi'];
    price = json['harga_masuk'];
    date = json['tanggal_masuk'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'users_id': usersId,
      'nama_masuk': name,
      'deskripsi': description,
      'harga_masuk': price,
      'tanggal_masuk': date,
    };
  }
}