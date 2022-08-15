import 'package:cep_finder/data/address_model.dart';
import 'package:equatable/equatable.dart';

enum ErrorType {
  none,
  requestError,
  alreadyAdded,
  errorOnAdd,
}

class SearchState extends Equatable {
  const SearchState({
    required this.isLoading,
    required this.addressModel,
    required this.addedToFavorites,
    required this.error,
  });

  factory SearchState.initial() => const SearchState(
        isLoading: false,
        addressModel: null,
        addedToFavorites: false,
        error: ErrorType.none,
      );

  factory SearchState.isLoading() => const SearchState(
        isLoading: true,
        addressModel: null,
        addedToFavorites: false,
        error: ErrorType.none,
      );

  factory SearchState.fetchedData({
    required AddressModel address,
  }) =>
      SearchState(
        isLoading: false,
        addressModel: address,
        addedToFavorites: false,
        error: ErrorType.none,
      );

  factory SearchState.addedToFavorites() => const SearchState(
        isLoading: false,
        addressModel: null,
        addedToFavorites: true,
        error: ErrorType.none,
      );

  factory SearchState.error({
    required ErrorType error,
  }) =>
      SearchState(
        isLoading: false,
        addressModel: null,
        addedToFavorites: false,
        error: error,
      );

  final bool isLoading;
  final AddressModel? addressModel;
  final bool addedToFavorites;
  final ErrorType error;

  @override
  List<Object?> get props => [
        isLoading,
        addressModel,
        addedToFavorites,
        error,
      ];
}
