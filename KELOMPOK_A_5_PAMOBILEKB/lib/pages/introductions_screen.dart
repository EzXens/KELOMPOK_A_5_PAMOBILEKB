import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: const Text("Selanjutnya"),
      done: const Text("Selesai"),
      onDone: () {
        Navigator.pushReplacementNamed(context, '/');
      },
      pages: [
        PageViewModel(
          title: "Selamat Datang di Aplikasi Klasifikasi Penyakit Padi",
          body:
              "Aplikasi ini membantu Anda mengenali berbagai jenis penyakit pada tanaman padi berdasarkan gambar.",
          image: Image.network(
              "https://pertanian-mesuji.id/wp-content/uploads/2018/04/klasifikasi-dan-morfologi-padi.jpg"),
        ),
        PageViewModel(
          title: "Langkah 1: Pilih Menu Identifikasi",
          body:
              "Pertama-tama Silahkan menuju ke menu identifikasi ,dengan menekan tombol di bawah dengan icon kamera.",
          image: Image.asset("assets/tutor1.png"),
        ),
        PageViewModel(
          title:
              "Langkah 2: Memilih ambil gambar atau pilih gambar dari direktori",
          body:
              "Setelah berada di menu identifikasi ,silahkan pengguna memilih ambil gambar dengan kamera atau pilih gambar dari direktori",
          image: Image.asset("assets/tutor2.png"),
        ),
        PageViewModel(
          title:
              "Langkah 3: melakukan identifikasi dengan gambar yang telah dipilih",
          body:
              "Setelah memilih gambar ,pengguna dapat melakukan identifikasi dengan mengklik tombol prediksi , lalu hasil akan muncul",
          image: Image.asset("assets/tutor3.png"),
        ),
        PageViewModel(
          title: "Mulai Menggunakan Aplikasi",
          body: "Tekan tombol 'Selesai' untuk mulai menggunakan aplikasi.",
          image: Image.network(
              "https://independensi.com/wp-content/uploads/2018/04/Budidaya-padi-sehat.jpg"),
        ),
      ],
    );
  }
}
