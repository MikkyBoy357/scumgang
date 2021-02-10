import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';
import 'package:saydo/design_system/widgets/category_item_cards/available_item.dart';
import 'package:saydo/screens/home/components/add_to_cart.dart';

class CategoryView extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 9,
                // ignore: missing_return
                itemBuilder: (context, index) {
                  // return CartItem();
                  if (index != 0) {
                    return GestureDetector(
                      child: AvailableItem(),
                      onTap: () {
                        return showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return DraggableScrollableSheet(
                              expand: true,
                              initialChildSize: 0.95,
                              maxChildSize: 1,
                              minChildSize: 0.95,
                              builder: (BuildContext context,
                                  ScrollController scrollController) {
                                return AddToCart();
                              },
                            );
                          },
                        );
                      },
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'Category',
                        style: TextStyle(
                          color: MyColors.black2,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
