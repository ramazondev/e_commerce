part of "main_bloc.dart";

enum MainMenu { home, explore, cart, offer, account }

class MainState extends Equatable {
  const MainState({
    this.menu = MainMenu.home,
    this.currentImageIndex = 0,
  });

  final MainMenu menu;
  final int currentImageIndex;

  MainState copyWith({
    MainMenu? menu,
    int? currentImageIndex,
  }) => MainState(
    menu: menu ?? this.menu,
    currentImageIndex: currentImageIndex ?? this.currentImageIndex,
  );

  @override
  List<Object?> get props => <Object?>[menu, currentImageIndex];
}

