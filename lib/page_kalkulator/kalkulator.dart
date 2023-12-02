part of '_index.dart';

class kalkulator extends StatefulWidget {
  const kalkulator({super.key});

  @override
  State<kalkulator> createState() => _kalkulatorState();
}

class _kalkulatorState extends State<kalkulator> {
  String gender = "Laki-laki";
  String edema = "Ya";
  DateTime pengukuran = DateTime.now();
  DateTime lahir = DateTime.now();
  double usia = 0;
  double bb = 0;
  double tb = 0;
  double imtu = 0;
  double bbtb = 0;
  double bbu = 0;
  double tbu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back, //ikon kembali
            color: Colors.white, //warna ikon kembali
          ),
          onPressed: () {
            //======= direct ke halaman awal =========
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text(
            "Kalkulator Antropometri",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue, //warna appbar
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            //form input untuk tanggal pengukuran
            TextField(
                onTap: () async {
                  DateTime? pilihTanggal = await showDatePicker(
                      context: context, initialDate: pengukuran, firstDate: DateTime(1945), lastDate: DateTime(2100));
                  if (pilihTanggal != null && pilihTanggal != pengukuran) {
                    setState(() {
                      pengukuran = pilihTanggal;
                    });
                  }
                },
                readOnly: true,
                controller: TextEditingController(
                  text: DateFormat('dd-MM-yyyy').format(pengukuran),
                ),
                decoration: const InputDecoration(
                    hoverColor: Colors.blue, labelText: "Tanggal pengukuran", border: OutlineInputBorder())),

            //jarak pemisah antara tgl pengukuran dgn jenis kelamin
            const SizedBox(height: 5),

            //radio button untuk jenis kelamin
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 100, child: Text("Jenis Kelamin")),
                Radio(
                  value: "Laki-laki",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(
                  width: 80,
                  child: Text("Laki-laki"),
                ),
                Radio(
                  value: "Perempuan",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                const SizedBox(width: 80, child: Text("Perempuan")),
              ],
            ),

            //form edema
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 100, child: Text("Edema")),
                Radio(
                  value: "Ya",
                  groupValue: edema,
                  onChanged: (value) {
                    setState(() {
                      edema = value.toString();
                    });
                  },
                ),
                const SizedBox(width: 80, child: Text("Ya")),
                Radio(
                  value: "Tidak",
                  groupValue: edema,
                  onChanged: (value) {
                    setState(() {
                      edema = value.toString();
                    });
                  },
                ),
                const SizedBox(width: 80, child: Text("Tidak")),
              ],
            ),

            //jarak pemisah
            const SizedBox(height: 7),

            //form input tanggal lahir
            TextField(
              onTap: () async {
                DateTime? pilihTanggal = await showDatePicker(
                    context: context, initialDate: lahir, firstDate: DateTime(1945), lastDate: DateTime(2100));
                if (pilihTanggal != null && pilihTanggal != lahir) {
                  setState(() {
                    lahir = pilihTanggal;
                    usia = hitungUsia(pengukuran, lahir);
                  });
                }
              },
              readOnly: true,
              controller: TextEditingController(
                text: DateFormat('dd-MM-yyyy').format(lahir),
              ),
              decoration: const InputDecoration(
                label: Text("Tanggal lahir"),
                border: OutlineInputBorder(),
              ),
            ),

            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                "Usia : ${usia.toInt()} bulan",
                style: const TextStyle(fontSize: 11),
              )
            ]),

            //jarak pemisah antara form tanggal lahir dengan BB
            const SizedBox(height: 15),

            //form input BB
            TextFormField(
                onChanged: (berat) {
                  setState(() {
                    bb = berat.isEmpty ? 0.0 : double.parse(berat);
                    imtu = double.parse(hitungIMTU(gender, bb, tb, usia, edema));
                    bbtb = double.parse(hitungBBTB(gender, bb, tb, usia, edema));
                    bbu = double.parse(hitungBBU(gender, bb, usia, edema));
                    tbu = double.parse(hitungTBU(gender, tb, usia, edema));
                  });
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}')),
                ],
                decoration: const InputDecoration(
                  label: Text("Berat badan (kg)"),
                  border: OutlineInputBorder(),
                )),

            //jarak pemisah antara form BB dengan TB
            const SizedBox(height: 15),

            //form input TB
            TextField(
                onChanged: (tinggi) {
                  setState(() {
                    tb = tinggi.isEmpty ? 0.0 : double.parse(tinggi);
                    imtu = double.parse(hitungIMTU(gender, bb, tb, usia, edema));
                    bbtb = double.parse(hitungBBTB(gender, bb, tb, usia, edema));
                    bbu = double.parse(hitungBBU(gender, bb, usia, edema));
                    tbu = double.parse(hitungTBU(gender, tb, usia, edema));
                  });
                },
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,9}')),
                ],
                decoration: const InputDecoration(label: Text("Tinggi badan (cm)"), border: OutlineInputBorder())),

            //jarak pemisah
            const SizedBox(height: 10),

            //=============INFORMASI HASIL PERHITUNGAN=========================================
            //blok IMT
            ListTile(
                title: const Text(
                  "IMT/U",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Z Score Indeks Masa Tubuh terhadap Usia"),
                    Text(
                      hitungIMTU(gender, bb, tb, usia.toInt(), edema), //nilai perhitungan
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: beriwarna(imtu, -3, -2, 1, 3, 2), //warna sesuai perhitungan
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart_outlined),
                  color: Colors.black,
                )),

            //blok BB/TB
            ListTile(
                title: const Text(
                  "BB/TB",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Z Score Berat Badan terhadap Tinggi Badan"),
                    Text(
                      hitungBBTB(gender, bb, tb, usia.toInt(), edema), //nilai perhitungan
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: beriwarna(bbtb, -3, -2, 1, 3, 2), //warna sesuai hasil perhitungan
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart_outlined),
                  color: Colors.black,
                )),

            //blok BB/U
            ListTile(
                title: const Text(
                  "BB/U",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Z Score Berat Badan terhadap Usia"),
                    Text(
                      hitungBBU(gender, bb, usia.toInt(), edema), //hasil perhitungan
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: beriwarna(bbu, -3, -2, 1, 1, null), //warna sesuai hasil perhitungan
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart_outlined),
                  color: Colors.black,
                )),

            //blok TB/U
            ListTile(
                title: const Text(
                  "TB/U",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Z Score Tinggi Badan terhadap Usia"),
                    Text(
                      hitungTBU(gender, tb, usia.toInt(), edema), //hasil perhitungan
                      style: TextStyle(
                          color: Colors.white,
                          backgroundColor: beriwarna(tbu, -3, -2, 3, 3, null), //warna sesuai hasil prhitungan
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart_outlined),
                  color: Colors.black,
                )),
          ]),
        ),
      )),
    );
  }
}
