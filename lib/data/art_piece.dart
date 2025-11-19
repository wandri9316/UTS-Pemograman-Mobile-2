class Artist {
  final String name;
  final String avatarUrl; // Path asset untuk foto artis

  Artist({required this.name, required this.avatarUrl});
}

class ArtPiece {
  final String id;
  final String title;
  final String artist;
  final String imageUrl; // Path asset
  final String description;

  ArtPiece({
    required this.id,
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.description,
  });
}

// Data Dummy Galeri
final List<ArtPiece> artGallery = [
  ArtPiece(
    id: '1',
    title: 'Starry Night',
    artist: 'Vincent van Gogh',
    imageUrl: 'assets/images/starrynight.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan Post-Impresionisme yang menggambarkan pemandangan malam dari jendela kamar sanatoriumnya. Dikenal dengan sapuan kuas yang berputar-putar, kuat, dan penuh emosi, dengan warna biru dan kuning yang dominan.',
  ),
  ArtPiece(
    id: '2',
    title: 'The Scream',
    artist: 'Edvard Munch',
    imageUrl: 'assets/images/thescream.png', // Ganti dengan path gambar Anda
    description:
        'Sebening karya seni Ekspresionis yang sangat terkenal, menggambarkan sosok yang sangat cemas dengan latar belakang langit oranye-merah yang bergejolak. Lukisan ini melambangkan kecemasan universal manusia.',
  ),
  ArtPiece(
    id: '3',
    title: 'The Last Supper',
    artist: 'Leonardo da Vinci',
    imageUrl:
        'assets/images/thelastsupper.png', // Ganti dengan path gambar Anda
    description:
        'Sebuah lukisan dinding yang menggambarkan momen ketika Yesus mengumumkan bahwa salah satu dari dua belas muridnya akan mengkhianatinya. Terkenal karena komposisinya yang dinamis dan penggunaan perspektif linier.',
  ),
  ArtPiece(
    id: '4',
    title: 'The Persistence of Memory',
    artist: 'Salvador Dali',
    imageUrl: 'assets/images/memory.png', // Ganti dengan path gambar Anda
    description:
        'Karya Surealisme yang terkenal, menggambarkan jam-jam saku yang meleleh di tengah pemandangan pantai. Lukisan ini mengeksplorasi konsep waktu dan memori.',
  ),
  ArtPiece(
    id: '5',
    title: 'Mona Lisa',
    artist: 'Leonardo da Vinci',
    imageUrl: 'assets/images/monalisa.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan potret yang paling terkenal di dunia, dikenal karena subjeknya yang tersenyum misterius dan teknik sfumato yang menciptakan transisi halus antara warna dan bayangan. Dibuat antara tahun 1503 dan 1519.',
  ),
  ArtPiece(
    id: '6',
    title: 'The Night Watch',
    artist: 'Rembrandt van Rijn',
    imageUrl: 'assets/images/night.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan cat minyak di atas kanvas raksasa yang selesai pada tahun 1642. Lukisan ini bukanlah adegan malam hari, melainkan potret kelompok milisi sipil Amsterdam (penjaga kota) yang tadinya disalahartikan sebagai adegan malam karena lapisan pernis yang gelap. Rembrandt merevolusi genre potret kelompok dengan mengubahnya menjadi adegan yang dramatis dan penuh aksi, seolah-olah menangkap kompi tersebut saat sedang bergerak maju.',
  ),
  ArtPiece(
    id: '7',
    title: 'Guernica',
    artist: 'Pablo Picasso',
    imageUrl: 'assets/images/guernika.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini menggambarkan kengerian dan kekerasan pemboman dengan menggunakan berbagai bentuk abstrak dan terdistorsi. Figur utama dalam lukisan ini adalah seekor kuda, yang digambarkan menggeliat kesakitan dengan luka yang menganga di bagian sisinya. Figur-figur lain, termasuk seorang wanita dengan tangan terangkat dan seekor banteng, juga digambarkan dalam bentuk yang terfragmentasi dan terdistorsi. Skema warna monokromatik hitam, putih, dan abu-abu pada lukisan ini menambah kesan kesuraman dan keputusasaan.',
  ),
  ArtPiece(
    id: '8',
    title: 'Composition VII',
    artist: 'Wassily Kandinsky',
    imageUrl: 'assets/images/composition.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini menggambarkan jalinan bentuk-bentuk dan warna yang kompleks dan bergejolak, menunjukkan abstraksi yang hampir total. Kandinsky menyamakannya dengan komposisi musik yang hebat, di mana setiap elemen visual memiliki "suara" yang bergetar di jiwa penonton.',
  ),
  ArtPiece(
    id: '9',
    title: 'On White II',
    artist: 'Wassily Kandinsky',
    imageUrl: 'assets/images/white.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini dibuat setelah Kandinsky mulai mengajar di Bauhaus. Karya ini menampilkan perubahan signifikan ke arah abstraksi geometris yang lebih terstruktur. Garis hitam yang tebal dan bentuk-bentuk geometris, seperti persegi, lingkaran, dan segitiga, kontras dengan latar belakang putih, menciptakan ketegangan dan keseimbangan visual.',
  ),
  ArtPiece(
    id: '10',
    title: 'Vampire',
    artist: 'Edvard Munch',
    imageUrl: 'assets/images/vampire.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini menggambarkan seorang pria yang berbaring, membenamkan wajahnya di pangkuan atau bahu seorang wanita. Rambut merah panjang wanita tersebut menjulur ke bawah, melingkari kepala pria itu dalam sebuah pelukan.',
  ),
  ArtPiece(
    id: '11',
    title: 'Pyramid of Skulls',
    artist: 'Paul Cezanne',
    imageUrl: 'assets/images/skull.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini menampilkan empat tengkorak manusia yang disusun dalam formasi piramida yang stabil, dengan latar belakang gelap. Lukisan ini adalah contoh still life (lukisan benda mati) yang suram dan merupakan representasi halus dari tema tradisional vanitas (pengingat akan kesia-siaan hidup dan keniscayaan kematian, atau memento mori).',
  ),
  ArtPiece(
    id: '12',
    title: 'The Card Players',
    artist: 'Paul Cezanne',
    imageUrl: 'assets/images/card.png', // Ganti dengan path gambar Anda
    description:
        'Lukisan ini menggambarkan dua orang petani yang sedang merokok dan bermain kartu. Dulunya lukisan ini dimiliki oleh raja ekspedisi Yunani George Embiricos. Lukisan ini kemudian dibeli oleh kelurga kerajaan Qatar seharga USD 274juta. Pada awalnya ini adalah lukisan paling mahal sedunia sebelum dikalahkan oleh lukisan milik Paul Gauguin.',
  ),

  // Tambahkan lebih banyak data dummy
];
final List<Artist> recommendedArtists = [
  Artist(
    name: 'Vincent van Gogh',
    avatarUrl: 'assets/images/vincent.png',
  ), // Ganti dengan path gambar artis
  Artist(name: 'Rembrandt van Rijn', avatarUrl: 'assets/images/rembrandt.png'),
  Artist(name: 'Salvador Dali', avatarUrl: 'assets/images/salvador.png'),
  Artist(name: 'Leonardo da Vinci', avatarUrl: 'assets/images/leonardo.png'),
  Artist(name: 'Edvard Munch', avatarUrl: 'assets/images/edvard.png'),
  Artist(name: 'Pablo Picasso', avatarUrl: 'assets/images/pablo.png'),
  Artist(name: 'Wassily Kandinsky', avatarUrl: 'assets/images/wasilly.png'),
  Artist(name: 'Paul Cezanne', avatarUrl: 'assets/images/paul.png'),
];
