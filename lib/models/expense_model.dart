class ExpenseModel {
  final int? id;
  final String name;
  final String category;
  final String date;
  final String imageCategory;
  final int colorCategory;
  final String price;

  ExpenseModel({
    this.id,
    required this.name,
    required this.category,
    required this.date,
    required this.imageCategory,
    required this.price,
    required this.colorCategory,
  });

  Map<String, dynamic> toDatabaseJson() => {
        'id': id,
        'name': name,
        'category': category,
        'date': date,
        'price': price,
        'imageCategory': imageCategory,
        'colorCategory': colorCategory,

        
      };

  factory ExpenseModel.fromDatabaseJson(Map<String, dynamic> json) => ExpenseModel(
        id: json['id'],
        name: json['name'],
        category: json['category'],
        date: json['date'],
        price: json['price'],
        imageCategory: json['imageCategory'],
        colorCategory: json['colorCategory'],
      );
}
