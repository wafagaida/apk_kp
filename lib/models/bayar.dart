import 'user.dart';

class Bayar {
  String? nis;
  String? namaBayar;
  String? bulan;
  String? semester;
  int? nominal;
  int? jumlahBayar;
  String? tglBayar;
  String? ket;
  User? user;

  Bayar(
      {this.nis,
      this.namaBayar,
      this.bulan,
      this.semester,
      this.nominal,
      this.jumlahBayar,
      this.tglBayar,
      this.ket,
      this.user});

  Bayar.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    namaBayar = json['nama_bayar'];
    bulan = json['bulan'];
    semester = json['semester'];
    nominal = json['nominal'];
    jumlahBayar = json['jumlah_bayar'];
    tglBayar = json['tgl_bayar'];
    ket = json['ket'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

}
