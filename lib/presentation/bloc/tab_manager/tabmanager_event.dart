part of 'tabmanager_bloc.dart';

class TabmanagerEvent extends Equatable {
  final int index;
  const TabmanagerEvent({this.index = 0});

  @override
  List<Object> get props => [index];
}
