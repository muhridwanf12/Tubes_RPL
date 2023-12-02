part of '../_index.dart';

//function hitung z score BB/U
//RUMUS Z SCORE BB/U:
//1. Jika BBanak < BBmedian:
//    z = (BBanak - BBmedian) / (BBmedian - BBpada-1SD)

//2. Jika BBanak = BBmedian:
//    z = (BBanak - BBmedian) / BBmedian

//3. Jika BBanak > BBmedian:
//    z = (BBanak -BBmedian) / (BBpada+1SD - BBmedian)
hitungBBU(gender, bb, usia, edema) {
  if ((edema == "Ya") | (bb == 0) | (usia < 0) | (usia > 60)) {
    return "NA";
  } else {
    if (gender == "Laki-laki") {
      if (bb == bbul[usia][3]) {
        return ((bb - bbul[usia][3]) / bbul[usia][3]).toStringAsFixed(2);
      } else {
        if (bb < bbul[usia][3]) {
          return ((bb - bbul[usia][3]) / (bbul[usia][3] - bbul[usia][2])).toStringAsFixed(2);
        } else {
          return ((bb - bbul[usia][3]) / (bbul[usia][4] - bbul[usia][3])).toStringAsFixed(2);
        }
      }
    } else {
      if (bb == bbup[usia][3]) {
        return ((bb - bbup[usia][3]) / bbup[usia][3]).toStringAsFixed(2);
      } else {
        if (bb < bbup[usia][3]) {
          return ((bb - bbup[usia][3]) / (bbup[usia][3] - bbup[usia][2])).toStringAsFixed(2);
        } else {
          return ((bb - bbup[usia][3]) / (bbup[usia][4] - bbup[usia][3])).toStringAsFixed(2);
        }
      }
    }
  }
}
