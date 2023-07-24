class Mentor {
  String? idMentor;
  String? namaMentor;
  String? bidang;
  String? fotoMentor;
  String? email;
  String? alamat;
  String? telepon;

  Mentor({
    this.idMentor,
    this.namaMentor,
    this.bidang,
    this.fotoMentor,
    this.email,
    this.alamat,
    this.telepon,
  });

  Mentor.fromJson(Map<String, dynamic> json) {
    idMentor = json['id_mentor'];
    namaMentor = json['nama_mentor'];
    bidang = json['bidang'];
    fotoMentor = json['foto_mentor'];
    email = json['email'];
    alamat = json['alamat'];
    telepon = json['telepon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_mentor'] = idMentor;
    data['nama_mentor'] = namaMentor;
    data['bidang'] = bidang;
    data['foto_mentor'] = fotoMentor;
    data['email'] = email;
    data['alamat'] = alamat;
    data['telepon'] = telepon;
    return data;
  }

  void forEach(Null Function(dynamic item) param0) {}
}
