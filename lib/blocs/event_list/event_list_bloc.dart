import 'package:bloc/bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_event.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  @override
  EventListState get initialState => EventListEmpty();

  @override
  Stream<EventListState> mapEventToState(EventListEvent event) async* {
    if (event is EventListLoad) {
      yield* _mapEventListToState();
    }
  }

  Stream<EventListState> _mapEventListToState() async* {
    yield EventListInProgress();
  }
}
