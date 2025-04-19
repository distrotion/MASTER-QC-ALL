import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class SIGNATURESGET_Event {}

class SIGNATURESGET_MATCP extends SIGNATURESGET_Event {}

class SIGNATURESGET_flush extends SIGNATURESGET_Event {}

class SIGNATURESGET_Bloc extends Bloc<SIGNATURESGET_Event, SIGNATURESClass> {
  SIGNATURESGET_Bloc() : super(SIGNATURESClass()) {
    on<SIGNATURESGET_MATCP>((event, emit) {
      return _SIGNATURESGET_MATCP(SIGNATURESClass(), emit);
    });
    on<SIGNATURESGET_flush>((event, emit) {
      return _SIGNATURESGET_flush(SIGNATURESClass(), emit);
    });
  }
  Future<void> _SIGNATURESGET_MATCP(
      SIGNATURESClass toAdd, Emitter<SIGNATURESClass> emit) async {
    SIGNATURESClass output = SIGNATURESClass();
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "SIGNATURE_GET",
      data: {"ID": USERDATA.ID},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      if (databuff['SIGNATURE'] != null) {
        output.SIGNATURE = databuff['SIGNATURE'].toString();
      }

      // print(databuff);
    }

    emit(output);
  }

  Future<void> _SIGNATURESGET_flush(
      SIGNATURESClass toAdd, Emitter<SIGNATURESClass> emit) async {
    SIGNATURESClass output = SIGNATURESClass();
    emit(output);
  }
}

class SIGNATURESClass {
  SIGNATURESClass({
    this.SIGNATURE = '',
  });
  String SIGNATURE;
}
