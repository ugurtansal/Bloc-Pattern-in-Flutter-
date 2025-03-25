

import 'package:bloc_pattern/models/Product.dart';

class ProductService{
  static final  List<Product> products= [];
  static ProductService _singleton=ProductService._internal();

  factory ProductService(){
      return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll(){
    products.add(new Product(id: 1, name: "Huawei Laptop", price: 359500));
    products.add(new Product(id: 2, name: "Monster Laptop", price: 30000));
    products.add(new Product(id: 3, name: "Lenovo Laptop", price: 25000));
    return products;
  }
}