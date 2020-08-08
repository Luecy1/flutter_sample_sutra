import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_bloc.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_event.dart';
import 'package:flutter_sample_sutra/blocs/event_list/event_list_state.dart';
import 'package:flutter_sample_sutra/models/event.dart';
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

          if (state is EventListSuccess) {
            return StreamBuilder(
              stream: state.eventList,
              builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemBuilder: (context, index) {
                    final event = snapshot.data[index];
                    return Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ListTile(
                            title: Text(
                              event.title,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(event.date.toIso8601String()),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Image.network(
                                  event.imageUrl,
                                  fit: BoxFit.none,
                                  height: 300,
                                ),
                              )
                            ],
                          ),
                          Text(event.description)
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                );
              },
            );
          }

          if (state is EventListFailure) {
            return Center(
              child: Text('Failure'),
            );
          }

          return Container();
        },
      ),
    );
  }
}
