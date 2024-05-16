import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsModel {
  final Icon icon;
  final String title, subTitle;
  final Widget? trailing;
  final void Function()? onPress;

  SettingsModel({
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onPress,
  });
}

List<SettingsModel> accountSettingsData = [
  SettingsModel(
      icon: const Icon(Iconsax.safe_home),
      title: 'My Addresses',
      subTitle: 'Set Shopping delivery address'),
  SettingsModel(
      icon: const Icon(Iconsax.shopping_cart),
      title: 'My Cart',
      subTitle: 'Add, remove products'),
  SettingsModel(
      icon: const Icon(Iconsax.bag_tick),
      title: 'My Orders',
      subTitle: 'In Progress and Complete Orders'),
  SettingsModel(
      icon: const Icon(Iconsax.bank),
      title: 'Bank Account',
      subTitle: 'Change Your bank account'),
  SettingsModel(
      icon: const Icon(Iconsax.discount_shape),
      title: 'My Coupons',
      subTitle: 'List of all discounted Coupons'),
  SettingsModel(
      icon: const Icon(Iconsax.notification),
      title: 'Notifications',
      subTitle: 'Set Any kinds of Notifications message'),
  SettingsModel(
      icon: const Icon(Iconsax.security_card),
      title: 'Account Provacy',
      subTitle: 'Manage data usage and connected accounts'),
];

List<SettingsModel> appSettingsData = [
  SettingsModel(
      icon: const Icon(Iconsax.document_upload),
      title: 'Load Data',
      subTitle: 'Upload Your data'),
  SettingsModel(
    icon: const Icon(Iconsax.location),
    title: 'Location',
    subTitle: 'Set recommendation based on location',
    trailing: Switch(
      value: true,
      onChanged: (val) {},
    ),
  ),
];
