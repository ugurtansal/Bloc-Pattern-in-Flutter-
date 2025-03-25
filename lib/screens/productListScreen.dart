import 'package:bloc_pattern/blocs/cart_bloc.dart';
import 'package:bloc_pattern/blocs/product_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/Cart.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => Navigator.pushNamed(context, "/cart"),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: buildProductList(),
    );
  }

  buildProductList() {
    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot) {
          return snapshot.data.length > 0
              ? buildProductListItems(snapshot)
              : Center(child: Text("Data yok"),);
        }
    );
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          final list=snapshot.data;
          return ListTile(
            title:Text( list[index].name),
            subtitle: Text(list[index].price.toString()),
            trailing: IconButton(onPressed: (){cartBloc.addToCart(Cart(product: list[index],quantity: 1));}, icon: Icon(Icons.add_shopping_cart)),
          );
        });
  }
}