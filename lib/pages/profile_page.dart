import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blueGrey[900],
              child: const Icon(Icons.person, size: 80, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Riza Zamzami',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Junior Mobile Developer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const ListTile(
              leading: Icon(Icons.email),
              title: Text('rizazamzami12@gmail.com'),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('+62 2242474378'),
            ),
            const ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jakarta, Indonesia'),
            ),
          ],
        ),
      ),
    );
  }
}
