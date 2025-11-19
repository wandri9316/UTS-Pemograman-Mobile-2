import 'package:flutter/material.dart';
import '../data/art_piece.dart';
import '../widgets/art_card.dart';

class DetailScreen extends StatefulWidget {
  final ArtPiece art;
  final bool isFavoriteInitial;
  final ToggleFavoriteCallback onToggleFavorite;

  const DetailScreen({
    super.key,
    required this.art,
    required this.isFavoriteInitial,
    required this.onToggleFavorite,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// Tambahkan SingleTickerProviderStateMixin untuk AnimationController
class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  // State lokal untuk tampilan icon
  bool _isFavorite = false;

  // Variabel Animasi
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavoriteInitial;

    // Inisialisasi AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ), // Durasi singkat untuk efek "pop"
    );

    // Animasi Scale (Skala) dari 1.0 ke 1.3 dan kembali ke 1.0
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.5), weight: 90),
      TweenSequenceItem(tween: Tween<double>(begin: 1.5, end: 1.0), weight: 90),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFavorite() {
    // Jalankan animasi saat tombol diklik
    if (!_animationController.isAnimating) {
      _animationController.forward(from: 0.0);
    }

    // Panggil callback ke MainScreen untuk update state global
    widget.onToggleFavorite(widget.art.id);

    // Perbarui state lokal untuk tampilan icon
    setState(() {
      _isFavorite = !_isFavorite;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isFavorite ? 'Ditambahkan ke Favorit!' : 'Dihapus dari Favorit!',
        ),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Art'),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Hero Animation Target (Sudah Benar)
            Hero(
              tag: widget.art.id,
              child: Image.asset(
                widget.art.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 350,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.art.title,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Oleh: ${widget.art.artist}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[700],
                              ),
                        ),
                      ],
                    ),
                  ),
                  // Ikon Favorit dengan Animasi Skala
                  GestureDetector(
                    onTap: _toggleFavorite,
                    child: ScaleTransition(
                      scale: _scaleAnimation, // Gunakan animasi skala
                      child: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.art.description,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
