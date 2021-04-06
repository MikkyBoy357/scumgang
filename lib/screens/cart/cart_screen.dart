import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/const.dart';
import 'package:saydo/design_system/text_styles/text_styles.dart';
import 'package:saydo/design_system/widgets/cart_item_cards/cart_item.dart';
import 'package:saydo/screens/cart/waiting_for_order.dart';
import 'package:saydo/screens/home/components/cart/cartList.dart';

import '../../app_localizations.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool mich = false;
  bool profile = false;
  int totalPrice = 0;

  // Order variables
  var name;
  var size;
  var orderedPrice;
  var image;
  var units;
  var ordered;
  var uid;
  var adminId;
  var cartOrderId;
  String uidI = "";

  Future<bool> checkExist() async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance.doc("cartItems").get().then((doc) {
        if (doc.exists)
          mich = true;
        else
          mich = false;
      });
      print(mich);
      return exists;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkProfileExist() async {
    // bool exists = false;
    try {
      await FirebaseFirestore.instance
          .doc("users/${Const.uid}")
          .get()
          .then((doc) {
        if (doc.exists)
          profile = true;
        else
          profile = false;
      });
      // print('=======> profile> $profile');
      return profile;
    } catch (e) {
      return false;
    }
  }

  // name = product.name;
  // orderedPrice = product.price;
  // ordered = product.ordered;
  // size = product.size;
  // ordered = product.price;
  // image = product.image;
  // units = product.units;
  // uid = product.uid;
  // adminId = product.adminId;
  // cartOrderId = 1;
  confirmOrders(String location) {
    Const.myCartLength = cartId;
    for (var product in myCart.products) {
      name = product.name;
      orderedPrice = product.price;
      ordered = product.ordered;
      size = product.size;
      ordered = product.price;
      image = product.image;
      units = product.units;
      uid = product.uid;
      adminId = product.adminId;
      cartOrderId = 1;
      addCartItem(cartItems, location).then(
        (value) => showDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('Success'),
              content: Text('\n\nOrder confirmed successfully'),
            );
          },
        ),
      );
    }
    // myCart.products.clear();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WaitingForOrders();
        },
      ),
    );
  }

  cartPrice() async {
    // int myId;
    int price = 0;
    for (var product in myCart.products) {
      price += product.price;
    }
    totalPrice = price;
    print(price);
  }

  orderedField() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('cartItems')
        // .where('ordered', isEqualTo: 'true')
        // .where('cartId', isEqualTo: cartId)
        .get();
    for (QueryDocumentSnapshot doc in snap.docs) {
      setState(() {
        uidI = doc.data()['uid'];
      });
      print(',..,${doc.data()['uid']}');
    }
    setState(() {});
  }

  int myRandom = Random().nextInt(100000);

  // confirmOrder() async {
  // for (var product in myCart.products) {
  CollectionReference cartItems =
      FirebaseFirestore.instance.collection('carts');

  Future<void> addCartItem(CollectionReference cartItems, String location) {
    // Call the cartItems CollectionReference to add a new cartItem
    List prods = List();
    for (CartItem item in myCart.products) {
      prods.add({
        'name': item.name,
        'size': size,
        'price': orderedPrice,
        'image': image,
        'units': units,
        'ordered': ordered,
        'uid': uid,
        'adminId': adminId,
        'cartId': cartId,
      });
    }

    return cartItems
        .doc('$cartId')
        .set({
          "cartFields": prods,
          'orderedTime': DateTime.now().toIso8601String(),
          'location': location,
          'uid': Const.uid,
          'delivered': 'false',
        })
        .then((value) => print("AddCartItem"))
        .catchError((error) => print("Failed to add cartItems: $error"));
  }

  getUserLocation() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(Const.uid)
        .get();
    print(snap.data()['location']);
    print(snap.data()['orderId']);
    userLocation = snap.data()['location'];
  }

  var newIndex;

  String userLocation;
  String cartId = "${DateTime.now().toIso8601String()}";

  @override
  Widget build(BuildContext context) {
    checkProfileExist();
    cartPrice();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).translate('cart'),
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                AppLocalizations.of(context).translate('cart'),
                style: TextStyle(
                  color: MyColors.black2,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            myCart.products.isEmpty
                ? Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Cart Items will show here',
                          style: MyTextStyles.subtitleStyle,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: myCart.products.length,
                      // ignore: missing_return
                      itemBuilder: (context, index) {
                        newIndex = index;
                        // return CartItem();
                        return CartItem(
                          name: myCart.products[index].name,
                          size: myCart.products[index].size,
                          price: myCart.products[index].price,
                          image: myCart.products[index].image,
                          units: myCart.products[index].units,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.170,
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('total'),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'IQD ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$totalPrice',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(Const.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.065,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        // side: BorderSide(color: Colors.red),
                      ),
                      onPressed: () {
                        // print(snapshot.data['location']);
                        if (profile == true) {
                          snapshot.data['location'] == null
                              ? showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text('Error'),
                                      content: Text(
                                          '\n\nPlease go to the profile page and update your profile'),
                                    );
                                  },
                                )
                              : confirmOrders(snapshot.data['location']);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Error'),
                                content: Text(
                                    '\n\nPlease go to the profile page and update your profile'),
                              );
                            },
                          );
                        }
                      },
                      color: MyColors.blue1,
                      textColor: Colors.white,
                      child: Text(
                        AppLocalizations.of(context).translate('confirm_order'),
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// height: MediaQuery.of(context).size.height * 0.065,
// width: MediaQuery.of(context).size.width / 1.1,
