part of 'tabmanager_bloc.dart';

class TabmanagerState extends Equatable {
  final int index;
  const TabmanagerState(this.index);

  @override
  List<Object> get props => [index];
}
