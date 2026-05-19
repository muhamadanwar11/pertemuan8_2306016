class PostModel {
  // Mendefinisikan properti/variabel yang akan menyimpan data dari API
  final int id;
  final String title;
  final String body;

  // Konstruktor untuk membuat objek PostModel (semua parameter wajib diisi / required)
  PostModel({
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory method: fungsi khusus untuk membuat (mencetak) objek PostModel baru dari data format JSON
  // Map<String, dynamic> berarti kunci (key) berupa String dan nilainya (value) bisa berupa tipe data apa saja (int, String, dll)
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      // Mengambil nilai berdasarkan nama kunci (key) persis seperti yang diberikan oleh JSON API
      id: json['id'], 
      title: json['title'], 
      body: json['body']
    );
  }
}
