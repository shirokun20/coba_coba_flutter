import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatelessWidget {
  const PieChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    // PieChart: Ini adalah widget utama untuk menampilkan grafik lingkaran.
    // Widget ini membutuhkan parameter PieChartData untuk mengonfigurasi data
    // yang akan ditampilkan
    return PieChart(
      // Merupakan data yang digunakan untuk mengatur bagaimana grafik lingkaran akan
      // ditampilkan.
      PieChartData(
        // Mendefinisikan sejumlah bagian dari grafik lingkaran
        sections: [
          // mewakili satu bagian dengan nilai tertentu.
          PieChartSectionData(
            // Menentukan nilai atau persentase dari bagian tersebut.
            value: 3,
            // Menentukan teks yang akan ditampilkan di dalam bagian tersebut.
            title: 'Buku',
            // Menentukan warna dari bagian tersebut.
            color: Colors.blue,
            // Menentukan ukuran radius dari bagian tersebut.
            radius: 80,
            // Mendefinisikan gaya teks untuk judul di dalam bagian tersebut, seperti ukuran font, ketebalan, dan warna.
            titleStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            value: 2,
            title: 'Polpen',
            color: Colors.green,
            radius: 80,
            titleStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
        // Menentukan ukuran radius dari bagian tengah grafik lingkaran.
        centerSpaceRadius: 40,
        // Menentukan jarak antara setiap bagian di grafik lingkaran.
        sectionsSpace: 0,
      ),
    );
  }
}
