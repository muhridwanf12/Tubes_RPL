import 'data_acuan.dart';


//function hitung z score BB/TB
//RUMUS MENGHITUNG Z SCORE BB/TB
hitungBBTB(gender, bb, tb, usia, edema){
  if ((edema == "Ya") | (bb == 0) | (tb == 0) | (usia > 60) | (usia < 0)){
    return "NA";
  }else{
    //bulatkan tb menjadi x.0 atau x.5
    if (tb - tb.floor() < 0.25) {
      tb = tb.floor().toDouble();
    } else if ((tb - tb.floor() >= 0.25) && (tb - tb.floor() < 0.75)) {
      tb = tb.floor().toDouble() + 0.5;
    } else {
      tb = (tb.floor() + 1).toDouble();
    }
    //jika usia 0-24 bulan
    if (usia < 25 && usia >=0){
      //jika laki-laki 0-24
      if (gender == "Laki-laki"){
        if ((tb < 82.5) | (tb > 110)){
          return "NA";
        }else{
          double x = tb - 82.5; 
          int baris = x.toInt();
          if (bb < bbtbl024[baris][4]){
            return ((bb - bbtbl024[baris][4])/(bbtbl024[baris][4] - bbtbl024[baris][3])).toStringAsFixed(3);
          }else if (bb > bbtbl024[baris][4]){
            return ((bb - bbtbl024[baris][4])/(bbtbl024[baris][5] - bbtbl024[baris][4])).toStringAsFixed(3);
          }else{
            return ((bb - bbtbl024[baris][4])/bbtbl024[baris][4]).toStringAsFixed(3);
          }
        }
      //jika perempuan 0-24
      }else{
        if ((tb < 45) | (tb > 110)){
          return "NA";
        }else{
          double x = tb - 45;
          int baris = x.toInt();
          if (bb < bbtbp024[baris][4]){
            return ((bb - bbtbp024[baris][4])/(bbtbp024[baris][4] - bbtbp024[baris][3])).toStringAsFixed(3);
          }else if (bb > bbtbp024[baris][4]){
            return ((bb - bbtbp024[baris][4])/(bb - bbtbp024[baris][5] - bb - bbtbp024[baris][4])).toStringAsFixed(3);
          }else{
            return ((bb - bbtbp024[baris][4])/bbtbp024[baris][4]).toStringAsFixed(3);
          }
        }
      }
    }
    //jika usia 25-60 bulan
    else if (usia > 24 && usia <= 60){
      //jika laki-laki 25-60
      if (gender == "Laki-laki"){
        if ((tb < 65) | (tb > 120)){
          return "NA";
        }else{
          double x = tb - 65;
          int baris = x.toInt();
          if (bb < bbtbl2460[baris][4]){
            return ((bb - bbtbl2460[baris][4])/(bbtbl2460[baris][4] - bbtbl2460[baris][3])).toStringAsFixed(3);
          }else if (bb > bbtbl2460[baris][4]){
            return ((bb - bbtbl2460[baris][4])/(bbtbl2460[baris][5] - bbtbl2460[baris][4])).toStringAsFixed(3);
          }else{
            return ((bb - bbtbl2460[baris][4])/bbtbl2460[baris][4]).toStringAsFixed(3);
          }
        }
      //jika perempuan 25-60
      }else{
        if ((tb < 65) | (tb > 120)){
          return "NA";
        }else{
          int baris = tb - 65;
          if (bb < bbtbp2460[baris][4]){
            return ((bb - bbtbp2460[baris][4])/(bbtbp2460[baris][4] - bbtbp2460[baris][3])).toStringAsFixed(3);
          }else if (bb > bbtbp2460[baris][4]){
            return ((bb - bbtbp2460[baris][4])/(bb - bbtbp2460[baris][5] - bb - bbtbp2460[baris][4])).toStringAsFixed(3);
          }else{
            return ((bb - bbtbp2460[baris][4])/bbtbp2460[baris][4]).toStringAsFixed(3);
          }
        }
      }
    }
  }
}