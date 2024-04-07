class ProductsDetails {
  int? id;
  String? name;
  String? description;
  int? stock;
  String? price;
  int? bestSeller;
  int? discount;
  double? priceAfterDiscount;
  String? image;

  ProductsDetails(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.price,
      this.bestSeller,
      this.discount,
      this.priceAfterDiscount,
      this.image});

  ProductsDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    stock = json['stock'];
    price = json['price'];
    bestSeller = json['best_seller'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['stock'] = stock;
    data['price'] = price;
    data['best_seller'] = bestSeller;
    data['discount'] = discount;
    data['price_after_discount'] = priceAfterDiscount;
    data['image'] = image;
    return data;
  }
}
