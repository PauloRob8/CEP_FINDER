import 'package:cep_finder/data/address_model.dart';
import 'package:equatable/equatable.dart';

class SearchState extends Equatable {
  const SearchState({
    required this.isLoading,
    required this.addressModel,
    required this.errorOnRequest,
  });

  factory SearchState.initial() => const SearchState(
        isLoading: false,
        addressModel: null,
        errorOnRequest: false,
      );

  factory SearchState.isLoading() => const SearchState(
        isLoading: true,
        addressModel: null,
        errorOnRequest: false,
      );

  factory SearchState.fetchedData({
    required AddressModel address,
  }) =>
      SearchState(
        isLoading: false,
        addressModel: address,
        errorOnRequest: false,
      );

  factory SearchState.error() => const SearchState(
        isLoading: false,
        addressModel: null,
        errorOnRequest: true,
      );

  final bool isLoading;
  final AddressModel? addressModel;
  final bool errorOnRequest;

  @override
  List<Object?> get props => [
        isLoading,
        addressModel,
        errorOnRequest,
      ];
}
