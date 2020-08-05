import 'package:equatable/equatable.dart';
import 'package:flutter_sample_sutra/models/event.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EventListState extends Equatable {
  EventListState([List props = const []]) : super(props);
}

class EventListEmpty extends EventListState {
  @override
  String toString() => 'EventListEmpty';
}

class EventListInProgress extends EventListState {
  @override
  String toString() => 'EventListInProgress';
}

class EventListSuccess extends EventListState {
  final Stream<List<Event>> eventList;

  EventListSuccess({@required this.eventList})
      : assert(eventList != null),
        super([eventList]);

  @override
  String toString() => 'EventListSuccess';
}
