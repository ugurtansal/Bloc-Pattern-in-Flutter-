import 'dart:async';

import 'package:bloc_pattern/data/cart_service.dart';
import 'package:bloc_pattern/models/Cart.dart';

class CartBloc{
  final cartStreamController=StreamController<List<Cart>>.broadcast();

  Stream get getStream=>cartStreamController.stream;

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(List.from(CartService.getCart())); //The purpose here is to send a notification to places that call CartService.getCart() that there is a change.
    print("Güncellenmiş sepet: ${CartService.getCart().map((e) => e.product.name).toList()}"); // Konsolda yazdır

  }

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(List.from(CartService.getCart())); //The purpose here is to send a notification to places that call CartService.getCart() that there is a change.
  }


  void getAll(){
    CartService.getCart();
    }

  void dispose() {
    cartStreamController.close();
  }
}

final cartBloc=CartBloc();