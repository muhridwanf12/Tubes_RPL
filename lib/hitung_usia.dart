
hitungUsia(DateTime pengukuran, DateTime lahir) {
  int tahun = pengukuran.year - lahir.year;
  int bulan = pengukuran.month - lahir.month;

  if (pengukuran.day < lahir.day) {
    bulan--; // Kurangi satu bulan jika tanggal pengukuran sebelum tanggal lahir
  }

  int usia = (tahun * 12) + bulan;

  return usia < 0 ? 0 : usia.toDouble();
}




