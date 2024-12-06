import 'package:flutter/material.dart';

class HamaPadiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hama Padi'),
        backgroundColor: const Color(0xFF107115),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                "Hama pada Tanaman Padi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // Penjelasan Umum
              const Text(
                "Hama padi adalah organisme yang merusak tanaman padi, menyebabkan penurunan hasil panen dan kualitas beras. Pengetahuan tentang hama padi penting untuk menentukan metode pengendalian yang efektif.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Daftar Hama
              const Text(
                "Jenis-Jenis Hama Padi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // ListView dengan Hama
              Column(
                children: [
                  _buildHamaItem(
                    "Wereng Batang Coklat (Nilaparvata lugens)",
                    "Wereng batang coklat (WBC) atau Nilaparvata lugens adalah salah satu hama penting yang menyerang tanaman padi di Indonesia. Hama ini menyebabkan kerusakan pada tanaman padi dengan cara menghisap cairan dari daun dan batang, yang mengarah pada gejala kuning pada daun, daun mengering, serta penghambatan pertumbuhan tanaman. Infestasi berat dapat menyebabkan tanaman menjadi kerdil dan mati, bahkan mengakibatkan kehilangan hasil panen yang signifikan. Selain itu, wereng batang coklat juga berperan sebagai vektor virus penyakit seperti tungro. Pengendalian terhadap wereng batang coklat dilakukan melalui penggunaan insektisida, rotasi tanaman, serta pemilihan varietas padi yang tahan terhadap hama ini.",
                    "assets/hama_padi/wereng_batang_coklat.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildHamaItem(
                    "Tikus Sawah (Rattus argentiventer)",
                    "Tikus sawah (Rattus argentiventer) adalah salah satu hama yang sering menyerang tanaman padi di Indonesia, terutama pada lahan persawahan. Tikus ini dapat merusak tanaman padi dengan cara memakan biji padi yang masih muda, batang padi, dan bahkan akar tanaman padi. Selain itu, tikus juga dapat menyebabkan kerusakan pada infrastruktur pertanian, seperti alat irigasi dan tanggul sawah. Gejala serangan tikus di antaranya adalah adanya lubang pada batang padi, tanaman yang patah atau rusak, serta tanaman yang tidak tumbuh dengan baik. Pengendalian tikus dilakukan dengan cara menggunakan jebakan, rodentisida, pengelolaan habitat sawah, serta upaya pencegahan seperti menanam padi secara serempak agar tikus tidak memiliki tempat berlindung yang cukup.",
                    "assets/hama_padi/tikus_sawah.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildHamaItem(
                    "Penggerek Batang Padi (Scirpophaga incertulas)",
                    "Penggerek batang padi (Scirpophaga excerptalis dan Scirpophaga excerptalis) adalah salah satu hama utama yang menyerang tanaman padi. Hama ini tergolong dalam jenis ngengat dan larvanya menggerek batang padi, menyebabkan kerusakan yang signifikan. Gejala serangan penggerek batang terlihat dari adanya lubang kecil pada batang tanaman padi dan daun yang menguning serta kering. Ketika larva menggerek batang, hal ini dapat menyebabkan tanaman padi menjadi lemah, patah, atau mati. Infestasi berat dapat mengurangi hasil panen secara drastis. Pengendalian penggerek batang dilakukan dengan cara penggunaan insektisida yang tepat, pemilihan varietas padi yang tahan terhadap hama ini, serta pengelolaan lingkungan sawah untuk mengurangi tempat berkembang biaknya hama.",
                    "assets/hama_padi/penggerek_batang_padi.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildHamaItem(
                    "Walang Sangit (Leptocorisa oratorius)",
                    "Walang sangit (Leptocorisa acuta) adalah salah satu jenis hama yang sering menyerang tanaman padi di Indonesia. Hama ini termasuk dalam keluarga pentatomidae atau dikenal juga sebagai kepik padi. Walang sangit dewasa berwarna hijau kekuningan dengan tubuh ramping dan kaki panjang. Hama ini menghisap cairan pada tanaman padi, terutama pada bunga dan biji, yang dapat menyebabkan bulir padi gagal berkembang dengan baik. Gejala serangan termasuk butiran padi yang kosong, biji yang tidak berkembang dengan sempurna, dan penurunan kualitas hasil panen. Serangan yang parah dapat menurunkan hasil padi secara signifikan. Pengendalian hama ini dapat dilakukan dengan cara menggunakan insektisida yang sesuai, melakukan pemusnahan telur dan larva, serta menerapkan sistem tanam yang lebih baik untuk mengurangi populasi hama.",
                    "assets/hama_padi/walang_sangit.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildHamaItem(
                    "Ulat Grayak (Spodoptera litura)",
                    "Ulat grayak (Spodoptera litura) adalah salah satu hama yang menyerang tanaman padi. Hama ini termasuk dalam keluarga Noctuidae dan merupakan jenis ulat yang sangat merusak, terutama pada fase vegetatif tanaman padi. Ulat grayak memiliki warna tubuh coklat kehijauan dengan garis-garis gelap pada sisi tubuhnya. Larva ulat ini memakan daun padi dengan cara merusak jaringan daun, yang menyebabkan daun menjadi berlubang dan kering. Pada serangan yang parah, tanaman padi dapat mengalami kerusakan yang signifikan, mengurangi jumlah produksi dan kualitas hasil panen. Gejala serangan ulat grayak dapat dikenali dari daun padi yang berlubang, serta keberadaan ulat di bagian bawah daun atau batang padi. Pengendalian ulat grayak dapat dilakukan dengan penyemprotan insektisida yang tepat, penggunaan pestisida biologi, serta pemanfaatan musuh alami untuk mengurangi populasi hama ini.",
                    "assets/hama_padi/ulat_grayak.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi hama
  Widget _buildHamaItem(String title, String description, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Hama
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Deskripsi Hama
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF107115),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
