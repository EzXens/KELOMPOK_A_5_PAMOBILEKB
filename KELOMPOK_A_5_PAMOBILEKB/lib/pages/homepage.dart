import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pa/CategoryPage/hama_padi_page.dart';
import 'package:flutter_application_pa/CategoryPage/jenis_varietas_page.dart';
import 'package:flutter_application_pa/CategoryPage/kondisi_nutrisi_page.dart';
import 'package:flutter_application_pa/CategoryPage/penyakit_padi_page.dart';
import 'package:flutter_application_pa/CategoryPage/solusi_pencegahan_page.dart';
import 'package:flutter_application_pa/custom%20widgets/custom_bottomNavBar.dart';
import 'package:flutter_application_pa/pages/HistoryPage.dart';
import 'package:flutter_application_pa/pages/predictPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String? _username;
  String? _profilePictureUrl; 
  final _storage = FlutterSecureStorage();

  static const List<String> _appBarTitles = ['Home', 'Identifikasi', 'Riwayat'];

  @override
  void initState() {
    super.initState();
    _loadUserSession();
  }


  void _loadUserSession() async {
    String? storedUsername = await _storage.read(key: 'username');
    if (storedUsername != null) {
      setState(() {
        _username = storedUsername;
      });
      _loadProfilePicture(storedUsername);
    }
  }

  void _loadProfilePicture(String username) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(username)
        .get();
    if (userDoc.exists) {
      setState(() {
        _profilePictureUrl = userDoc['profile_picture'];
      });
    }
  }


  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      setState(() {
        _username = null;
        _profilePictureUrl = null;
      });
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  final List<Widget> widgetOptions = <Widget>[
    //1 HOMEPAGE
    const HomeContent(),

    //2 identiti
    PredictPage(),

    //3 Histori
    HistoryPage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 30),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(
          _appBarTitles[_selectedIndex],
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF107115),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: user == null
            ? _buildGuestDrawer(context)
            : _buildUserDrawer(context),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        setPage: _onPageChanged,
      ),
    );
  }
}

Widget _buildGuestDrawer(BuildContext context) {
  return ListView(
    children: [
      UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/default_avatar.jpg'),
        ),
        accountName: Text('Guest'),
        accountEmail: Text('Not logged in'),
        decoration: const BoxDecoration(color: Color(0xFF107115)),
      ),
      ListTile(
        leading: const Icon(Icons.login),
        title: const Text('Login'),
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
      ListTile(
        leading: const Icon(Icons.emoji_objects_outlined),
        title: const Text('Detection Tutorial'),
        onTap: () {
          Navigator.pushNamed(context, '/introduction');
        },
      ),
    ],
  );
}

Widget _buildUserDrawer(BuildContext context) {
  final user = FirebaseAuth.instance.currentUser;

  return FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
    builder: (context, userSnapshot) {
      if (userSnapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }

      if (!userSnapshot.hasData || userSnapshot.data == null) {
        return Center(child: Text('Error loading user data'));
      }

      final userData = userSnapshot.data?.data() as Map<String, dynamic>?;
      final profilePicture = userData?['profile_picture'];

      return ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: (profilePicture != null &&
                      profilePicture.isNotEmpty)
                  ? AssetImage(profilePicture)
                  : AssetImage('assets/default_avatar.jpg') as ImageProvider,
            ),
            accountName: Text(userData?['username'] ?? 'User'),
            accountEmail: Text(user.email ?? ''),
            decoration: const BoxDecoration(color: Color(0xFF107115)),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_objects_outlined),
            title: const Text('Detection Tutorial'),
            onTap: () {
              Navigator.pushNamed(context, '/introduction');
            },
          ),
        ],
      );
    },
  );
}

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const HomeContent(),
  '/categories/hama': (context) => HamaPadiPage(),
  '/categories/penyakit': (context) => PenyakitPadiPage(),
  '/categories/kondisi': (context) => KondisiNutrisiPage(),
  '/categories/varietas': (context) => JenisVarietasPage(),
  '/categories/solusi': (context) => SolusiPencegahanPage(),
};

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  void _navigateToCategory(String routeName, BuildContext context) {
    if (routes.containsKey(routeName)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: routes[routeName]!),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Route $routeName tidak ditemukan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/HomeBanner.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Kategori
            const Text(
              "Kategori",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem("Hama Padi", Icons.bug_report,
                      Colors.brown, '/categories/hama', context),
                  _buildCategoryItem("Penyakit Padi", Icons.sick, Colors.red,
                      '/categories/penyakit', context),
                  _buildCategoryItem("Kondisi Nutrisi", Icons.eco, Colors.green,
                      '/categories/kondisi', context),
                  _buildCategoryItem("Jenis Varietas", Icons.grass,
                      Colors.orange, '/categories/varietas', context),
                  _buildCategoryItem("Solusi & Pencegahan", Icons.build,
                      Colors.blue, '/categories/solusi', context),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Lainnya
            const Text(
              "Tentang Padi dan Sejarahnya",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  "Sejarah Padi",
                  "Padi memiliki sejarah panjang di Indonesia, yang dimulai lebih dari 2.000 tahun lalu. Padi pertama kali dibudidayakan di Indonesia oleh nenek moyang masyarakat Austronesia yang berasal dari kawasan Asia Tenggara. Pada abad ke-8 hingga ke-10, kerajaan Sriwijaya dan Majapahit memanfaatkan sistem irigasi yang maju untuk mendukung pertanian padi, yang menjadi bahan makanan utama. Selama periode kolonial Belanda, padi diproduksi dalam skala besar, namun banyak ditanam untuk memenuhi kebutuhan ekspor. Setelah kemerdekaan, Indonesia berfokus pada ketahanan pangan, dengan padi sebagai komoditas utama. Berbagai upaya seperti irigasi dan riset varietas padi dilakukan untuk meningkatkan produksi, menjadikan Indonesia salah satu negara penghasil padi terbesar di dunia. Saat ini, padi tetap menjadi makanan pokok utama bagi sebagian besar penduduk Indonesia.",
                  "assets/sejarah_padi.jpg",
                ),
                const SizedBox(height: 15), 
                _buildInfoCard(
                  "Proses Pertumbuhan Padi",
                  "Proses pertumbuhan padi dimulai dengan tahap persemaian, di mana benih padi disemai di lahan semai dan mulai berkecambah dalam 2-3 hari. Setelah itu, bibit yang telah tumbuh dipindahkan ke sawah atau lahan tanam pada usia sekitar 25-30 hari. Pada tahap pertumbuhan vegetatif, padi mulai mengembangkan akar, batang, dan daun, serta melakukan fotosintesis untuk menghasilkan energi bagi pertumbuhannya. Selanjutnya, tanaman padi memasuki fase pembungaan, di mana bunga padi muncul di ujung tangkai. Setelah pembungaan, padi memasuki tahap pematangan, di mana biji padi mulai menguning, menandakan bahwa tanaman mengumpulkan cadangan makanan untuk perkembangan biji. Akhirnya, padi siap dipanen setelah mencapai kematangan penuh, dan bulir padi dipanen untuk diproses menjadi beras. Selama seluruh proses ini, faktor-faktor seperti air, tanah, suhu, dan pemeliharaan yang baik sangat mempengaruhi hasil pertumbuhan padi.",
                  "assets/proses_pertumbuhan_padi.jpg",
                ),
                const SizedBox(height: 15), 
                _buildInfoCard(
                  "Jenis-jenis Padi",
                  "Di Indonesia, terdapat berbagai jenis padi yang dibedakan berdasarkan cara penanaman dan sifatnya. Padi irigasi ditanam di sawah yang memiliki pasokan air yang cukup, menggunakan sistem irigasi, dan menghasilkan padi dengan hasil yang tinggi, seperti varietas IR64 dan Ciherang. Padi tegalan ditanam di lahan kering tanpa bergantung pada irigasi, dan lebih tahan terhadap kekeringan, seperti padi bali dan padi bali hitam. Padi hibrida, hasil persilangan dua varietas unggul, menawarkan produktivitas lebih tinggi, ketahanan penyakit, dan waktu tumbuh yang lebih cepat, contohnya MH 9 dan MH 8. Padi organik ditanam tanpa pupuk kimia dan pestisida, menggunakan metode pertanian ramah lingkungan, serta menghasilkan beras yang lebih sehat. Padi lokal, yang sudah dibudidayakan secara turun-temurun di berbagai daerah, memiliki cita rasa khas dan beragam warna, seperti padi hitam dan padi merah. Terakhir, padi lahan rawa ditanam di lahan dengan kadar air tinggi, seperti rawa atau sawah yang tergenang, dan lebih tahan terhadap genangan air. Setiap jenis padi ini memiliki karakteristik khusus yang mempengaruhi cara penanaman, perawatan, dan hasil produksinya.",
                  "assets/jenis_padi.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, Color color,
      String route, BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToCategory(route, context),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color, size: 30),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}


Widget _buildInfoCard(String title, String description, String imagePath) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    ),
  );
}

class CategoryDetailPage extends StatelessWidget {
  final String title;

  const CategoryDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF107115),
      ),
      body: Center(
        child: Text(
          'Informasi tentang $title',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
