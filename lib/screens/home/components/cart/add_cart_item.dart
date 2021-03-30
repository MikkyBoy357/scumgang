import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCartItem extends StatelessWidget {
  final String name;
  final String size;
  final int price;
  final String image;
  final int units;
  final String ordered;
  final String uid;
  final String adminId;
  final String cartId;
  final String orderedTime;
  final String location;

  const AddCartItem({
    Key key,
    this.name,
    this.size,
    this.price,
    this.image,
    this.units,
    this.ordered,
    this.uid,
    this.adminId,
    this.cartId,
    this.orderedTime,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called cartItems that references the firestore collection
    CollectionReference cartItems =
        FirebaseFirestore.instance.collection('carts');

    Future<void> addCartItem() {
      // Call the cartItems CollectionReference to add a new cartItem
      return cartItems
          .add({
            'name': name,
            'size': size,
            'price': price,
            'image': image,
            'units': units,
            'ordered': ordered,
            'uid': uid,
            'adminId': adminId,
            'cartId': cartId,
            'orderedTime': orderedTime,
            'location': location,
          })
          .then((value) => print("AddCartItem"))
          .catchError((error) => print("Failed to add cartItems: $error"));
    }

    return FlatButton(
      onPressed: addCartItem,
      child: Text(
        "AddCartItem",
      ),
    );
  }
}
