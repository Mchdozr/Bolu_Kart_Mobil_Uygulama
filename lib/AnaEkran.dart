import 'package:bolu_kart_deneme/EnYenilerIcerik.dart';
import 'package:bolu_kart_deneme/FavorilerIcerik.dart';
import 'package:bolu_kart_deneme/KampanyalarIcerik.dart';
import 'package:bolu_kart_deneme/QrCodePage.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Ana sayfaya dönmek için gerekli
import 'drawer.dart'; // AppDrawer'ı içeri aktar

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showQRCode() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const QrCodePage(randomString: 'RandomStringForQRCode'),
      ),
    );
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BOLUKART',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade900,
        iconTheme: const IconThemeData(color: Colors.white),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'KAMPANYALAR'),
            Tab(text: 'EN YENİLER'),
            Tab(text: 'FAVORİLER'),
          ],
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: _logout,
          ),
        ],
      ),
      drawer: const AppDrawer(), // AppDrawer'ı kullan
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.grey.shade900,
              Colors.grey.shade800,
              Colors.grey.shade700,
              Colors.grey.shade900,
            ],
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: const [
            KampanyalarIcerik(),
            EnYenilerIcerik(),
            FavorilerIcerik(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade600,
        onPressed: _showQRCode,
        child: const Icon(Icons.qr_code, color: Colors.white),
      ),
    );
  }
}
