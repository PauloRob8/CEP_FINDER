import 'package:cep_finder/bloc/search/search_state.dart';
import 'package:cep_finder/data/address_model.dart';
import 'package:cep_finder/data/request_cep_api.dart';
import 'package:cep_finder/data/shared_preferences_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    RequestCepApi? requestCepApi,
  })  : _requestCepApi = requestCepApi ?? RequestCepApi(),
        super(SearchState.initial());

  final RequestCepApi _requestCepApi;

  late SharedPreferences _preferences;

  /// Request information on the inputed CEP
  Future<void> searchCep({
    required String cep,
  }) async {
    emit(SearchState.isLoading());
    try {
      final rawCep = cep.replaceAll(RegExp('[^0-9]'), '');

      final addressModel = await _requestCepApi.searchCEP(cep: rawCep);
      if (addressModel != null) {
        await _incrementSearchedCounter();
        emit(SearchState.fetchedData(address: addressModel));
      }
    } on Exception {
      emit(SearchState.error(error: ErrorType.requestError));
    }
  }

  /// Increment the number of searched CEPS
  /// on the local database
  Future<void> _incrementSearchedCounter() async {
    _preferences = await SharedPreferences.getInstance();

    final currentCounter =
        _preferences.getInt(SharedPreferencesKeys.searchedCeps) ?? 0;

    _preferences.setInt(SharedPreferencesKeys.searchedCeps, currentCounter + 1);
  }

  /// Adds a new address on the local database
  /// and updates the amount of addresses saved
  Future<void> addToFavorites({
    required AddressModel? addressModel,
  }) async {
    emit(SearchState.isLoading());

    try {
      _preferences = await SharedPreferences.getInstance();

      final stringList =
          _preferences.getStringList(SharedPreferencesKeys.favorites) ?? [];

      if (_alreadyAdded(stringList, addressModel)) {
        emit(SearchState.error(error: ErrorType.alreadyAdded));
      } else {
        final toJsonAddress = addressModel!.toJson();
        stringList.add(toJsonAddress);

        _preferences.setStringList(SharedPreferencesKeys.favorites, stringList);
        _preferences.setInt(
            SharedPreferencesKeys.savedCounter, stringList.length);

        emit(SearchState.addedToFavorites());
      }
    } on Exception {
      emit(SearchState.error(error: ErrorType.errorOnAdd));
    }
  }

  bool _alreadyAdded(
    List<String> addressesString,
    AddressModel? newAddress,
  ) {
    final addedAdresses = AddressModel.fromJsonList(addressesString);

    final repeatedAddress = addedAdresses
        .where((address) => address.cep == newAddress!.cep)
        .toList();

    return repeatedAddress.isNotEmpty;
  }
}
