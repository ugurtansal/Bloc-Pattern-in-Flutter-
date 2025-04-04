import 'package:bloc_pattern/models/Cart.dart';

class CartService{
  static final List<Cart> cartItems=[];
  static CartService _singleton=CartService._internal();

  factory CartService(){
    return _singleton;
  }

  CartService._internal();

  static void addToCart(Cart item){
    cartItems.add(item);
  }

  static void removeFromCart(Cart item){
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    print("Sepetteki ürünler: ${cartItems.map((e) => e.product.name).toList()}");
    return cartItems;
  }

}