import 'package:equatable/equatable.dart';
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
