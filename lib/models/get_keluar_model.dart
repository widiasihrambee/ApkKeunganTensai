class KeluarModel{
  int id;
  String usersId;
  String kategoriId;
  String namaBarang;
  String harga;  
  String metodePembayaran;  
  String tanggal;

  KeluarModel({
    this.id,
    this.usersId,
    this.kategoriId,
    this.namaBarang,
    this.harga,
    this.metodePembayaran,
    this.tanggal,
  });

  KeluarModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usersId = json['users_id'];
    kategoriId = json['kategori_id'];
    namaBarang = json['nama_barang'];
    harga = json['harga'];
    metodePembayaran = json['metode_pembayaran'];
    tanggal = json['tanggal_pembelian'];
  }

  
  }
