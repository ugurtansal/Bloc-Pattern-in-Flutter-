import 'package:bloc_pattern/models/Product.dart';

class Cart{
  final Product product;
  final int quantity;

  Cart({required this.product,required this.quantity});
}