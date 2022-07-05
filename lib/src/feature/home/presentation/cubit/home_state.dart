part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.currentPageIndex);
  final int currentPageIndex;

  @override
  List<Object> get props => [
        currentPageIndex,
  ];
}

class HomeInitial extends HomeState {
  const HomeInitial({int currentPageIndex = 0}) : super(currentPageIndex);
}
