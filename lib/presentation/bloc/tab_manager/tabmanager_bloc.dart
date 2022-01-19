import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabmanager_event.dart';
part 'tabmanager_state.dart';

class TabManagerBloc extends Bloc<TabmanagerEvent, TabmanagerState> {
  TabManagerBloc() : super(TabmanagerState(0)) {
    on<TabmanagerEvent>((event, emit) => emit(TabmanagerState(event.index)));
  }
}
