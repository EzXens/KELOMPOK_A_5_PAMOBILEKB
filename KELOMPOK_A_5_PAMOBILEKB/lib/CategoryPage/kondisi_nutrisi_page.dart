import 'package:flutter/material.dart';

class KondisiNutrisiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kondisi Nutrisi Padi'),
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
                "Kondisi Nutrisi Padi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // Penjelasan Umum
              const Text(
                "Kondisi nutrisi padi sangat penting untuk memastikan pertumbuhan optimal dan hasil panen yang maksimal. Tanaman padi membutuhkan berbagai nutrisi makro dan mikro yang seimbang untuk mendukung semua tahap pertumbuhannya, mulai dari semai hingga panen.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Daftar Nutrisi
              const Text(
                "Faktor-Faktor Nutrisi Penting",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // ListView dengan Nutrisi
              Column(
                children: [
                  _buildNutrisiItem(
                    "Nitrogen (N)",
                    "Nitrogen adalah unsur hara penting bagi tanaman padi, berperan dalam pembentukan klorofil, asam amino, dan protein yang mendukung pertumbuhan daun, batang, dan hasil padi. Nitrogen meningkatkan proses fotosintesis, memungkinkan tanaman untuk menyerap energi matahari dan menghasilkan lebih banyak biji. Kekurangan nitrogen dapat menyebabkan pertumbuhan lambat dan daun menguning, sementara kelebihan nitrogen dapat memicu pertumbuhan daun yang berlebihan namun mengurangi pembentukan malai dan kualitas hasil padi. Oleh karena itu, pemupukan nitrogen harus disesuaikan dengan kebutuhan tanaman untuk mencapai hasil optimal.",
                    "assets/nutrisi/nitrogen.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildNutrisiItem(
                    "Fosfor (P)",
                    "Fosfor (P) adalah unsur hara penting yang berperan dalam pembentukan akar, pertumbuhan batang, dan pembungaan pada tanaman padi. Fosfor membantu dalam proses fotosintesis dan produksi energi, serta penting dalam sintesis DNA dan pembelahan sel. Selain itu, fosfor juga mendukung pengaturan metabolisme energi tanaman dan mempercepat perkembangan akar, yang memungkinkan padi menyerap lebih banyak air dan nutrisi. Kekurangan fosfor pada padi dapat menyebabkan pertumbuhan yang terhambat, warna daun yang berubah menjadi hijau gelap, dan penurunan hasil panen. Pemupukan fosfor yang tepat sangat diperlukan untuk meningkatkan kualitas dan kuantitas hasil padi.",
                    "assets/nutrisi/fosfor.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildNutrisiItem(
                    "Kalium (K)",
                    "Kalium (K) adalah unsur hara yang sangat penting bagi tanaman padi karena berperan dalam pengaturan keseimbangan air, meningkatkan ketahanan terhadap penyakit, serta memperbaiki kualitas hasil. Kalium juga berfungsi dalam pembentukan karbohidrat, protein, dan enzim, serta mempercepat proses fotosintesis. Selain itu, kalium berperan dalam pengaturan stomata (pori daun) yang membantu tanaman dalam mempertahankan kelembaban dan mengurangi kehilangan air. Kekurangan kalium pada tanaman padi dapat mengakibatkan daun yang kering dan keriput, serta penurunan hasil padi. Oleh karena itu, pemupukan kalium yang cukup sangat penting untuk mendukung pertumbuhan dan hasil yang optimal.",
                    "assets/nutrisi/kalium.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildNutrisiItem(
                    "Zinc (Zn)",
                    "Zinc (Zn) adalah unsur mikro yang penting bagi pertumbuhan dan perkembangan tanaman padi. Zinc berperan dalam berbagai proses fisiologis tanaman, termasuk sintesis protein, pembentukan klorofil, dan metabolisme energi. Zinc juga berfungsi dalam pembentukan hormon tanaman yang penting untuk pertumbuhan akar dan batang serta memperbaiki ketahanan terhadap stres. Kekurangan zinc dapat menyebabkan daun menjadi kekuningan, pertumbuhan terhambat, dan penurunan hasil padi. Oleh karena itu, pemupukan zinc diperlukan untuk memastikan tanaman padi dapat tumbuh dengan sehat dan menghasilkan produksi yang optimal.",
                    "assets/nutrisi/zinc.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildNutrisiItem(
                    "Kalsium (Ca)",
                    "Kalsium (Ca) adalah unsur makro yang sangat penting bagi tanaman padi, berperan dalam pembentukan dinding sel, penguatan struktur tanaman, serta membantu dalam proses pengangkutan air dan nutrisi. Kalsium juga berperan dalam aktivasi beberapa enzim yang penting untuk metabolisme tanaman dan memperkuat ketahanan tanaman terhadap penyakit. Kekurangan kalsium dapat menyebabkan kerusakan pada ujung akar, pembentukan daun yang cacat, dan penurunan ketahanan tanaman terhadap stress lingkungan. Untuk memastikan tanaman padi tumbuh optimal, kalsium perlu tersedia dalam jumlah cukup di dalam tanah, biasanya dengan penambahan kapur atau pupuk yang mengandung kalsium.",
                    "assets/nutrisi/kalsium.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi nutrisi
  Widget _buildNutrisiItem(String title, String description, String imagePath) {
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
          // Gambar Nutrisi
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
          // Deskripsi Nutrisi
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
