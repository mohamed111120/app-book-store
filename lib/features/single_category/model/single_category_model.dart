class SingleCategoryModel {
  Data? data;
  String? message;
  List? error;
  int? status;

  SingleCategoryModel({this.data, this.message, this.error, this.status});

  SingleCategoryModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error!.add(v);
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    if (error != null) {
      data['error'] = error!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? slug;
  List<CategoryProducts>? categoryProducts;

  Data({this.id, this.name, this.slug, this.categoryProducts});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['categoryProducts'] != null) {
      categoryProducts = <CategoryProducts>[];
      json['categoryProducts'].forEach((v) {
        categoryProducts!.add(CategoryProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (categoryProducts != null) {
      data['categoryProducts'] =
          categoryProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryProducts {
  int? id;
  String? name;
  String? description;
  int? stock;
  String? price;
  int? bestSeller;
  int? discount;
  double? priceAfterDiscount;
  String? image;

  CategoryProducts(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.price,
      this.bestSeller,
      this.discount,
      this.priceAfterDiscount,
      this.image});

  CategoryProducts.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = {};
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
