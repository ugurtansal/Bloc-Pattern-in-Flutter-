import 'dart:async';

import 'package:bloc_pattern/data/cart_service.dart';
import 'package:bloc_pattern/models/Cart.dart';

class CartBloc{
  final cartStreamController=StreamController.broadcast();

  Stream get getStream=>cartStreamController.stream;

  void addToCart(Cart item){
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart()); //The purpose here is to send a notification to places that call CartService.getCart() that there is a change.
  }

  void removeFromCart(Cart item){
    CartService.removeFromCart(item);
    cartStreamController.sink.add(CartService.getCart()); //The purpose here is to send a notification to places that call CartService.getCart() that there is a change.
  }


  void getAll(){
    CartService.getCart();
    }
}

final cartBloc=CartBloc();