class Kelasuser {
  String? idKelas;
  String? materi;

  Kelasuser({this.idKelas, this.materi});

  Kelasuser.fromJson(Map<String, dynamic> json) {
    idKelas = json['id_kelas'];
    materi = json['materi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_kelas'] = idKelas;
    data['materi'] = materi;
    return data;
  }
}