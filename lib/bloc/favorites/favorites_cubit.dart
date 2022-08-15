import 'package:cep_finder/bloc/favorites/favorites_state.dart';
import 'package:cep_finder/data/address_model.dart';
import 'package:cep_finder/data/shared_preferences_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesCubit extends Cubit<FavoriteState> {
  FavoritesCubit() : super(FavoriteState.loading());

  late SharedPreferences _preferences;

  /// Get the saved addresses from the local database
  Future<void> getFavoritesAddresses() async {
    _preferences = await SharedPreferences.getInstance();

    final stringList =
        _preferences.getStringList(SharedPreferencesKeys.favorites) ?? [];

    List<AddressModel> addresses = [];

    if (stringList.isNotEmpty) {
      addresses = AddressModel.fromJsonList(stringList);
    }
    emit(FavoriteState.fetchedData(addresses: addresses));
  }

  /// Delete a saved address
  Future<void> deleteAddress({
    required AddressModel addressModel,
  }) async {
    _preferences = await SharedPreferences.getInstance();

    final stringList =
        _preferences.getStringList(SharedPreferencesKeys.favorites) ?? [];

    final addresses = AddressModel.fromJsonList(stringList);

    addresses.removeWhere(
      (address) => address.cep == addressModel.cep,
    );

    _preferences.setStringList(
      SharedPreferencesKeys.favorites,
      AddressModel.toJsonList(addresses),
    );

    _preferences.setInt(SharedPreferencesKeys.savedCounter, addresses.length);

    getFavoritesAddresses();
  }
}
