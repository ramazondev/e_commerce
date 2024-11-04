part of "app_routes.dart";

abstract class Routes {
  Routes._();

  static const String initial = "/";

  /// Auth
  static const String auth = "/auth";
  static const String confirmCode = "/confirm-code";
  static const String register = "/register";

  // Home
  static const String home = "/home";
  static const String explore = "/explore";
  static const String cart = "/cart";
  static const String offer = "/offer";
  static const String account = "/account";
  static const String detail = "/detail";

  /// Icon Button
  static const String flashSale = "/flash-sale";
  static const String favorite = "/favorite";
  static const String shipTo = "/ship-to";

  ///Products
  static const String dress = "/dress";
  static const String equipment = "/equipment";
  static const String womanBag = "/woman-bag";
  static const String manPants = "/man-pants";
  static const String manShoes = "/man-shoes";
  static const String manTShirt = "/man-t-shirt";
  static const String manUnderwear = "/man-underwear";
  static const String womanTShirt = "/woman-t-shirt";
  static const String womanPants = "/woman-pants";
  static const String womanShoes = "/woman-shoes";
  static const String womenSkirt = "/skirt";
  static const String bikini = "/bikini";

  /// Profile
  static const String profile = "/profile";
  static const String changeName = "/change-name";
  static const String gender = "/gender";
  static const String birthday = "/birthday";
  static const String aboutUs = "/about-us";
  static const String email = "/email";
  static const String phoneNumber = "/phone-number";
  static const String password = "/password";

  ///Profile //Order
  static const String order = "/order";
  static const String orderDetails = "/order-details";



  /// Internet connection
  static const String noInternet = "/no-internet";
}
