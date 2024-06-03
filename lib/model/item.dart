class Item {
  String name;
  String description;
  int price;
  int weight;
  String url;

  Item(this.name, this.description, this.price, this.weight, this.url);

  Item.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        description = map['description'],
        price = map['price'],
        weight = map['weight'],
        url = map['url'];

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'description' : description,
      'price' : price,
      'weight' : weight,
      'url' : url,
    };
  }
}