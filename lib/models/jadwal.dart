import 'jurusan.dart';
import 'mapel.dart';

class Jadwal {
  int? id;
  String? hari;
  String? jam;
  String? kelas;
  Mapel? mapel;
  Jurusan? jurusan;

  Jadwal({
    this.id,
    this.mapel,
    this.hari,
    this.jam,
    this.jurusan,
    this.kelas,
  });

  Jadwal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hari = json['hari'];
    jam = json['jam'];
    kelas = json['kelas'];
    mapel = json['tingkat'] != null ? Mapel.fromJson(json['tingkat']) : null;
    jurusan = json['prodi'] != null ? Jurusan.fromJson(json['prodi']) : null;
  }
}
