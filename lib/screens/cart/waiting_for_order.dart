import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/button_widgets/buttons/blue_buttons/button1.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/const.dart';
import 'package:saydo/design_system/widgets/cart_item_cards/cart_item.dart';
import 'package:saydo/screens/home/main_screen.dart';

import '../../app_localizations.dart';

class WaitingForOrders extends StatefulWidget {
  @override
  _WaitingForOrdersState createState() => _WaitingForOrdersState();
}

class _WaitingForOrdersState extends State<WaitingForOrders> {
  int totalPrice = 0;

  cartPrice() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('cartItems')
        .where('uid', isEqualTo: Const.uid)
        .where('ordered', isEqualTo: 'true')
        .get();
    for (QueryDocumentSnapshot doc in snap.docs) {
      totalPrice += doc.data()['price'];
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Waiting for Order',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                AppLocalizations.of(context).translate('cart'),
                style: TextStyle(
                  color: MyColors.black2,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your order is on the way.',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  Container(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'If you need help please call us by clicking ',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'here.',
                        style: TextStyle(
                          fontSize: 17,
                          color: MyColors.blue1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('cartItems')
                  .where('uid', isEqualTo: Const.uid)
                  .where('ordered', isEqualTo: 'true')
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
                  return Center(child: CircularProgressIndicator());
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
        height: 150,
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                        'IDQ ',
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
              Button1(
                label: 'Home',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainScreen();
                      },
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
