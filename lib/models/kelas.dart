class Kelas {
  String? kdKelas;
  String? namaKelas;
  String? jurusan;
  String? tingkat;

  Kelas({this.kdKelas, this.namaKelas, this.jurusan, this.tingkat});

  Kelas.fromJson(Map<String, dynamic> json) {
    kdKelas = json['kd_kelas'];
    namaKelas = json['nama_kelas'];
    jurusan = json['jurusan'];
    tingkat = json['tingkat'];
  }

  get isNotEmpty => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kd_kelas'] = kdKelas;
    data['nama_kelas'] = namaKelas;
    data['jurusan'] = jurusan;
    data['tingkat'] = tingkat;
    return data;
  }
}