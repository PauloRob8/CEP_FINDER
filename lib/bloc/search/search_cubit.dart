import 'package:cep_finder/bloc/search/search_state.dart';
import 'package:cep_finder/data/request_cep_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    RequestCepApi? requestCepApi,
  })  : _requestCepApi = requestCepApi ?? RequestCepApi(),
        super(SearchState.initial());

  final RequestCepApi _requestCepApi;

  /// Request information on the inputed CEP
  Future<void> searchCep({
    required String cep,
  }) async {
    emit(SearchState.isLoading());
    try {
      final rawCep = cep.replaceAll(RegExp('[^0-9]'), '');

      final addressModel = await _requestCepApi.searchCEP(cep: rawCep);
      if (addressModel != null) {
        emit(SearchState.fetchedData(address: addressModel));
      }
    } on Exception {
      emit(SearchState.error());
    }
  }
}
