import 'kelas.dart';

class User {
  String? nis;
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
// class User {
//   int? id;
//   String? username;
//   String? password;
//   String? nis;
//   String? nik;
//   String? nama;
//   // String? kdKelas;
//   Kelas? kelas;
//   String? jurusan;
//   String? tingkat;
//   String? jenisKelamin;
//   String? tanggalLahir;
//   String? tahunMasuk;
//   String? noTlp;
//   String? alamat;
//   // String remember_token;

//   User({
//      this.id,
//      this.username,
//      this.password,
//      this.nis,
//      this.nik,
//      this.nama,
//      this.jenisKelamin,
//     //  this.kdKelas,
//      this.kelas,
//      this.jurusan,
//      this.tingkat,
//      this.noTlp,
//      this.alamat,
//      this.tanggalLahir,
//      this.tahunMasuk,

//     // required this.remember_token,
//   });

//    User.fromJson(Map<String, dynamic> json) {
//       id = json['users']['id'];
//       username = json['users']['username'];
//       password = json['users']['password'];
//       nis= json['users']['nis'];
//       nik= json['users']['nik'];
//       nama= json['users']['nama'];
//       jenisKelamin= json['users']['jenis_kelamin'];
//       tanggalLahir= json['users']['tanggal_lahir'];
//       tahunMasuk= json['users']['tahun_masuk'];
//       // kdKelas: json['users']['kd_kelas'],
//       kelas = json['kelas'] != null ? Kelas.fromJson(json['kelas']) : null;
//       jurusan = json['users']['jurusan'];
//       tingkat = json['users']['tingkat'];
//       noTlp = json['users']['no_tlp'];
//       alamat = json['users']['alamat'];
//       // remember_token: json['remember_token'],
//   }
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = <String, dynamic>{};
//   //   data['id'] = id;
//   //   data['username'] = username;
//   //   data['password'] = password;
//   //   data['nis'] = nis;
//   //   data['nik'] = nik;
//   //   data['nama'] = nama;
//   //   data['jenis_kelamin'] = jenisKelamin;
//   //   data['kelas'] = kelas;
//   //   data['jurusan'] = jurusan;
//   //   data['alamat'] = alamat;
//   //   data['tanggal_lahir'] = tanggalLahir;
//   //   data['no_tlp'] = noTlp;
//   //   data['tahun_masuk'] = tahunMasuk;
//   //   return data;
//   // }

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
