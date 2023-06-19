  //  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matcher/matcher.dart';
import 'package:intl/intl.dart';

class CurrencyFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
   if (newValue.selection.baseOffset == 0) {
    return newValue;
   }
   double d = 100286020524.17;
   final hargaBarangController = NumberFormat.currency(locale:'ID', decimalDigits: 0, symbol: 'Rp');
   print(hargaBarangController.format(d)); // IDR100.286.020.524,17

   String newText = hargaBarangController.format(d);

   return newValue.copyWith(
    text: newText,
    selection: TextSelection.collapsed(offset: newText.length)
   );
  }
  
}