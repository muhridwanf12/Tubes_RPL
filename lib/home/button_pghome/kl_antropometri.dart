import 'package:flutter/material.dart';
import 'package:tubes/page_kalkulator/_index.dart';

class KalkulatorAntropometri extends StatelessWidget {
  const KalkulatorAntropometri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Lebar tombol
      height: 50, // Tinggi tombol
      child: ElevatedButton(
        onPressed: () {
          //==========direct ke page kalkulator antropometri===========
          Navigator.push(context, MaterialPageRoute(builder: (context) => const kalkulator()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Warna tombol
        ),
        child: const Text(
          "Kalkulator Antropometri",
          style: TextStyle(
            color: Colors.white, //warna teks pada tombol
          ),
        ),
      ),
    );
  }
}
