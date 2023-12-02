import 'package:flutter/material.dart';

beriwarna(nilai, batas1, batas2, double? batas3, double? batas4, double? batas5){
  if (nilai < batas1){
    return Colors.red;
  }else if (nilai < batas2){
    return Colors.amber;
  }else if (nilai < batas3){
    return Colors.green;
  }else if (nilai > batas4){
    return Colors.red;
  }else if (nilai > batas5){
    return Colors.amber;
  }
}