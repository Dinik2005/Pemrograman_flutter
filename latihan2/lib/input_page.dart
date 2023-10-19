import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController mAwalController = TextEditingController();
  TextEditingController mAkhirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Data PDAM"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'images/logo.jpg',
              width: 100,
                height: 100,
            ),
            Container(
                color: Colors.yellow,
                padding:
                EdgeInsets.all(16), // Padding untuk latar belakang kuning
                child: Text(
                  'PDAM Padang',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black, // Warna teks hitam
                  ),
                ),
                ),
            SizedBox(height: 10),
            buildTextField(idController, "ID Pelanggan", TextInputType.number),
            SizedBox(height: 10),
            buildTextField(
                namaController, "Nama Pelanggan", TextInputType.text),
            SizedBox(height: 10),
            buildTextField(mAwalController, "Meter Awal", TextInputType.number),
            SizedBox(height: 10),
            buildTextField(
                mAkhirController, "Meter Akhir", TextInputType.number),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double meterAwal = double.parse(mAwalController.text);
                double meterAkhir = double.parse(mAkhirController.text);

                double totalMeteran = meterAkhir - meterAwal;
                double biaya = totalMeteran * 5000;
                double pajak = biaya * 0.05;
                double totalPembayaran = biaya + pajak;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultPage(
                          id: idController.text,
                          nama: namaController.text,
                          totalMeteran: totalMeteran,
                          totalBiaya: biaya,
                          pajak: pajak,
                          totalPembayaran: totalPembayaran,
                        ),
                  ),
                );
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Warna latar belakang hijau
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      TextInputType keyboardType) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
