import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class GRAPHlistGET_Event {}

class GRAPHlistGET_MATCP extends GRAPHlistGET_Event {}

class GRAPHlistGET_flush extends GRAPHlistGET_Event {}

class GRAPHlistGET_Bloc extends Bloc<GRAPHlistGET_Event, List<GRAPHlistClass>> {
  GRAPHlistGET_Bloc() : super([]) {
    on<GRAPHlistGET_MATCP>((event, emit) {
      return _GRAPHlistGET_MATCP([], emit);
    });
    on<GRAPHlistGET_flush>((event, emit) {
      return _GRAPHlistGET_flush([], emit);
    });
  }
  Future<void> _GRAPHlistGET_MATCP(
      List<GRAPHlistClass> toAdd, Emitter<List<GRAPHlistClass>> emit) async {
    List<GRAPHlistClass> output = [];
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "graph_list",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(GRAPHlistClass(
          NAME: databuff[i]['NO'] != null ? databuff[i]['NO'].toString() : '',
          GT01:
              databuff[i]['GT01'] != null ? databuff[i]['GT01'].toString() : '',
          GT02:
              databuff[i]['GT02'] != null ? databuff[i]['GT02'].toString() : '',
          GT03:
              databuff[i]['GT03'] != null ? databuff[i]['GT03'].toString() : '',
          GT04:
              databuff[i]['GT04'] != null ? databuff[i]['GT04'].toString() : '',
          GT05:
              databuff[i]['GT05'] != null ? databuff[i]['GT05'].toString() : '',
          GT06:
              databuff[i]['GT06'] != null ? databuff[i]['GT06'].toString() : '',
          GT07:
              databuff[i]['GT07'] != null ? databuff[i]['GT07'].toString() : '',
          GT08:
              databuff[i]['GT08'] != null ? databuff[i]['GT08'].toString() : '',
          GT09:
              databuff[i]['GT09'] != null ? databuff[i]['GT09'].toString() : '',
          GT10:
              databuff[i]['GT10'] != null ? databuff[i]['GT10'].toString() : '',
          GT11:
              databuff[i]['GT11'] != null ? databuff[i]['GT11'].toString() : '',
          GT12:
              databuff[i]['GT12'] != null ? databuff[i]['GT12'].toString() : '',
          GT13:
              databuff[i]['GT13'] != null ? databuff[i]['GT13'].toString() : '',
          GT14:
              databuff[i]['GT14'] != null ? databuff[i]['GT14'].toString() : '',
          GT15:
              databuff[i]['GT15'] != null ? databuff[i]['GT15'].toString() : '',
          GT16:
              databuff[i]['GT16'] != null ? databuff[i]['GT16'].toString() : '',
          GT17:
              databuff[i]['GT17'] != null ? databuff[i]['GT17'].toString() : '',
          GT18:
              databuff[i]['GT18'] != null ? databuff[i]['GT18'].toString() : '',
          GT19:
              databuff[i]['GT19'] != null ? databuff[i]['GT19'].toString() : '',
          GT20:
              databuff[i]['GT20'] != null ? databuff[i]['GT20'].toString() : '',
        ));
      }
    }

    emit(output);
  }

  Future<void> _GRAPHlistGET_flush(
      List<GRAPHlistClass> toAdd, Emitter<List<GRAPHlistClass>> emit) async {
    List<GRAPHlistClass> output = [];
    emit(output);
  }
}

class GRAPHlistClass {
  GRAPHlistClass({
    this.NAME = '',
    this.GT01 = '',
    this.GT02 = '',
    this.GT03 = '',
    this.GT04 = '',
    this.GT05 = '',
    this.GT06 = '',
    this.GT07 = '',
    this.GT08 = '',
    this.GT09 = '',
    this.GT10 = '',
    this.GT11 = '',
    this.GT12 = '',
    this.GT13 = '',
    this.GT14 = '',
    this.GT15 = '',
    this.GT16 = '',
    this.GT17 = '',
    this.GT18 = '',
    this.GT19 = '',
    this.GT20 = '',
  });
  String NAME;
  String GT01;
  String GT02;
  String GT03;
  String GT04;
  String GT05;
  String GT06;
  String GT07;
  String GT08;
  String GT09;
  String GT10;

  String GT11;
  String GT12;
  String GT13;
  String GT14;
  String GT15;
  String GT16;
  String GT17;
  String GT18;
  String GT19;
  String GT20;
}
