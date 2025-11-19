// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const ArtGalleryApp());
}

class ArtGalleryApp extends StatelessWidget {
  const ArtGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gallery of Art',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
      home: const SplashScreen(), // Mulai dari Splash Screen
    );
  }
}

// Widget utama yang menampung Bottom Navigation dan State Favorit Global
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<String> _favoriteArtIds = []; // State Favorit Global

  // FUNGSI CALLBACK: Untuk menambah/menghapus favorit dari DetailScreen
  void _toggleFavorite(String artId) {
    setState(() {
      if (_favoriteArtIds.contains(artId)) {
        _favoriteArtIds.remove(artId);
      } else {
        _favoriteArtIds.add(artId);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Daftar halaman/widget dinamis, dilewatkan status favorit dan callback
    final List<Widget> widgetOptions = <Widget>[
      HomeScreen(
        favoriteArtIds: _favoriteArtIds,
        onToggleFavorite: _toggleFavorite,
      ),

      FavoritesScreen(
        favoriteArtIds: _favoriteArtIds,
        onToggleFavorite: _toggleFavorite,
      ),
    ];

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
