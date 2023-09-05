import 'kelas.dart';

class User {
  int? nis;
  String? nik;
  String? nama;
  String? jenisKelamin;
  String? tanggalLahir;
  String? alamat;
  String? tingkat;
  String? jurusan;
  String? kdKelas;
  String? noTlp;
  String? tahunMasuk;
  String? password;
  String? level;
  // List<Kelas>? kelas;
  Kelas? kelas;

  User(
      {this.nis,
      this.nik,
      this.nama,
      this.jenisKelamin,
      this.tanggalLahir,
      this.alamat,
      this.tingkat,
      this.jurusan,
      this.kdKelas,
      this.noTlp,
      this.tahunMasuk,
      this.password,
      this.level,
      this.kelas});

  User.fromJson(Map<String, dynamic> json) {
    nis = json['nis'];
    nik = json['nik'];
    nama = json['nama'];
    jenisKelamin = json['jenis_kelamin'];
    tanggalLahir = json['tanggal_lahir'];
    alamat = json['alamat'];
    tingkat = json['tingkat'];
    jurusan = json['jurusan'];
    kdKelas = json['kd_kelas'];
    noTlp = json['no_tlp'];
    tahunMasuk = json['tahun_masuk'];
    password = json['password'];
    level = json['level'];
    // if (json['kelas'] != null) {
    //   kelas = <Kelas>[];
    //   json['kelas'].forEach((v) {
    //     kelas!.add(Kelas.fromJson(v));
    //   });
    // }
    kelas = json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null;
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['nis'] = nis;
  //   data['nik'] = nik;
  //   data['nama'] = nama;
  //   data['jenis_kelamin'] = jenisKelamin;
  //   data['tanggal_lahir'] = tanggalLahir;
  //   data['alamat'] = alamat;
  //   data['tingkat'] = tingkat;
  //   data['jurusan'] = jurusan;
  //   data['kd_kelas'] = kdKelas;
  //   data['no_tlp'] = noTlp;
  //   data['tahun_masuk'] = tahunMasuk;
  //   final kelas = this.kelas;
  //   if (kelas != null) {
  //     data['kelas'] = kelas.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}


// // factory User.fromMap(Map<String, dynamic> map) {
// //     return User(
// //       nama: map["nama"],
// //       username: map["username"],
// //       password: map["password"],
// //       email: map["email"],
// //       nis: map["nis"],
// //       kelas: map["kelas"],
// //       jurusan: map["jurusan"]
// //       // profilePhoto: map["profile_photo"],
// //       // phoneNumber: map["phone_number"],
// //     );
// //   }

//   // factory User.dummy() {
//   //   return User(
//   //       nama: "Wafa Ghaida Aulia",
//   //       username: "wafagaid",
//   //       password: "12345",
//   //       nis: "12131241415344",
//   //       kelas: "X",
//   //       jurusan: "Multimedia",
//   //       alamat: "Sukaraja Karpaw",
//   //       // profilePhoto:
//   //       //     "https://cdn.idntimes.com/content-images/community/2020/09/104967619-2451390651819718-4934284928595035666-n-2fc82b7325949c7d003c1c58e17d48b7.jpg",
//   //       // phoneNumber: "08124368912",
//   //       );
//   // }
// }
