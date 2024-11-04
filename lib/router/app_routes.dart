import 'package:e_commerce/features/account/presentation/pages/account_page.dart';
import 'package:e_commerce/features/account/presentation/pages/order/order_page.dart';
import 'package:e_commerce/features/account/presentation/pages/order/widgets/order_details.dart';
import 'package:e_commerce/features/auth/presentation/pages/auth/auth_page.dart';
import 'package:e_commerce/features/auth/presentation/pages/confirm/confirm_page.dart';
import 'package:e_commerce/features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce/features/cart/presentation/pages/widgets/w_ship_to.dart';
import 'package:e_commerce/features/explore/presentation/pages/explore_page.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/custom_favorite_page.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/product_detail.dart';
import 'package:e_commerce/features/home/presentation/pages/widgets/super_flash_sale.dart';
import 'package:e_commerce/features/offer/presentation/pages/offer_page.dart';
import 'package:e_commerce/features/others/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/account/presentation/pages/profile/profile_page.dart';
import '../features/account/presentation/pages/profile/widgets/birthday.dart';
import '../features/account/presentation/pages/profile/widgets/change_name.dart';
import '../features/account/presentation/pages/profile/widgets/email.dart';
import '../features/account/presentation/pages/profile/widgets/gender.dart';
import '../features/account/presentation/pages/profile/widgets/password.dart';
import '../features/account/presentation/pages/profile/widgets/phone_number.dart';
import '../features/auth/presentation/pages/register/register_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/main/presentation/bloc/main_bloc.dart';
import '../features/main/presentation/pages/main_page.dart';
import '../injector_container.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.initial,
  navigatorKey: rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.initial,
      name: Routes.initial,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),

    GoRoute(
      path: Routes.auth,
      name: Routes.auth,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const AuthPage(),
    ),

    GoRoute(
      path: Routes.confirmCode,
      name: Routes.confirmCode,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ConfirmPage(),
    ),

    GoRoute(
      path: Routes.register,
      name: Routes.register,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const RegisterPage(),
    ),
    GoRoute(
      path: Routes.favorite,
      name: Routes.favorite,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const CustomFavoritePage(),
    ),
    GoRoute(
      path: Routes.flashSale,
      name: Routes.flashSale,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SuperFlashSale(),
    ),
    GoRoute(
      path: Routes.shipTo,
      name: Routes.shipTo,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const WShipTo(),
    ),
    GoRoute(
      path: Routes.profile,
      name: Routes.profile,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ProfilePage(),
    ),
    GoRoute(
      path: Routes.changeName,
      name: Routes.changeName,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const ChangeName(),
    ),
    GoRoute(
      path: Routes.gender,
      name: Routes.gender,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const Gender(),
    ),
    GoRoute(
      path: Routes.email,
      name: Routes.email,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const Email(),
    ),
    GoRoute(
      path: Routes.phoneNumber,
      name: Routes.phoneNumber,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const PhoneNumber(),
    ),
    GoRoute(
      path: Routes.birthday,
      name: Routes.birthday,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const Birthday(),
    ),
    GoRoute(
      path: Routes.password,
      name: Routes.password,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const Password(),
    ),
    GoRoute(
      path: Routes.order,
      name: Routes.order,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const OrderPage(),
    ),
    GoRoute(
      path: Routes.orderDetails,
      name: Routes.orderDetails,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const OrderDetails(),
    ),
    GoRoute(
      path: Routes.detail,
      name: Routes.detail,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => ProductDetail(
        name: state.extra as String? ?? '',
      ),
    ),

    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (
        _,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) =>
          BlocProvider<MainBloc>(
        key: state.pageKey,
        create: (_) => sl<MainBloc>(),
        child: MainPage(
          key: state.pageKey,
          navigationShell: navigationShell,
        ),
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: Routes.home,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.home,
              name: Routes.home,
              builder: (_, __) =>  HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.explore,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.explore,
              name: Routes.explore,
              builder: (_, __) => const ExplorePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.cart,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.cart,
              name: Routes.cart,
              builder: (_, __) => const CartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.offer,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.offer,
              name: Routes.offer,
              builder: (_, __) => const OfferPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          initialLocation: Routes.account,
          routes: <RouteBase>[
            GoRoute(
              path: Routes.account,
              name: Routes.account,
              builder: (_, __) => const AccountPage(),
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: '/manShirt',
    //   name: 'manShirt',
    //   builder: (_, __) => const ManShirtPage(),
    // ),
    // GoRoute(
    //   path: '/dress',
    //   name: 'dress',
    //   builder: (_, __) => const DressPage(),
    // ),
    // GoRoute(
    //   path: '/equipment',
    //   name: 'equipment',
    //   builder: (_, __) => const EquipmentPage(),
    // ),
    // GoRoute(
    //   path: '/womanBag',
    //   name: 'womanBag',
    //   builder: (_, __) => const WomanBagPage(),
    // ),
    // GoRoute(
    //   path: '/manPants',
    //   name: 'manPants',
    //   builder: (_, __) => const ManPantsPage(),
    // ),
    // GoRoute(
    //   path: '/manShoes',
    //   name: 'manShoes',
    //   builder: (_, __) => const ManShoesPage(),
    // ),
    // GoRoute(
    //   path: '/manTShirt',
    //   name: 'manTShirt',
    //   builder: (_, __) => const ManTShirtPage(),
    // ),
    // GoRoute(
    //   path: '/manUnderwear',
    //   name: 'manUnderwear',
    //   builder: (_, __) => const ManUnderwearPage(),
    // ),
    // GoRoute(
    //   path: '/womanTShirt',
    //   name: 'womanTShirt',
    //   builder: (_, __) => const WomanTShirtPage(),
    // ),
    // GoRoute(
    //   path: '/womanPants',
    //   name: 'womanPants',
    //   builder: (_, __) => const WomanPantsPage(),
    // ),
    // GoRoute(
    //   path: '/womanShoes',
    //   name: 'womanShoes',
    //   builder: (_, __) => const WomanShoesPage(),
    // ),
    // GoRoute(
    //   path: '/skirt',
    //   name: 'skirt',
    //   builder: (_, __) => const SkirtPage(),
    // ),
    // GoRoute(
    //   path: '/bikini',
    //   name: 'bikini',
    //   builder: (_, __) => const BikiniPage(),
    // ),
  ],
);
