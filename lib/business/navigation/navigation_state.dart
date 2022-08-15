import 'package:equatable/equatable.dart';

class NavigationState extends Equatable {
  const NavigationState({
    required this.currentIndex,
  });

  factory NavigationState.initial() => const NavigationState(
        currentIndex: 0,
      );

  factory NavigationState.changeIndex({
    required int index,
  }) =>
      NavigationState(
        currentIndex: index,
      );

  final int currentIndex;

  @override
  List<Object?> get props => [
        currentIndex,
      ];
}
