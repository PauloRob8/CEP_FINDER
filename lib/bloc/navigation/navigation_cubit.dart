import 'package:cep_finder/bloc/navigation/navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  ///Simple cubit for state management of the
  /// home page, recieves an index and update it
  void changeIndex({required int index}) {
    emit(NavigationState.changeIndex(index: index));
  }
}
