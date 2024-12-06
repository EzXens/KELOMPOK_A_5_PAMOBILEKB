import 'package:flutter/material.dart';

class JenisVarietasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jenis Varietas Padi'),
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
                "Jenis-Jenis Varietas Padi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // Penjelasan Umum
              const Text(
                "Varietas padi adalah jenis atau kultivar padi yang dikembangkan untuk menghasilkan hasil panen yang optimal dalam kondisi tertentu. Varietas padi di Indonesia sangat beragam, mulai dari padi lokal hingga varietas unggul nasional.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Daftar Varietas
              const Text(
                "Contoh Varietas Padi Unggul",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // ListView dengan Varietas
              Column(
                children: [
                  _buildVarietasItem(
                    "IR64",
                    "IR64 adalah salah satu varietas padi yang sangat populer di Asia, termasuk Indonesia. Dikembangkan oleh International Rice Research Institute (IRRI), IR64 dikenal karena produktivitasnya yang tinggi, ketahanannya terhadap beberapa penyakit, dan kualitas beras yang baik. Beras IR64 memiliki butir sedang, pulen, dan cita rasa yang disukai banyak konsumen. Varietas ini memiliki daya tahan yang baik terhadap hama dan penyakit seperti blast dan hawar daun, serta mampu tumbuh dengan baik di berbagai kondisi lahan, terutama pada sistem irigasi. IR64 sangat cocok ditanam di daerah yang memiliki pasokan air yang cukup, dan sering menjadi pilihan utama bagi petani untuk meningkatkan hasil pertanian padi.",
                    "assets/jenis_padi/ir64.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildVarietasItem(
                    "Ciherang",
                    "Ciherang adalah salah satu varietas padi unggul yang banyak digunakan oleh petani di Indonesia. Varietas ini dikembangkan oleh Balai Besar Penelitian Tanaman Padi (BBPadi) dan dikenal karena hasilnya yang tinggi dan kualitas beras yang baik. Ciherang memiliki butir beras yang panjang, pulen, dan memiliki aroma khas yang disukai konsumen. Selain itu, Ciherang juga memiliki ketahanan terhadap beberapa penyakit seperti blast dan hawar daun bakteri. Varietas ini cocok ditanam di berbagai jenis lahan, terutama pada sistem pertanian irigasi. Karena keunggulan-keunggulan tersebut, Ciherang menjadi salah satu pilihan utama untuk mendukung ketahanan pangan di Indonesia.",
                    "assets/jenis_padi/ciherang.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildVarietasItem(
                    "Inpari 32",
                    "Inpari 32 adalah salah satu varietas unggul padi yang dikembangkan oleh Balai Besar Penelitian Tanaman Padi (BBPadi) di Indonesia. Varietas ini termasuk dalam kategori padi yang memiliki ketahanan terhadap beberapa penyakit seperti hawar daun bakteri dan blast. Inpari 32 memiliki karakteristik utama berupa hasil yang tinggi, produktivitas yang stabil, dan daya tahan yang baik terhadap kondisi lingkungan yang tidak terlalu ideal. Selain itu, Inpari 32 juga dikenal memiliki kualitas beras yang baik dengan butir beras yang pulen dan enak. Varietas ini banyak digunakan oleh petani di Indonesia karena kemampuannya beradaptasi dengan berbagai jenis lahan, baik itu sawah irigasi maupun sawah tadah hujan.",
                    "assets/jenis_padi/inpari_32.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildVarietasItem(
                    "Padi Merah",
                    "Padi merah adalah jenis padi dengan biji berwarna merah hingga coklat kemerahan yang memiliki kandungan gizi lebih tinggi dibandingkan padi putih. Warna merah pada biji padi ini disebabkan oleh pigmen antosianin yang juga memberikan manfaat kesehatan sebagai antioksidan. Padi merah memiliki rasa yang lebih kaya dan tekstur yang lebih keras, serta kenyal setelah dimasak. Selain itu, padi merah kaya akan serat, vitamin, dan mineral, serta memiliki indeks glikemik lebih rendah, menjadikannya pilihan baik untuk penderita diabetes. Padi merah sering digunakan untuk nasi merah, bubur, atau tepung untuk produk olahan sehat.",
                    "assets/jenis_padi/padi_merah.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildVarietasItem(
                    "Padi Hitam",
                    "Padi hitam, atau yang sering disebut padi hitam lokal (Oryza sativa), adalah jenis padi yang memiliki biji berwarna hitam pekat. Warna hitam pada padi ini berasal dari pigmen antosianin yang memberikan manfaat kesehatan, seperti antioksidan. Padi hitam biasanya ditanam di daerah-daerah tertentu di Indonesia dan dikenal memiliki rasa yang lebih gurih serta tekstur yang lebih kenyal dibandingkan dengan padi putih biasa. Selain itu, padi hitam juga memiliki kandungan gizi yang lebih tinggi, seperti serat, vitamin, dan mineral, yang menjadikannya pilihan lebih sehat. Padi hitam sering digunakan untuk membuat nasi, bubur, atau bahkan dalam produk-produk olahan seperti tepung untuk kue.",
                    "assets/jenis_padi/padi_hitam.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi varietas
  Widget _buildVarietasItem(
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
          // Gambar Varietas
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
          // Deskripsi Varietas
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
