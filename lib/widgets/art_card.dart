// lib/widgets/art_card.dart
import 'package:flutter/material.dart';
import '../data/art_piece.dart';
import '../screens/detail_screen.dart';

typedef ToggleFavoriteCallback = void Function(String artId);

class ArtCard extends StatelessWidget {
  final ArtPiece art;
  final bool isFavorite;
  final ToggleFavoriteCallback onToggleFavorite;

  const ArtCard({
    super.key,
    required this.art,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        // InkWell (Area Klik) ada di sini
        onTap: () {
          // Navigasi ke Halaman Detail dengan membawa status dan callback
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                art: art,
                isFavoriteInitial: isFavorite,
                onToggleFavorite: onToggleFavorite,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: art.id,
                child: Image.asset(
                  art.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: Icon(Icons.broken_image)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                art.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                art.artist,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
