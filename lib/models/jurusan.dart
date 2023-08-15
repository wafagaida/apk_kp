class Jurusan {
  String? kdJurusan;
  String? namaJurusan;

  Jurusan({
     this.kdJurusan,
     this.namaJurusan,
  });

  factory Jurusan.fromJson(Map<String, dynamic> json) {
    return Jurusan(
      kdJurusan: json['kd_jurusan'],
      namaJurusan: json['nama_jurusan'],
    );
  }
}