import 'package:cep_finder/data/address_model.dart';
import 'package:equatable/equatable.dart';

class FavoriteState extends Equatable {
  const FavoriteState({
    required this.isLoading,
    required this.addresses,
  });

  factory FavoriteState.loading() => const FavoriteState(
        isLoading: true,
        addresses: [],
      );

  factory FavoriteState.fetchedData({
    required List<AddressModel> addresses,
  }) =>
      FavoriteState(
        isLoading: false,
        addresses: addresses,
      );

  final bool isLoading;
  final List<AddressModel> addresses;

  @override
  List<Object?> get props => [
        isLoading,
        addresses,
      ];
}
