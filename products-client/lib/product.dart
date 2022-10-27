class Product {
  String id;
  String name;
  String brand;
  String price;
  String description;

  Product(
      [this.id = '',
      this.name = '',
      this.brand = '',
      this.price = '',
      this.description = '']);

  Map<String, String> toJson() => {
        'id': id,
        'name': name,
        'brand': brand,
        'price': price,
        'description': description,
      };
}
