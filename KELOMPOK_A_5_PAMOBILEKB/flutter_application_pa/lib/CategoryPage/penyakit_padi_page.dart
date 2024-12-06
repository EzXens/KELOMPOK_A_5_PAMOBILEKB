import 'package:flutter/material.dart';

class PenyakitPadiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penyakit Padi'),
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
                "Penyakit Padi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // Penjelasan Umum
              const Text(
                "Penyakit pada tanaman padi adalah salah satu faktor utama yang memengaruhi produktivitas. Penyakit ini dapat disebabkan oleh jamur, bakteri, virus, atau bahkan kondisi lingkungan yang tidak mendukung. Memahami penyakit-penyakit ini membantu petani mengambil langkah pencegahan dan penanganan yang tepat.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Daftar Penyakit
              const Text(
                "Penyakit-Penyakit Utama pada Padi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // ListView dengan Penyakit
              Column(
                children: [
                  _buildPenyakitItem(
                    "Hawar Daun Bakteri (HDB)",
                    "Hawar Daun Bakteri (HDB) pada padi disebabkan oleh bakteri Xanthomonas oryzae pv. oryzae. Penyakit ini ditandai dengan munculnya bercak-bercak berwarna kuning terang hingga coklat pada daun padi. Bercak tersebut biasanya dimulai dari tepi daun dan meluas ke tengah, seringkali dengan garis-garis yang jelas. Gejala lain termasuk daun yang mengering dan akhirnya mati. Penyebaran penyakit ini dapat terjadi melalui air yang terkontaminasi, alat pertanian yang tidak bersih, atau melalui angin. HDB dapat menurunkan hasil padi secara signifikan jika tidak ditangani dengan baik. Pengendalian dilakukan dengan menggunakan varietas padi yang tahan terhadap penyakit ini, pengaturan irigasi yang baik untuk menghindari kelembapan berlebih, serta penyemprotan dengan bakteri atau fungisida tertentu.",
                    "assets/penyakit/hdb.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Blast",
                    "Blast adalah penyakit yang disebabkan oleh jamur Magnaporthe oryzae, yang juga dikenal dengan nama rice blast fungus. Penyakit ini menyerang berbagai bagian tanaman padi, seperti daun, leher malai, dan batang, menyebabkan bercak-bercak yang berbentuk seperti air mata dengan tepi yang tumpul dan berwarna coklat. Pada daun, bercak-bercak ini dapat berkembang menjadi luka besar yang mengering. Jika menyerang malai, infeksi dapat menyebabkan malai yang tidak berkembang dengan baik, bahkan tidak berisi. Blast dapat menyebabkan penurunan hasil panen yang signifikan, terutama jika infeksi terjadi pada fase pertumbuhan kritis tanaman. Pengendalian dapat dilakukan dengan menggunakan varietas padi yang tahan terhadap blast, aplikasi fungisida, serta manajemen lahan yang baik, seperti pengaturan jarak tanam dan rotasi tanaman.",
                    "assets/penyakit/blast.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Tungro",
                    "Tungro adalah penyakit yang disebabkan oleh virus Rice Tungro Bacilliform Virus (RTBV) dan Rice Tungro Spherical Virus (RTSV), yang ditularkan oleh wereng hijau (Nephotettix virescens). Gejala utama penyakit ini adalah daun yang menguning, tanaman menjadi kerdil, dan malai padi yang terinfeksi biasanya tidak dapat berkembang dengan baik atau bahkan tidak berisi. Pada beberapa kasus, daun bisa mengalami perubahan warna menjadi merah atau oranye. Penyakit ini dapat menurunkan hasil panen secara signifikan, karena pertumbuhan tanaman yang terhambat. Pencegahan dapat dilakukan dengan mengendalikan populasi wereng dengan pestisida atau dengan menggunakan varietas padi yang tahan terhadap penyakit ini.",
                    "assets/penyakit/tungro.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Busuk Batang",
                    "Busuk Batang pada padi disebabkan oleh jamur Fusarium moniliforme. Gejala utama dari penyakit ini adalah batang padi yang menjadi rapuh, berwarna coklat kehitaman, dan mudah patah. Tanaman yang terinfeksi akan menunjukkan pertumbuhan yang terhambat, dan pada beberapa kasus, tanaman bisa mati. Penyakit ini sering menyerang tanaman padi yang sudah tua atau tanaman yang terkena stres, seperti kekurangan air atau terlalu banyak hujan. Busuk batang dapat mengurangi kualitas dan kuantitas hasil panen padi. Pencegahan dapat dilakukan dengan menggunakan benih yang sehat, rotasi tanaman, serta pengendalian kelembaban yang baik di sawah.",
                    "assets/penyakit/busuk_batang.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Bercak Daun Coklat",
                    "Bercak Daun Coklat pada padi disebabkan oleh jamur Cochliobolus miyabeanus. Gejala utama dari penyakit ini adalah munculnya bercak-bercak kecil berwarna coklat pada daun padi, yang biasanya dimulai dari ujung daun dan menyebar ke seluruh permukaan daun. Bercak ini dapat berkembang menjadi area yang lebih besar dan menyebabkan daun mengering. Jika infeksi parah, penyakit ini dapat mengurangi fotosintesis tanaman dan berpotensi menurunkan hasil panen padi. Pencegahan dapat dilakukan dengan menggunakan varietas padi yang tahan terhadap penyakit ini serta pengelolaan irigasi dan pemupukan yang tepat.",
                    "assets/penyakit/bercak_coklat.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Kerdil Rumput",
                    "Kerdil rumput pada padi disebabkan oleh infeksi virus kerdil rumput yang ditularkan oleh serangga seperti wereng coklat atau wereng hijau. Gejala utama dari penyakit ini adalah pertumbuhan tanaman padi yang terhambat, dengan tanaman menjadi lebih pendek atau kerdil dari ukuran normalnya. Daun tanaman menjadi lebih kecil dan berwarna kekuningan, serta menunjukkan gejala pengerutan atau kelengkungan.",
                    "assets/penyakit/kerdil_rumput.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Kerdil Hampa",
                    "Kerdil hampa pada padi disebabkan oleh infeksi virus Rice grassy stunt virus (RGSV) dan Rice dwarf virus (RDV), yang ditularkan oleh serangga seperti wereng hijau (Nilaparvata lugens). Virus ini menghambat pertumbuhan tanaman padi, menyebabkan tanaman menjadi kerdil, pertumbuhannya terhambat, dan malai yang terbentuk tidak menghasilkan biji padi yang sempurna atau bahkan tidak berisi sama sekali (hampa). Gejala lain termasuk daun yang menguning, pertumbuhan yang tidak normal, dan penurunan jumlah malai yang terbentuk.",
                    "assets/penyakit/padi_kerdil_hampa.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Busuk Akar Padi",
                    "Penyakit busuk akar padi disebabkan oleh jamur Fusarium dan Pythium yang berkembang biak di tanah lembab atau tergenang. Jamur ini menginfeksi akar padi, menyebabkan akar membusuk, berwarna coklat atau hitam, dan mudah lepas dari tanah. Gejala penyakit ini meliputi pertumbuhan tanaman yang terhambat, daun yang menguning, dan tanaman yang mudah roboh akibat akar yang tidak berfungsi dengan baik. Penyakit ini sering muncul pada lahan dengan drainase buruk atau genangan air berlebihan.",
                    "assets/penyakit/busuk_akar.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildPenyakitItem(
                    "Karat Daun",
                    "Karat daun pada padi disebabkan oleh infeksi jamur Puccinia yang mengarah pada pembentukan bercak-bercak berwarna oranye atau kekuningan di permukaan daun. Penyakit ini sering terjadi pada kondisi cuaca lembab dan hangat. Gejala utama karat daun adalah munculnya bercak kecil yang berwarna oranye pada bagian atas daun, yang kemudian berkembang menjadi bintik-bintik coklat atau hitam seiring dengan waktu.",
                    "assets/penyakit/karat_daun.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi penyakit
  Widget _buildPenyakitItem(
      String title, String description, String imagePath) {
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
          // Gambar Penyakit
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
          // Deskripsi Penyakit
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
