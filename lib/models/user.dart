class User {
  String? username;
  String? password;
  String? nis;
  String? nama;
  String? agama;
  String? jenisKelamin;
  String? kelas;
  String? jurusan;
  String? email;
  String? noTelp;
  String? alamat;
  String? tempatLahir;
  String? tanggalLahir;
  String? tahunMasuk;
  String? title;
  String? image;

  User({
    this.username,
    this.password,
    this.nis,
    this.nama,
    this.agama,
    this.jenisKelamin,
    this.kelas,
    this.jurusan,
    this.email,
    this.noTelp,
    this.alamat,
    this.tanggalLahir,
    this.tempatLahir,
    this.tahunMasuk,
    this.image,
    this.title,
  });

//   factory User.fromJson(Map<dynamic, dynamic> json) {
//     return User(
//       username: json['username'],
//       password: json['password'],
//       nama: json['nama'],
//       agama: json['agama'],
//       jenisKelamin: json['jenis_kelamin'],
//       kelas: json['kelas'],
//       jurusan: json['jurusan'],
//       email: json['email'],
//       noTelp: json['no_hp'],
//       alamat: json['alamat'],
//       tempatLahir: json['tempat_lahir'],
//       tanggalLahir: json['tanggal_lahir'],
//       tahunMasuk: json['tahun_masuk'],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['username'] = username;
//     data['password'] = password;
//     data['nama'] = nama;
//     data['agama'] = agama;
//     data['jenis_kelamin'] = jenisKelamin;
//     data['kelas'] = kelas;
//     data['jurusan'] = jurusan;
//     data['alamat'] = alamat;
//     data['email'] = email;
//     data['tempat_lahir'] = tempatLahir;
//     data['tanggal_lahir'] = tanggalLahir;
//     data['tahun_masuk'] = tahunMasuk;
//     return data;
//   }

factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nama: map["nama"],
      username: map["username"],
      password: map["password"],
      email: map["email"],
      nis: map["nis"],
      kelas: map["kelas"],
      jurusan: map["jurusan"]
      // profilePhoto: map["profile_photo"],
      // phoneNumber: map["phone_number"],
    );
  }

  factory User.dummy() {
    return User(
      nama: "wafa ghaida aulia",
      username: "wafagaid",
      password: "12345",
      email: "wafa@email.com",
      nis: "12131241415344",
      kelas: "X",
      jurusan: "Multimedia"
      // profilePhoto:
      //     "https://cdn.idntimes.com/content-images/community/2020/09/104967619-2451390651819718-4934284928595035666-n-2fc82b7325949c7d003c1c58e17d48b7.jpg",
      // phoneNumber: "08124368912",
    );
  }
}
