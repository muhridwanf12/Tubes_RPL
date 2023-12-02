import 'package:flutter/material.dart';
import 'kalkulator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,  //agar tombol berada di tengah
          children: [
            //logo (kalo mau)




            SizedBox(
              width: 250,    // Lebar tombol
              height: 50,    // Tinggi tombol
              child: ElevatedButton(
                onPressed: () {     //==========direct ke page kalkulator antropometri===========
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>kalkulator())
                  );
                },         
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,     // Warna tombol
                ),
                child: const Text(
                  "Kalkulator Antropometri",
                   style: TextStyle(
                    color: Colors.white,  //warna teks pada tombol
                  ),
                ),
              ),
            ),

            
            const SizedBox(height: 20),   //untuk jarak pemisah tombol

            
            SizedBox(
              width: 250, // Lebar tombol
              height: 50, // Tinggi tombol
              child: ElevatedButton(
                onPressed: () {},                  //========direct ke page asesmen individu================
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna tombol
                ),
                child: const Text(
                  "Asesmen Individu",
                  style: TextStyle(
                    color: Colors.white,  //warna teks pada tombol
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
