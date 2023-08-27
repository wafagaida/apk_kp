class Mapel {
  final String? kdMapel;
  final String? namaMapel;
  final String? namaGuru;

  Mapel({
    this.kdMapel,
    this.namaMapel,
    this.namaGuru,
  });

  factory Mapel.fromJson(Map<String, dynamic> json) {
    return Mapel(
    kdMapel: json['kd_mapel'].toString(), 
    namaMapel : json['nama_mapel'].toString(),
    namaGuru : json['nama_guru'].toString(),
  );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_mapel'] = kdMapel;
    data['nama_mapel'] = namaMapel;
    data['nama_guru'] = namaGuru;
    return data;
  }

  // toJson() {}
}
