import 'package:flutter/material.dart';

class AsesmenIndividu extends StatelessWidget {
  const AsesmenIndividu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Lebar tombol
      height: 50, // Tinggi tombol
      child: ElevatedButton(
        onPressed: () {}, //========direct ke page asesmen individu================
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Warna tombol
        ),
        child: const Text(
          "Asesmen Individu",
          style: TextStyle(
            color: Colors.white, //warna teks pada tombol
          ),
        ),
      ),
    );
  }
}
