import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/const.dart';
import 'package:saydo/design_system/text_styles/text_styles.dart';
import 'package:saydo/design_system/widgets/cart_item_cards/cart_item.dart';
import 'package:saydo/screens/cart/waiting_for_order.dart';
import 'package:intl/intl.dart';
import 'package:saydo/screens/home/components/cart/cartList.dart';

import '../../app_localizations.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool mich = false;
  int totalPrice = 0;

  // Order variables
  var orderItem;
  var orderSize;
  var orderPrice;
  var orderImage;
  var orderUnits;
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

  // cartPrice() async {
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection('cartItems')
  //       // .where('uid', isEqualTo: Const.uid)
  //       .where('ordered', isEqualTo: 'false')
  //       .where('cartId', isEqualTo: cartId)
  //       .get();
  //   for (QueryDocumentSnapshot doc in snap.docs) {
  //     totalPrice += doc.data()['price'];
  //     print(doc.data()['cartId']);
  //     print(',..,${doc.data()['ordered']}');
  //   }
  //   setState(() {});
  // }

  cartPrice() async {
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
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection('cartItems')
  //       .where('uid', isEqualTo: Const.uid)
  //       .where('ordered', isEqualTo: 'false')
  //       .where('cartId', isEqualTo: cartId)
  //       .get();
  //   for (QueryDocumentSnapshot doc in snap.docs) {
  //     doc.reference.update(<String, dynamic>{
  //       'ordered': 'true',
  //       'phoneNumber': Const.phoneNumber,
  //       'orderedTime': DateFormat('hh:mm aaa').format(DateTime.now()),
  //       'location': userLocation,
  //       'orderId': '${DateFormat('hh:mm aaa').format(DateTime.now())}$myRandom',
  //     });
  //   }
  //   setState(() {});
  //   // Add Cart Items to orders
  //
  //   // DocumentReference documentReference = FirebaseFirestore
  //   //     .instance
  //   //     .collection("cartItems")
  //   //     .doc("${Const.uid}" + "${DateTime.now().second}");
  //   // print('=========> RANDOM LOG HAHAHAHAHA');
  //   // print(Const.cartItemId);
  //   // Map<String, dynamic> categories = {
  //   //   "name": widget.name,
  //   //   "size": widget.size,
  //   //   "price": price,
  //   //   "image": widget.image,
  //   //   "units": units,
  //   //   "ordered": 'false',
  //   //   "uid": Const.uid,
  //   //   "adminId": widget.adminId,
  //   //   "cartId": Const.cartItemId,
  //   // };
  //   // print("=======> Firestore Mapping");
  //   // print(categories.toString());
  //   // documentReference.set(categories);
  // }

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

  @override
  initState() {
    super.initState();
    // cartPrice();
    // orderedField();
  }

  String userLocation;
  String cartId = Const.cartItemId;

  @override
  Widget build(BuildContext context) {
    cartPrice();
    // orderedField();
    // print(Random().nextInt(100000));
    // print('<><><>$cartId');
    // getUserLocation();
    // print('=======>$userLocation');
    // print('===>${Const.cartId}');
    // orderedField();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('cartItems')
                  .where('uid', isEqualTo: Const.uid)
                  .where('ordered', isEqualTo: 'false')
                  .where('cartId', isEqualTo: cartId)
                  .snapshots(),
              builder: (context, snapshot) {
                // print('>>>>>$cartId');
                // print(snapshot.data.docs[0]['cartItemId']);
                // if (mich == false)
                //   return Container(
                //     height: MediaQuery.of(context).size.height / 2,
                //     child: Center(
                //       child: Text(
                //         'Add Items you wish to buy here',
                //         style: MyTextStyles.subtitleStyle,
                //       ),
                //     ),
                //   );
                if (!snapshot.hasData)
                  return Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Cart Items will show here',
                          style: MyTextStyles.subtitleStyle,
                        ),
                      ),
                    ),
                  );
                return Expanded(
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
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('cartItems')
              .where('uid', isEqualTo: Const.uid)
              .where('ordered', isEqualTo: 'false')
              .where('cartId', isEqualTo: cartId)
              .snapshots(),
          builder: (context, snapshot) {
            return Container(
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          // side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          // confirmOrder();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WaitingForOrders(
                                    // name: snapshot.data.docs[newIndex]['name'],
                                    // size: snapshot.data.docs[newIndex]['size'],
                                    // price: snapshot.data.docs[newIndex]['price'],
                                    // image: snapshot.data.docs[newIndex]['image'],
                                    // units: snapshot.data.docs[newIndex]['units'],
                                    );
                              },
                            ),
                          );
                        },
                        color: MyColors.blue1,
                        textColor: Colors.white,
                        child: Text(
                          AppLocalizations.of(context)
                              .translate('confirm_order'),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

// height: MediaQuery.of(context).size.height * 0.065,
// width: MediaQuery.of(context).size.width / 1.1,
