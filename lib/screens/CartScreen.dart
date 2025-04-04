import 'package:bloc_pattern/blocs/cart_bloc.dart';
import 'package:bloc_pattern/data/cart_service.dart';
import 'package:bloc_pattern/models/Cart.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sepetim"), centerTitle: true),
      body: StreamBuilder(
        stream: cartBloc.getStream,
        initialData: CartService.getCart(), // Boş bir liste ile başlat
        builder: (context, snapshot) {
          return buildCard(snapshot);
        },
      ),
    );
  }

  Widget buildCard(AsyncSnapshot snapshot) {

    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, index) {
        final cart = snapshot.data ;
        return ListTile(
          title: Text(cart[index].product.name), // Ürün adı
          subtitle:  Text(cart[index].product.price.toString()),
          trailing: IconButton(
            onPressed: () {
              cartBloc.removeFromCart(cart[index]);
            },
            icon: Icon(Icons.remove_shopping_cart),
          ),
        );
      },
    );
  }
}

