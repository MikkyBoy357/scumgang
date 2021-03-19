import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/const.dart';
import 'package:saydo/design_system/text_styles/text_styles.dart';
import 'package:saydo/design_system/widgets/cart_item_cards/cart_item.dart';
import 'package:saydo/screens/cart/waiting_for_order.dart';
import 'package:intl/intl.dart';

import '../../app_localizations.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool mich = false;
  int totalPrice = 0;

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

  cartPrice() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('cartItems')
        .where('uid', isEqualTo: Const.uid)
        .where('ordered', isNotEqualTo: 'true')
        .get();
    for (QueryDocumentSnapshot doc in snap.docs) {
      totalPrice += doc.data()['price'];
    }
    setState(() {});
  }

  confirmOrder() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('cartItems')
        .where('uid', isEqualTo: Const.uid)
        .get();
    for (QueryDocumentSnapshot doc in snap.docs) {
      doc.reference.update(<String, dynamic>{
        'ordered': 'true',
        'orderedTime': DateFormat('hh:mm aaa').format(DateTime.now()),
      });
    }
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    cartPrice();
  }

  @override
  Widget build(BuildContext context) {
    cartPrice();
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
                  .where('ordered', isNotEqualTo: 'true')
                  .snapshots(),
              builder: (context, snapshot) {
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
                    itemCount: snapshot.data.docs.length,
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      // return CartItem();
                      return CartItem(
                        name: snapshot.data.docs[index]['name'],
                        size: snapshot.data.docs[index]['size'],
                        price: snapshot.data.docs[index]['price'],
                        image: snapshot.data.docs[index]['image'],
                        units: snapshot.data.docs[index]['units'],
                      );
                    },
                  ),
                );
              },
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width / 1.3,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    // side: BorderSide(color: Colors.red),
                  ),
                  onPressed: () {
                    confirmOrder();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return WaitingForOrders();
                        },
                      ),
                    );
                  },
                  color: MyColors.blue1,
                  textColor: Colors.white,
                  child: Text(
                    AppLocalizations.of(context).translate('confirm_order'),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
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
