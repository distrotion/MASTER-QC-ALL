import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class INPROCESSMASTERdropdown_Event {}

class INPROCESSMASTERdropdown_MASTER extends INPROCESSMASTERdropdown_Event {}

class INPROCESSMASTERdropdown_Bloc
    extends Bloc<INPROCESSMASTERdropdown_Event, DROPDOWNset> {
  INPROCESSMASTERdropdown_Bloc()
      : super(DROPDOWNset(
          TYPEdd: [],
          ITEMSdd: [],
          METHODdd: [],
          RESULTFORMAT: [],
          GRAPHTYPE: [],
          INSTRUMENTS: [],
          CALCULATE: [],
          UNIT: [],
        )) {
    on<INPROCESSMASTERdropdown_MASTER>((event, emit) {
      return _INPROCESSMASTERdropdown_MASTER(
          DROPDOWNset(
            TYPEdd: [],
            ITEMSdd: [],
            METHODdd: [],
            RESULTFORMAT: [],
            GRAPHTYPE: [],
            INSTRUMENTS: [],
            CALCULATE: [],
            UNIT: [],
          ),
          emit);
    });
  }
  Future<void> _INPROCESSMASTERdropdown_MASTER(
      DROPDOWNset toAdd, Emitter<DROPDOWNset> emit) async {
    DROPDOWNset output = DROPDOWNset(
      TYPEdd: [const MapEntry("", "")],
      ITEMSdd: [const MapEntry("", "")],
      METHODdd: [const MapEntry("", "")],
      RESULTFORMAT: [const MapEntry("", "")],
      GRAPHTYPE: [const MapEntry("", "")],
      INSTRUMENTS: [const MapEntry("", "")],
      CALCULATE: [const MapEntry("", "")],
      UNIT: [const MapEntry("", "")],
    );
    //------------------------------------------------------------------------
    final response = await Dio().post(
      serverGB + "DROPDOWN_MASTER_INPROCESS",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      if (databuff['TYPE'] != null) {
        for (int i = 0; i < databuff['TYPE'].length; i++) {
          output.TYPEdd.add(MapEntry(databuff['TYPE'][i]['TYPE'].toString(),
              databuff['TYPE'][i]['masterID'].toString()));
        }
      }
      if (databuff['ITEMS'] != null) {
        for (int i = 0; i < databuff['ITEMS'].length; i++) {
          output.ITEMSdd.add(MapEntry(databuff['ITEMS'][i]['ITEMs'].toString(),
              databuff['ITEMS'][i]['masterID'].toString()));
        }
      }
      if (databuff['METHOD'] != null) {
        for (int i = 0; i < databuff['METHOD'].length; i++) {
          output.METHODdd.add(MapEntry(
              databuff['METHOD'][i]['METHOD'].toString(),
              databuff['METHOD'][i]['masterID'].toString()));
        }
      }
      if (databuff['RESULTFORMAT'] != null) {
        for (int i = 0; i < databuff['RESULTFORMAT'].length; i++) {
          output.RESULTFORMAT.add(MapEntry(
              databuff['RESULTFORMAT'][i]['RESULTFORMAT'].toString(),
              databuff['RESULTFORMAT'][i]['RESULTFORMAT'].toString()));
        }
      }
      if (databuff['GRAPHTYPE'] != null) {
        for (int i = 0; i < databuff['GRAPHTYPE'].length; i++) {
          output.GRAPHTYPE.add(MapEntry(
              databuff['GRAPHTYPE'][i]['GRAPHTYPE'].toString(),
              databuff['GRAPHTYPE'][i]['GRAPHTYPE'].toString()));
        }
      }
      if (databuff['INSTRUMENTS'] != null) {
        for (int i = 0; i < databuff['INSTRUMENTS'].length; i++) {
          output.INSTRUMENTS.add(MapEntry(
              databuff['INSTRUMENTS'][i]['INSTRUMENTS'].toString(),
              databuff['INSTRUMENTS'][i]['INSTRUMENTS'].toString()));
        }
      }
      if (databuff['CALCULATE'] != null) {
        for (int i = 0; i < databuff['CALCULATE'].length; i++) {
          output.CALCULATE.add(MapEntry(
              databuff['CALCULATE'][i]['CALCULATE'].toString(),
              databuff['CALCULATE'][i]['masterID'].toString()));
        }
      }

      if (databuff['UNIT'] != null) {
        for (int i = 0; i < databuff['UNIT'].length; i++) {
          output.UNIT.add(MapEntry(databuff['UNIT'][i]['UNIT'].toString(),
              databuff['UNIT'][i]['masterID'].toString()));
        }
      }
    } else {
      //
    }
    emit(output);
  }
}

class DROPDOWNset {
  DROPDOWNset({
    required this.TYPEdd,
    required this.ITEMSdd,
    required this.METHODdd,
    required this.RESULTFORMAT,
    required this.GRAPHTYPE,
    required this.INSTRUMENTS,
    required this.CALCULATE,
    required this.UNIT,
  });
  List<MapEntry<String, String>> TYPEdd = [];
  List<MapEntry<String, String>> ITEMSdd = [];
  List<MapEntry<String, String>> METHODdd = [];
  List<MapEntry<String, String>> RESULTFORMAT = [];
  List<MapEntry<String, String>> GRAPHTYPE = [];
  List<MapEntry<String, String>> INSTRUMENTS = [];
  List<MapEntry<String, String>> CALCULATE = [];
  List<MapEntry<String, String>> UNIT = [];
}

//GRAPHTYPE
