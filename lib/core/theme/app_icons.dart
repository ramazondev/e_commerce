import 'dart:ui';

import 'package:flutter_svg/svg.dart';

sealed class AppIcons {
  AppIcons._();

  // Logo Icons
  static const String logo = 'assets/icons/icon.svg';
  static const String logoWhite = 'assets/icons/iconWhite.svg';

  //
  static const String mail = 'assets/icons/icon_mail.svg';
  static const String password = 'assets/icons/icon_password.svg';
  static const String google = 'assets/icons/icon_google.svg';
  static const String facebook = 'assets/icons/icon_facebook.svg';
  static const String search = 'assets/icons/search.svg';
  static const String favorite = 'assets/icons/favorite.svg';
  static const String notification = 'assets/icons/notification.svg';
  static const String arrow = 'assets/icons/arrow.svg';
  static const String delete = 'assets/icons/delete.svg';
  static const String more = 'assets/icons/more.svg';
  static const String minus = 'assets/icons/minus.svg';
  static const String plus = 'assets/icons/plus.svg';
  static const String iconAddress = 'assets/icons/icon_address.svg';
  static const String iconProfile = 'assets/icons/icon_profile.svg';
  static const String arrowRight = 'assets/icons/arrow_right.svg';
  static const String birthday = 'assets/icons/birthday.svg';
  static const String phone = 'assets/icons/phone.svg';
  static const String iconPassword = 'assets/icons/icon_password.svg';
  static const String email = 'assets/icons/email.svg';
  static const String arrowBottom = 'assets/icons/arrow_bottom.svg';


  // ButtonNavigation Icons
  static const String home = 'assets/icons/icon_home.svg';
  static const String explore = 'assets/icons/icon_explore.svg';
  static const String cart = 'assets/icons/icon_cart.svg';
  static const String offer = 'assets/icons/icon_offer.svg';
  static const String account = 'assets/icons/icon_account.svg';
  static const String gender = 'assets/icons/gender.svg';

  // search Icons
  static const String shirt = 'assets/icons/icon_shirt.svg';
  static const String dress = 'assets/icons/dress.svg';
  static const String equipment = 'assets/icons/work_equipment.svg';
  static const String womanBag = 'assets/icons/women_bag.svg';
  static const String manPants = 'assets/icons/man_pants.svg';
  static const String manShoes = 'assets/icons/man_shoes.svg';
  static const String manTShirt = 'assets/icons/man_t_shirt.svg';
  static const String manUnder = 'assets/icons/man_under.svg';
  static const String womanTShirt = 'assets/icons/woman _t_shirt.svg';
  static const String womanPants = 'assets/icons/woman_pants.svg';
  static const String womanShoes = 'assets/icons/woman_shoes.svg';
  static const String womenSkirt = 'assets/icons/women_skirt.svg';
  static const String bikini = 'assets/icons/bikini.svg';
  static const String iconOrder = 'assets/icons/icon_order.svg';
  static const String payment = 'assets/icons/icon_payment.svg';

  // Icon Star

  static const String starYel = 'assets/icons/star_yellow.svg';
  static const String starGr = 'assets/icons/star_green.svg';
}

extension AppSvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width = 24,
    double? height = 24,
  }) =>
      SvgPicture.asset(
        this,
        color: color,
        width: width,
        height: height,
      );
}
