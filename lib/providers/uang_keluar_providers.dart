import 'package:flutter/material.dart';
import 'package:flutter_application/models/admission_fee_model.dart';
import 'package:flutter_application/services/uang_masuk_service.dart';

import '../services/uang_keluar_service.dart';

class UangKeluarProvider with ChangeNotifier {
  Future<bool> uangKeluar(
    String token,
     kategori_id,
     nama_barang,
     harga,
     metode_pembayaran,
     tanggal_pembelian,
  ) async {
    try {
      if (await UangKeluarService().uangKeluar(
        token,
        kategori_id,
        nama_barang,
        harga,
        metode_pembayaran,
        tanggal_pembelian,
      )) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }
}

//  Widget header() {  
//       return Scaffold(
//       appBar: AppBar(
//         leading: const BackButton(
//           color: Colors.black,
//         ),
//         title: Text(
//           'Home',
//           style: GoogleFonts.poppins(),
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 20),
//                     Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 24, right: 24),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Column(
//                                     children: <Widget>[
//                                       const CircleAvatar(
//                                         radius: 25,
//                                         backgroundColor: Colors.grey,
//                                         backgroundImage:
//                                             AssetImage('assets/user.png'),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.only(left: 10),
//                                     child: Column(
//                                       children: [  Text('Widiasih Rambe'
//                                               , style: GoogleFonts.poppins(),),
//                                                ],
//                                     ),
//                                   ),
//                                   const Spacer(),
//                                   IconButton(
//                                     onPressed: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (_) => const Profile(Key)));
//                                     },
//                                     icon: const Icon(
//                                       Icons.person,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 15,
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 10.0),
//                               Container(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 10),
//                                 child: ListTile(
//                                   title: Text(
//                                     'Statistik Bulanan',
//                                      style: GoogleFonts.poppins(),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                      const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: TextButton(
//                             style: ButtonStyle(
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white)),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const UangMasuk(Key)));
//                             },
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Tambah Uang Masuk',
//                                   style: GoogleFonts.poppins(),
//                                 ),
//                                 const Icon(Icons.add, size: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 20),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 20, vertical: 10),
//                           decoration: BoxDecoration(
//                             color: Colors.redAccent,
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                           child: TextButton(
//                             style: ButtonStyle(
//                                 foregroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         Colors.white)),
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const TambahData(Key)));
//                             },
//                             child: Column(
//                               children: [
//                                 Text(
//                                   'Tambah Uang Keluar',
//                                    style: GoogleFonts.poppins(),
//                                 ),
//                                 const Icon(Icons.add, size: 10),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
