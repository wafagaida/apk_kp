class Nilai {
  String? nis;
  int? kd_mapel;
  int? nilai;

  Nilai({
    this.nis,
    this.kd_mapel,
    this.nilai,
  });

  factory Nilai.fromJson(Map<String, dynamic> json) {
    return Nilai(
      nis: json['nis'],
      kd_mapel: json['kd_mapel'],
      nilai: json['nilai'],
    );
  }
}
