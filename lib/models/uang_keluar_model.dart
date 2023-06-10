class UangKeluarModel{
 String kategori_id;
  String nama_barang;
  String harga;
  String metode_pembayaran;
  String tanggal_pembelian;

  UangKeluarModel({
    this.kategori_id,
    this.nama_barang,
    this.harga,
    this.metode_pembayaran,
    this.tanggal_pembelian,
  });

  UangKeluarModel.fromJson(Map<String, dynamic> json) {
    kategori_id = json['kategori_id'];
    nama_barang = json['nama_barang'];
    harga = json['harga'];
    metode_pembayaran = json['metode_pembayaran'];
    tanggal_pembelian = json['tanggal_pembelian'];
  }
  Map<String, dynamic> toJson() {
    return {
      'kategori_id': kategori_id,
      'nama_barang': nama_barang,
      'harga': harga,
      'metode_pembayaran': metode_pembayaran,
      'tanggal_pembelian': tanggal_pembelian,
    };

  }
  }
