part of "main_bloc.dart";

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class MainEventChangeMenu extends MainEvent {
  const MainEventChangeMenu(this.menu);

  final MainMenu menu;

  @override
  List<Object?> get props => <Object?>[menu];
}

class MainEventImageChanged extends MainEvent {
  const MainEventImageChanged(this.imageIndex);

  final int imageIndex;

  @override
  List<Object?> get props => <Object?>[imageIndex];
}
