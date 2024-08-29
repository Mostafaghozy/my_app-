class NewProduct {
  final String title;
  final String desc;
  final double price;
  final String image;

  const NewProduct({required this.title, required this.desc, required this.price,required this.image});
  factory NewProduct.fromJson(data){
    return NewProduct(title: data["title"], desc:data["description"], price: data["price"],image: data["images"][0]);
  }

}