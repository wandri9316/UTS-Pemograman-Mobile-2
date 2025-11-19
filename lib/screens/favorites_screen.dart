import 'package:flutter/material.dart';
import '../data/art_piece.dart';
import '../widgets/art_card.dart';
import 'home_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> favoriteArtIds;
  final ToggleFavoriteCallback onToggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favoriteArtIds,
    required this.onToggleFavorite,
  });

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ArtPiece> favoriteArts = artGallery
        .where((art) => widget.favoriteArtIds.contains(art.id))
        .toList();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: HomeAppBar(),
      ),
      // PERUBAHAN UTAMA: Scaffold.body dibungkus dengan Container
      // yang memiliki DecorationImage
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg.png',
            ), // <-- Ganti dengan PATH GAMBAR ANDA
            fit: BoxFit.cover,
            opacity: 0.2, // Opsi: buat gambar sedikit transparan
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Favorites',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: favoriteArts.isEmpty
                    ? Center(
                        child: Text(
                          'Belum ada lukisan favorit yang ditambahkan.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey[900],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                              childAspectRatio: 0.9,
                            ),
                        itemCount: favoriteArts.length,
                        itemBuilder: (context, index) {
                          final art = favoriteArts[index];
                          return ArtCard(
                            art: art,
                            isFavorite: true,
                            onToggleFavorite: widget.onToggleFavorite,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
