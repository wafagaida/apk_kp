class Mapel {
  String? kdMapel;
  String? namaMapel;
  String? namaGuru;

  Mapel({
    this.kdMapel,
    this.namaMapel,
    this.namaGuru,
  });

  Mapel.fromJson(Map<String, dynamic> json) {
    kdMapel = json['kd_mapel'];
    namaMapel = json['nama_mapel'];
    namaGuru = json['nama_guru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_mapel'] = kdMapel;
    data['nama_mapel'] = namaMapel;
    data['nama_guru'] = namaGuru;
    return data;
  }

  // toJson() {}
}
