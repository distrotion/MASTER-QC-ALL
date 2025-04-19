import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class INCOMMINGMASTERdropdown_Event {}

class INCOMMINGMASTERdropdown_MASTER extends INCOMMINGMASTERdropdown_Event {}

class INCOMMINGMASTERdropdown_Bloc
    extends Bloc<INCOMMINGMASTERdropdown_Event, DROPDOWNset> {
  INCOMMINGMASTERdropdown_Bloc()
      : super(DROPDOWNset(
          TYPEdd: [],
          ITEMSdd: [],
          METHODdd: [],
          RESULTFORMAT: [],
          GRAPHTYPE: [],
          INSTRUMENTS: [],
          CALCULATE: [],
        )) {
    on<INCOMMINGMASTERdropdown_MASTER>((event, emit) {
      return _INCOMMINGMASTERdropdown_MASTER(
          DROPDOWNset(
            TYPEdd: [],
            ITEMSdd: [],
            METHODdd: [],
            RESULTFORMAT: [],
            GRAPHTYPE: [],
            INSTRUMENTS: [],
            CALCULATE: [],
          ),
          emit);
    });
  }
  Future<void> _INCOMMINGMASTERdropdown_MASTER(
      DROPDOWNset toAdd, Emitter<DROPDOWNset> emit) async {
    DROPDOWNset output = DROPDOWNset(
      TYPEdd: [const MapEntry("", "")],
      ITEMSdd: [const MapEntry("", "")],
      METHODdd: [const MapEntry("", "")],
      RESULTFORMAT: [const MapEntry("", "")],
      GRAPHTYPE: [const MapEntry("", "")],
      INSTRUMENTS: [const MapEntry("", "")],
      CALCULATE: [const MapEntry("", "")],
    );
    //------------------------------------------------------------------------
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROPDOWN_MASTER_INCOMMING",
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
  });
  List<MapEntry<String, String>> TYPEdd = [];
  List<MapEntry<String, String>> ITEMSdd = [];
  List<MapEntry<String, String>> METHODdd = [];
  List<MapEntry<String, String>> RESULTFORMAT = [];
  List<MapEntry<String, String>> GRAPHTYPE = [];
  List<MapEntry<String, String>> INSTRUMENTS = [];
  List<MapEntry<String, String>> CALCULATE = [];
}

//GRAPHTYPE
