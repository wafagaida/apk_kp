class Mapel {
  String? kdMapel;
  String? namaMapel;
  String? namaGuru;

  Mapel({
     this.kdMapel,
     this.namaMapel,
     this.namaGuru,
  });

  factory Mapel.fromJson(Map<String, dynamic> json) {
    return Mapel(
      kdMapel: json['kd_mapel'],
      namaMapel: json['nama_mapel'],
      namaGuru: json['nama_guru'],
    );
  }
}