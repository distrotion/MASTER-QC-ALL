import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

// String serverGB = serverGBGB;

abstract class MATCPlistGET_Event {}

class MATCPlistGET_MATCP extends MATCPlistGET_Event {}

class MATCPlistGET_flush extends MATCPlistGET_Event {}

class MATCPlistGET_Bloc extends Bloc<MATCPlistGET_Event, List<MATCPlistClass>> {
  MATCPlistGET_Bloc() : super([]) {
    on<MATCPlistGET_MATCP>((event, emit) {
      return _MATCPlistGET_MATCP([], emit);
    });
    on<MATCPlistGET_flush>((event, emit) {
      return _MATCPlistGET_flush([], emit);
    });
  }
  Future<void> _MATCPlistGET_MATCP(
      List<MATCPlistClass> toAdd, Emitter<List<MATCPlistClass>> emit) async {
    List<MATCPlistClass> output = [];
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "GET_MATCPLIST",
      data: {},
    );

    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
      // print(databuff);
      for (int i = 0; i < databuff.length; i++) {
        output.add(MATCPlistClass(
          CP: databuff[i]['CP'] != null ? databuff[i]['CP'].toString() : '',
          FG: databuff[i]['FG'] != null ? databuff[i]['FG'].toString() : '',
          CUSTOMER: databuff[i]['CUSTOMER'] != null
              ? databuff[i]['CUSTOMER'].toString()
              : '',
          PART:
              databuff[i]['PART'] != null ? databuff[i]['PART'].toString() : '',
          PARTNAME: databuff[i]['PARTNAME'] != null
              ? databuff[i]['PARTNAME'].toString()
              : '',
          MATERIAL: databuff[i]['MATERIAL'] != null
              ? databuff[i]['MATERIAL'].toString()
              : '',
          CUST_FULLNM: databuff[i]['CUST_FULLNM'] != null
              ? databuff[i]['CUST_FULLNM'].toString()
              : '',
          STATUS: databuff[i]['STATUS'] != null
              ? databuff[i]['STATUS'].toString()
              : '',
        ));
      }
    }

    emit(output);
  }

  Future<void> _MATCPlistGET_flush(
      List<MATCPlistClass> toAdd, Emitter<List<MATCPlistClass>> emit) async {
    List<MATCPlistClass> output = [];
    emit(output);
  }
}

class MATCPlistClass {
  MATCPlistClass({
    this.CP = '',
    this.FG = '',
    this.CUSTOMER = '',
    this.PART = '',
    this.PARTNAME = '',
    this.MATERIAL = '',
    this.CUST_FULLNM = '',
    this.STATUS = '',
  });
  String CP, FG, CUSTOMER, PART, PARTNAME, MATERIAL, CUST_FULLNM, STATUS;
}
