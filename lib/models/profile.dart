import 'package:flutter/cupertino.dart';
import 'package:saydo/screens/profile/components/update_name.dart';
import 'package:saydo/screens/profile/components/update_phone_number.dart';

class ProfileTile {
  final String title;
  final String subtitle;
  final Widget page;

  ProfileTile({
    this.title,
    this.subtitle,
    this.page,
  });
}

List<ProfileTile> profileTiles = [
  ProfileTile(
    title: 'Name',
    subtitle: 'Mohammad Azeez',
    page: UpdateName(),
  ),
  ProfileTile(
    title: 'Phone Number',
    subtitle: '+964 750 371 78 34',
    page: UpdatePhoneNumber(),
  ),
  ProfileTile(
    title: 'Language',
    subtitle: 'English',
    page: UpdateName(),
  ),
  ProfileTile(
    title: 'Location',
    subtitle: 'Rzgari, Erbil - Iraq',
    page: UpdateName(),
  ),
  ProfileTile(
    title: 'Store Name',
    subtitle: 'Rzgari SuperMarket',
    page: UpdateName(),
  ),
];
