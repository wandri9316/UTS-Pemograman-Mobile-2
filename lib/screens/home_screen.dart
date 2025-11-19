import 'package:flutter/material.dart';
import '../data/art_piece.dart';
import '../widgets/art_card.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Gallery Of Art',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.settings, size: 28),
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.blueGrey[900],
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

typedef FilterArtistCallback = void Function(String artistName);

class ArtistAvatar extends StatefulWidget {
  final Artist artist;
  final FilterArtistCallback onArtistTap;

  const ArtistAvatar({
    super.key,
    required this.artist,
    required this.onArtistTap,
  });

  @override
  State<ArtistAvatar> createState() => _ArtistAvatarState();
}

class _ArtistAvatarState extends State<ArtistAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.3), weight: 70),
      TweenSequenceItem(tween: Tween<double>(begin: 1.3, end: 1.0), weight: 70),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (!_animationController.isAnimating) {
      _animationController.forward(from: 0.0);
    }
    widget.onArtistTap(widget.artist.name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: _handleTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey.shade300,
                backgroundImage: AssetImage(widget.artist.avatarUrl),
                onBackgroundImageError: (exception, stackTrace) =>
                    const Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(height: 6),
              Text(
                widget.artist.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List<String> favoriteArtIds;
  final ToggleFavoriteCallback onToggleFavorite;

  const HomeScreen({
    super.key,
    required this.favoriteArtIds,
    required this.onToggleFavorite,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _filteredArtist = '';
  String _searchKeyword = '';
  final TextEditingController _searchController = TextEditingController();

  void _setFilter(String artistName) {
    setState(() {
      if (_filteredArtist == artistName) {
        _filteredArtist = '';
      } else {
        _filteredArtist = artistName;
        _searchController.clear();
        _searchKeyword = '';
      }
    });
  }

  List<ArtPiece> _getFilteredArt() {
    List<ArtPiece> results = artGallery;

    if (_filteredArtist.isNotEmpty) {
      results = results.where((art) => art.artist == _filteredArtist).toList();
    }

    if (_searchKeyword.isNotEmpty) {
      results = results
          .where(
            (art) =>
                art.title.toLowerCase().contains(
                  _searchKeyword.toLowerCase(),
                ) ||
                art.artist.toLowerCase().contains(_searchKeyword.toLowerCase()),
          )
          .toList();
    }

    return results;
  }

  void _setSearchKeyword(String keyword) {
    setState(() {
      _searchKeyword = keyword;
      if (keyword.isNotEmpty) {
        _filteredArtist = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final displayedArt = _getFilteredArt();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: HomeAppBar(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => _setSearchKeyword(value),
                  decoration: const InputDecoration(
                    labelText: 'Cari Judul atau Artis',
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white70, // Sesuaikan agar kontras
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Recommended Artists',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendedArtists.length,
                  itemBuilder: (context, index) {
                    final artist = recommendedArtists[index];
                    return ArtistAvatar(
                      artist: artist,
                      onArtistTap: _setFilter,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  _filteredArtist.isNotEmpty
                      ? 'Artworks by $_filteredArtist'
                      : (_searchKeyword.isNotEmpty
                            ? 'Results for "$_searchKeyword"'
                            : 'All Gallery Arts'),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: displayedArt.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _searchKeyword.isNotEmpty
                                ? 'Tidak ada hasil ditemukan untuk "$_searchKeyword".'
                                : 'Tidak ada lukisan ditemukan untuk kriteria ini.',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 3,
                              mainAxisSpacing: 3,
                              childAspectRatio: 0.9,
                            ),
                        itemCount: displayedArt.length,
                        itemBuilder: (context, index) {
                          final art = displayedArt[index];
                          return ArtCard(
                            art: art,
                            isFavorite: widget.favoriteArtIds.contains(art.id),
                            onToggleFavorite: widget.onToggleFavorite,
                          );
                        },
                      ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
