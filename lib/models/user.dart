class User {
  int id;
  String username;
  String password;
  String nis;
  String nik;
  String nama;
  String kelas;
  String jurusan;
  String jenis_kelamin;
  String tanggal_lahir;
  String tahun_masuk;
  String no_tlp;
  String alamat;
  String remember_token;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.nis,
    required this.nik,
    required this.nama,
    required this.jenis_kelamin,
    required this.kelas,
    required this.jurusan,
    required this.no_tlp,
    required this.alamat,
    required this.tanggal_lahir,
    required this.tahun_masuk,
    required this.remember_token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['users']['id'],
      username: json['users']['username'],
      password: json['users']['password'],
      nis: json['users']['nis'],
      nik: json['users']['nik'],
      nama: json['users']['nama'],
      jenis_kelamin: json['users']['jenis_kelamin'],
      tanggal_lahir: json['users']['tanggal_lahir'],
      tahun_masuk: json['users']['tahun_masuk'],
      kelas: json['users']['kelas'],
      jurusan: json['users']['jurusan'],
      no_tlp: json['users']['no_tlp'],
      alamat: json['users']['alamat'],
      remember_token: json['remember_token'],
    );
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['username'] = username;
  //   data['password'] = password;
  //   data['nis'] = nis;
  //   data['nik'] = nik;
  //   data['nama'] = nama;
  //   data['jenis_kelamin'] = jenisKelamin;
  //   data['kelas'] = kelas;
  //   data['jurusan'] = jurusan;
  //   data['alamat'] = alamat;
  //   data['tanggal_lahir'] = tanggalLahir;
  //   data['no_tlp'] = noTlp;
  //   data['tahun_masuk'] = tahunMasuk;
  //   return data;
  // }

// factory User.fromMap(Map<String, dynamic> map) {
//     return User(
//       nama: map["nama"],
//       username: map["username"],
//       password: map["password"],
//       email: map["email"],
//       nis: map["nis"],
//       kelas: map["kelas"],
//       jurusan: map["jurusan"]
//       // profilePhoto: map["profile_photo"],
//       // phoneNumber: map["phone_number"],
//     );
//   }

  // factory User.dummy() {
  //   return User(
  //       nama: "Wafa Ghaida Aulia",
  //       username: "wafagaid",
  //       password: "12345",
  //       nis: "12131241415344",
  //       kelas: "X",
  //       jurusan: "Multimedia",
  //       alamat: "Sukaraja Karpaw",
  //       // profilePhoto:
  //       //     "https://cdn.idntimes.com/content-images/community/2020/09/104967619-2451390651819718-4934284928595035666-n-2fc82b7325949c7d003c1c58e17d48b7.jpg",
  //       // phoneNumber: "08124368912",
  //       );
  // }
}
