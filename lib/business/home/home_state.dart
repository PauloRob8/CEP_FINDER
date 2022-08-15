import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    required this.isLoading,
    required this.searchedCeps,
    required this.savedCounter,
  });

  factory HomeState.isLoading() => const HomeState(
        isLoading: true,
        searchedCeps: 0,
        savedCounter: 0,
      );

  factory HomeState.fetchedData({
    required int searchedCeps,
    required int savedCounter,
  }) =>
      HomeState(
        isLoading: false,
        searchedCeps: searchedCeps,
        savedCounter: savedCounter,
      );

  final bool isLoading;
  final int searchedCeps;
  final int savedCounter;

  @override
  List<Object?> get props => [
        isLoading,
        searchedCeps,
        savedCounter,
      ];
}
