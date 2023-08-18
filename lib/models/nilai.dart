import 'mapel.dart';
import 'user.dart';

class Nilai {
  String? nis;
  String? kdMapel;
  String? nilai;
  String? semester;
  Mapel? mapel;
  User? user;

  Nilai({
    this.nis,
    this.kdMapel,
    this.nilai,
    this.semester,
    this.mapel,
    this.user,
  });

  Nilai.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    kdMapel = json['kd_mapel'];
    nilai = json['nilai'];
    semester = json['semester'];
    mapel = json['mapel'] != null ? Mapel.fromJson(json['mapel']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}
// class Nilai {
//   final int userId;
//   final int id;
//   final String title;

//   Nilai({
//     required this.userId,
//     required this.id,
//     required this.title,
//   });

//   factory Nilai.fromJson(Map<String, dynamic> json) {
//     return Nilai(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
