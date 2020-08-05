import 'package:flutter/material.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_event.dart';
import 'package:flutter_sample_sutra/repository/hardcord_event_list_reopository.dart';

class EventListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventListBloc = EventListBloc(
      eventListRepository: HardcordEventListRepository(),
    );
    eventListBloc.dispatch(EventListLoad());
    return Container();
  }
}
