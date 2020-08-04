import 'package:flutter_sample_sutra/blocs/event_list/event_list_repository.dart';
import 'package:flutter_sample_sutra/models/event.dart';

class HardcordEventListRepository extends EventListRepository {
  @override
  Stream<List<Event>> fetch() async* {
    yield  [
      Event(id: "1",
      title: "title",
      description: "description",
      date:  DateTime.utc(2019),
      imageUrl: "")
    ]
  }

}