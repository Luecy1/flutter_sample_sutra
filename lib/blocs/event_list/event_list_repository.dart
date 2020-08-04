import 'package:flutter_sample_sutra/models/event.dart';

abstract class EventListRepository {
  Stream<List<Event>> fetch();
}