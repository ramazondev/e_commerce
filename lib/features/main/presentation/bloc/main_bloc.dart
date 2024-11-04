import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

part "main_state.dart";
part "main_event.dart";

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEventChangeMenu>(_onMainEventChangeMenu);
    on<MainEventImageChanged>(_onMainEventImageChanged);
  }

  void _onMainEventChangeMenu(
      MainEventChangeMenu event,
      Emitter<MainState> emit,
      ) {
    emit(state.copyWith(menu: event.menu));
  }

  void _onMainEventImageChanged(
      MainEventImageChanged event,
      Emitter<MainState> emit,
      ) {
    emit(state.copyWith(currentImageIndex: event.imageIndex));
  }
}