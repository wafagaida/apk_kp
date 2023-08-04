class News {
  int id;
  String judul;
  String deskripsi;
  String gambar;

  News(
      {required this.id,
      required this.deskripsi,
      required this.gambar,
      required this.judul});

  factory News.fromjson(Map json) {
    return News(
      id: json['id'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      judul: json['judul'],
    );
  }
}
