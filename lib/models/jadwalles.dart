class Jadwalles {
  String? id;
  String? idUser;
  String? tanggal;
  String? jam;
  String? status;
  String? namaMentor;
  String? materi;
  String? jenis;

  Jadwalles(
      {
        this.id,
        this.idUser,
        this.tanggal,
        this.jam,
        this.status,
        this.namaMentor,
        this.materi,
        this.jenis
      });

  Jadwalles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    tanggal = json['tanggal'];
    jam = json['jam'];
    status = json['status'];
    namaMentor = json['nama_mentor'];
    materi = json['materi'];
    jenis = json['jenis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['tanggal'] = this.tanggal;
    data['jam'] = this.jam;
    data['status'] = this.status;
    data['nama_mentor'] = this.namaMentor;
    data['materi'] = this.materi;
    data['jenis'] = this.jenis;
    return data;
  }
}
