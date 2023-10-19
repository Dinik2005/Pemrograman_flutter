import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String id;
  final String nama;
  final double totalMeteran;
  final double totalBiaya;
  final double pajak;
  final double totalPembayaran;

  ResultPage({
    required this.id,
    required this.nama,
    required this.totalMeteran,
    required this.totalBiaya,
    required this.pajak,
    required this.totalPembayaran,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Perhitungan PDAM"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildResultText("ID Pelanggan", id),
            buildResultText("Nama Pelanggan", nama),
            buildResultText("Total Meteran", totalMeteran.toStringAsFixed(2)),
            buildResultText("Total Biaya", totalBiaya.toStringAsFixed(2)),
            buildResultText("Pajak", pajak.toStringAsFixed(2)),
            buildResultText("Total Pembayaran", totalPembayaran.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Widget buildResultText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        "$label: $value",
        textAlign: TextAlign.left,
      ),
    );
  }
}
