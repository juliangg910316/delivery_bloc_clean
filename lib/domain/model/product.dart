class Product {
  const Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
  final String name;
  final String description;
  final double price;
  final String image;

  @override
  String toString() {
    // TODO: implement toString
    return '{name : $name , description : $description , price : $price , image : $image}';
  }
}
