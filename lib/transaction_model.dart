
class TransactionModel {
  final String id;
  final String title;
  final String subtitle;
  final String date;
  final String price;
  final String imageUrl;

  TransactionModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.price,
    required this.imageUrl,
  });
   factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'].toString(),
      title: json['title'],
      subtitle: json['subtitle'],
      date: json['date'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'date': date,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}





