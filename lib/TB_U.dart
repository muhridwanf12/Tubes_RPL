import 'data_acuan.dart';

//function hitung z score TB/U
//RUMUS Z SCORE TB/U
//1. Jika TBanak = TBmedian:
//    z = (TBanak - TBmedian) / TBmedian
//
//2. Jika TBanak < TBmedian:
//    z = (TBanak -TBmedian) / (BBmedian - BBpada-1SD)
//
//3. Jika TBanak > TBmedian:
//    z = (TBanak - TBmedian) / (TBpada+1SD - TBmedian)

hitungTBU(gender, tb, usia, edema){
  if((tb == 0)| (usia < 0) | (usia > 60)){
    return "NA";
  }else{
    if (gender == "Laki-laki"){
      if(tb == tbul[usia][3]){
        return ((tb - tbul[usia][3])/tbul[usia][3]).toStringAsFixed(2);
      }else{
        if (tb < tbul[usia][3]){
          return ((tb - tbul[usia][3])/(tbul[usia][3] - tbul[usia][2])).toStringAsFixed(2);
        }else{
          return ((tb - tbul[usia][3])/(tbul[usia][4] - tbul[usia][3])).toStringAsFixed(2);
          }
        }
    }else{
      if(tb == tbup[usia][3]){
        return ((tb - tbup[usia][3])/tbup[usia][3]).toStringAsFixed(2);
      }else{
        if (tb < tbup[usia][3]){
          return ((tb - tbup[usia][3])/(tbup[usia][3] - tbup[usia][2])).toStringAsFixed(2);
        }else{
          return ((tb - tbup[usia][3])/(tbup[usia][4] - tbup[usia][3])).toStringAsFixed(2);
        }
      }
    }
  }
}