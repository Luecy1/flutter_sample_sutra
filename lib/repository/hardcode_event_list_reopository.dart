import 'package:flutter_sample_sutra/blocs/event_list/event_list_repository.dart';
import 'package:flutter_sample_sutra/models/event.dart';

class HardcodeEventListRepository extends EventListRepository {
  @override
  Stream<List<Event>> fetch() async* {
    yield [
      Event(
          id: "1",
          title: "title",
          description: "description",
          date: DateTime.utc(2019),
          imageUrl:
              "https://3.bp.blogspot.com/-QmxPy7p1XVw/XJB42QIYOBI/AAAAAAABR6Y/Zy8ODGZ3nEkPX1xlPSnlTegogSTA55jPwCLcBGAs/s800/family_kaigo_oya_yobiyoseru.png"),
      Event(
          id: "2",
          title: "title2",
          description: "description2",
          date: DateTime.utc(2020, 1, 1),
          imageUrl:
              "https://1.bp.blogspot.com/-TRJ9TaV1MXY/XobTQGJIm_I/AAAAAAABYGk/bQ35ANv_A5UKsUhBZw4RCjMkI_AVqFWhQCNcBGAsYHQ/s1600/nagagutsu02_white.png"),
      Event(
        id: "3",
        title: "title",
        description: "description",
        date: DateTime.now(),
        imageUrl:
            "https://1.bp.blogspot.com/-1GNZtX4D-1k/UYOsrT-tZRI/AAAAAAAARKw/B95i7vBk7NQ/s600/umibiraki.png",
      ),
      Event(
        id: "4",
        title: "title",
        description: "description",
        date: DateTime.now(),
        imageUrl:
            "https://3.bp.blogspot.com/-iWLkTXQ1IaA/V2FVFt-5UTI/AAAAAAAA7dE/D6U1H8dMUp4msGUXh7CBXcbtzF0ik2nngCLcB/s800/tv_timekeeper.png",
      ),
    ];
  }
}
