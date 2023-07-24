class Bannerm {
  String? gambar;

  Bannerm({this.gambar});

  Bannerm.fromJson(Map<String, dynamic> json) {
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gambar'] = gambar;
    return data;
  }
}
