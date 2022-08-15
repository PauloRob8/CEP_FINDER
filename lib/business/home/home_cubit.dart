import 'package:cep_finder/business/home/home_state.dart';
import 'package:cep_finder/data/shared_preferences_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.isLoading());

  late SharedPreferences _preferences;

  /// Get saved data on the local database
  /// number of saved ceps
  /// number of searched of ceps
  Future<void> getSavedData() async {
    _preferences = await SharedPreferences.getInstance();

    final searchedCeps =
        _preferences.getInt(SharedPreferencesKeys.searchedCeps) ?? 0;
    final savedCounter =
        _preferences.getInt(SharedPreferencesKeys.savedCounter) ?? 0;

    emit(
      HomeState.fetchedData(
        searchedCeps: searchedCeps,
        savedCounter: savedCounter,
      ),
    );
  }
}
