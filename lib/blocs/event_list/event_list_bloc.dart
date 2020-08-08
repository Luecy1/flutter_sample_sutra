import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_event.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_repository.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_state.dart';

class EventListBloc extends Bloc<EventListEvent, EventListState> {
  final EventListRepository _eventListRepository;

  EventListBloc({@required EventListRepository eventListRepository})
      : assert(eventListRepository != null),
        _eventListRepository = eventListRepository;

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
    await Future.delayed(new Duration(seconds: 3));
    yield EventListSuccess(eventList: _eventListRepository.fetch());
  }
}
