import 'kelas.dart';
import 'mapel.dart';

class Jadwal {
  int? id;
  String? kdMapel;
  String? hari;
  String? jam;
  String? kdKelas;
  String? tingkat;
  Mapel? mapel;
  Kelas? kelas;

  Jadwal(
      {this.id,
      this.kdMapel,
      this.hari,
      this.jam,
      this.kdKelas,
      this.tingkat,
      this.mapel,
      this.kelas});

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      id: json['id'],
      kdMapel: json['kd_mapel'], 
      hari: json['hari'],
      jam: json['jam'],
      kdKelas: json['kd_kelas'],
      tingkat: json['tingkat'],
      mapel: json['mapel'] != null ? Mapel.fromJson(json['mapel']) : null,
      kelas: json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null,
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['kd_mapel'] = kdMapel;
  //   data['hari'] = hari;
  //   data['jam'] = jam;
  //   data['kd_kelas'] = kdKelas;
  //   data['tingkat'] = tingkat;
  //   if (mapel != null) {
  //     data['mapel'] = mapel!.toJson();
  //   }
  //   if (kelas != null) {
  //     data['kelas'] = kelas!.toJson();
  //   }
  //   return data;
  // }
}
