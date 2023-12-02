import 'package:flutter/material.dart';
import 'package:tubes/home/button_pghome/as_individu.dart';
import 'package:tubes/home/button_pghome/kl_antropometri.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //agar tombol berada di tengah
          children: [
            //logo (kalo mau)

            KalkulatorAntropometri(),

            SizedBox(height: 20), //untuk jarak pemisah tombol

            AsesmenIndividu(),
          ],
        ),
      ),
    );
  }
}
