import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_event.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_state.dart';
import 'package:flutter_sample_sutra/repository/hardcord_event_list_reopository.dart';

class EventListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventListBloc = EventListBloc(
      eventListRepository: HardcordEventListRepository(),
    );
    eventListBloc.dispatch(EventListLoad());

    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: BlocBuilder<EventListBloc, EventListState>(
        bloc: eventListBloc,
        builder: (context, state) {
          if (state is EventListInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container();
        },
      ),
    );
  }
}
