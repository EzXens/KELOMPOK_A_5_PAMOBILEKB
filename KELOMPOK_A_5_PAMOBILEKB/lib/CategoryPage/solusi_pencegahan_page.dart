import 'package:flutter/material.dart';

class SolusiPencegahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solusi & Pencegahan Padi'),
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
                "Solusi & Pencegahan Padi",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // Penjelasan Umum
              const Text(
                "Solusi dan langkah pencegahan sangat penting untuk menghindari kerugian akibat serangan penyakit pada padi. Dengan langkah pencegahan yang tepat, petani dapat meningkatkan produktivitas dan kualitas panen.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),

              // Daftar Solusi dan Pencegahan
              const Text(
                "Langkah Pencegahan Utama",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF107115),
                ),
              ),
              const SizedBox(height: 10),

              // ListView dengan Solusi
              Column(
                children: [
                  _buildSolusiItem(
                    "Penggunaan Benih Unggul",
                    "Penggunaan benih unggul dalam pertanian padi sangat penting untuk meningkatkan hasil panen dan kualitas tanaman. Benih unggul memiliki daya tumbuh yang lebih baik, ketahanan terhadap penyakit dan hama, serta potensi menghasilkan gabah yang lebih berkualitas dan produktivitas yang tinggi. Dengan menggunakan benih unggul, petani dapat memperoleh hasil yang lebih optimal, mengurangi ketergantungan pada pestisida, dan meningkatkan ketahanan pangan. Pemilihan varietas yang tepat dan perawatan yang baik selama pertumbuhan tanaman sangat penting untuk memaksimalkan manfaat dari benih unggul.",
                    "assets/solusi/benih_unggul.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildSolusiItem(
                    "Pengelolaan Air yang Baik",
                    "Pengelolaan air yang baik sangat penting dalam budidaya padi untuk memastikan pertumbuhan tanaman yang optimal. Padi memerlukan air yang cukup untuk tumbuh dengan baik, namun pengairan yang berlebihan atau tidak terkontrol dapat menyebabkan pemborosan sumber daya, peningkatan risiko penyakit, dan penurunan kualitas tanah. Pengelolaan air yang efektif melibatkan penggunaan sistem irigasi yang efisien, seperti irigasi tetes atau sistem saluran drainase yang baik, serta mengatur siklus penggenangan dan pengeringan sawah sesuai dengan fase pertumbuhan padi. Teknik seperti pengairan berkelanjutan, pengendalian salinitas, dan penggunaan teknologi untuk memantau kelembapan tanah dapat membantu meningkatkan hasil panen dan mengurangi dampak negatif terhadap lingkungan.",
                    "assets/solusi/pengelolaan_air.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildSolusiItem(
                    "Rotasi Tanaman",
                    "Rotasi tanaman adalah teknik pertanian yang melibatkan pergantian jenis tanaman yang ditanam di suatu lahan pada musim tanam berikutnya. Tujuan dari rotasi tanaman adalah untuk meningkatkan kesuburan tanah, mengurangi risiko serangan hama dan penyakit, serta memecah siklus gulma. Dengan menanam berbagai jenis tanaman yang memiliki kebutuhan nutrisi dan waktu tumbuh berbeda, tanah tidak akan kehabisan unsur hara tertentu, dan hama atau penyakit yang spesifik pada satu jenis tanaman dapat diminimalkan. Rotasi tanaman juga membantu memperbaiki struktur tanah dan mengurangi ketergantungan pada pestisida kimia. Misalnya, setelah menanam padi, petani bisa menanam kacang-kacangan atau tanaman yang memperbaiki nitrogen di tanah, yang akan mendukung pertumbuhan padi pada musim berikutnya.",
                    "assets/solusi/Rotasi_Tanaman_di_Lahan_Sawah.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildSolusiItem(
                    "Penggunaan Pestisida Secara Bijak",
                    "Penggunaan pestisida secara bijak adalah praktik yang mengutamakan efisiensi dan keamanan dalam pengendalian hama, penyakit, dan gulma pada tanaman. Ini melibatkan penggunaan pestisida hanya ketika benar-benar diperlukan dan dengan dosis yang tepat untuk meminimalkan dampak negatif terhadap lingkungan, manusia, dan organisme non-target. Beberapa prinsip penggunaan pestisida secara bijak meliputi: memilih pestisida yang sesuai dengan jenis hama atau penyakit yang ada, mengikuti petunjuk dosis yang tertera pada kemasan, menggunakan alat pelindung diri (APD) saat aplikasi, serta menghindari penyemprotan pada saat angin kencang atau sebelum hujan untuk mencegah pencemaran. Selain itu, mengadopsi sistem pengendalian hama terpadu (PHT) yang melibatkan berbagai pendekatan, seperti penggunaan predator alami atau varietas tahan, dapat mengurangi ketergantungan pada pestisida dan menjaga keseimbangan ekosistem pertanian.",
                    "assets/solusi/pestisida.jpg",
                  ),
                  const SizedBox(height: 15),
                  _buildSolusiItem(
                    "Sanitasi Lahan",
                    "Sanitasi lahan adalah langkah penting dalam mencegah dan mengendalikan penyakit serta hama tanaman dengan menjaga kebersihan dan kesehatan lingkungan pertanian. Praktik sanitasi ini meliputi pembersihan sisa-sisa tanaman yang terinfeksi, gulma, serta bahan organik yang dapat menjadi tempat berkembang biaknya hama atau patogen. Selain itu, sanitasi lahan juga mencakup pengelolaan limbah pertanian dengan cara yang benar, seperti pemusnahan tanaman yang terinfeksi atau komposting bahan organik untuk mengurangi risiko penyebaran penyakit. Menjaga kebersihan lahan secara teratur, baik sebelum maupun setelah musim tanam, sangat penting untuk mengurangi sumber infeksi dan mencegah penularan penyakit ke tanaman yang sehat, serta mendukung pertumbuhan tanaman yang optimal.",
                    "assets/solusi/sanitasi.jpg",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi solusi
  Widget _buildSolusiItem(String title, String description, String imagePath) {
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
          // Gambar Solusi
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
          // Deskripsi Solusi
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
