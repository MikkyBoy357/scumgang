import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saydo/design_system/colors/colors.dart';

import '../../app_localizations.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  const BottomBar({
    Key key,
    this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.blue1,
      items: [
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).translate('home'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).translate('cart'),
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          label: AppLocalizations.of(context).translate('profile'),
          icon: Icon(CupertinoIcons.profile_circled),
        ),
      ],
    );
  }
}
