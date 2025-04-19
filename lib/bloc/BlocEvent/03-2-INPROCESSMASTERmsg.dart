import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/03INPROCESS/INPROCESSMASTERmain.dart';
import '../../page/03INPROCESS/INPROCESSMASTERvar.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/01TYPES.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/02UNIT.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/03ITEMs.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/04MACHINENAME.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/05METHODE.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/06SPECIALSPEC.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/07CALCULATE.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/08COMMENT.dart';
import '../../page/03INPROCESS/subINPROCESSMASTER/10CALCULATECON.dart';

import '03-1-INPROCESSMASTERget.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_TYPE_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_UNIT_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_ITEMS_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_MACHINENAME_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_METHODE_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_SPECIFICATION_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_CALCULATE_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_COMMENT_DROP extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_CALCULATECON_DROP extends INPROCESSMASTERmsg_Event {}

//----------------------------------------------------------------

class INPROCESSMASTERmsg_TYPE_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_UNIT_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_ITEMS_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_MACHINENAME_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_METHODE_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_SPECIFICATION_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_CALCULATE_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_COMMENT_EDIT extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_CALCULATECON_EDIT extends INPROCESSMASTERmsg_Event {}

//------------------------------------------------------------------

class INPROCESSMASTERmsg_FULSH extends INPROCESSMASTERmsg_Event {}

class INPROCESSMASTERmsg_Bloc extends Bloc<INPROCESSMASTERmsg_Event, String> {
  INPROCESSMASTERmsg_Bloc() : super('') {
    on<INPROCESSMASTERmsg_TYPE_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_TYPE_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_UNIT_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_UNIT_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_ITEMS_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_ITEMS_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_MACHINENAME_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_MACHINENAME_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_METHODE_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_METHODE_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_SPECIFICATION_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_SPECIFICATION_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_CALCULATE_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_CALCULATE_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_COMMENT_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_COMMENT_DROP('', emit);
    });

    on<INPROCESSMASTERmsg_CALCULATECON_DROP>((event, emit) {
      return _INPROCESSMASTERmsg_CALCULATECON_DROP('', emit);
    });
    //----------------------------------------------

    on<INPROCESSMASTERmsg_TYPE_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_TYPE_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_UNIT_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_UNIT_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_ITEMS_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_ITEMS_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_MACHINENAME_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_MACHINENAME_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_METHODE_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_METHODE_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_SPECIFICATION_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_SPECIFICATION_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_CALCULATE_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_CALCULATE_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_COMMENT_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_COMMENT_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_CALCULATECON_EDIT>((event, emit) {
      return _INPROCESSMASTERmsg_CALCULATECON_EDIT('', emit);
    });

    on<INPROCESSMASTERmsg_FULSH>((event, emit) {
      return _INPROCESSMASTERmsg_FULSH('', emit);
    });
  }

  Future<void> _INPROCESSMASTERmsg_TYPE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_TYPE_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_TYPE,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_TYPEget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_UNIT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_UNIT_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_UNIT,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_UNITget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_ITEMS_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_ITEMS_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_ITEMS,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_ITEMSget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_MACHINENAME_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_MACHINENAME_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_MACHINENAME,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_MACHINENAMEget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_METHODE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_METHODE_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_METHODE,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_METHODEget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_SPECIFICATION_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_SPECIFICATION_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_SPECIALSPEC,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_SPECIALSPECget());
    emit(output);
  }

  //INPROCESSMASTERmsg_CALCULATE_DROP
  Future<void> _INPROCESSMASTERmsg_CALCULATE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_CALCULATE_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_CALCULATE,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_CALCULATEget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_COMMENT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_COMMENT_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_COMMENT,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_COMMENTget());
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_CALCULATECON_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_CALCULATECON_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_CALCULATE,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_CALCULATECONget());
    emit(output);
  }

  //-------------------------------------

  Future<void> _INPROCESSMASTERmsg_TYPE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_TYPE_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_TYPE_ACTION,
        "TYPE": INPROCESSMASTERvar.TYPE_TYPE_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_TYPEget());
    Navigator.pop(TYPEStable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_UNIT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_UNIT_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_UNIT_ACTION,
        "UNIT": INPROCESSMASTERvar.UNIT_UNIT_ACTION,
        "TYPE": INPROCESSMASTERvar.TYPEid_UNIT_ACTION,
        "DESIMAL": INPROCESSMASTERvar.DESIMAL_UNIT_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_UNITget());
    Navigator.pop(UNITStable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_ITEMS_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_ITEMS_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_ITEMS_ACTION,
        "TYPE": INPROCESSMASTERvar.TYPEid_ITEMS_ACTION,
        "ITEMs": INPROCESSMASTERvar.ITEMS_ITEMS_ACTION,
        "RESULTFORMAT": INPROCESSMASTERvar.RESULTFORMAT_ITEMS_ACTION,
        "GRAPHTYPE": INPROCESSMASTERvar.GRAPHTYPE_ITEMS_ACTION,
        "GRAPHINTERSECTION": INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
        "CALCULATE": INPROCESSMASTERvar.CALCULATE_ITEMS_ACTION,
        "DOCUMENTS": INPROCESSMASTERvar.DOCUMENTS_ITEMS_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_ITEMSget());
    Navigator.pop(ITEMStable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_MACHINENAME_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_MACHINENAME_INPROCESS",
      data: {
        "METHOD": INPROCESSMASTERvar.METHOD_MACHINENAME_ACTION,
        "DESIMAL": INPROCESSMASTERvar.DESIMAL_MACHINENAME_ACTION,
        "masterID": INPROCESSMASTERvar.masterID_MACHINENAME_ACTION,
        "MACHINE": INPROCESSMASTERvar.MACHINElist_MACHINENAME_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_MACHINENAMEget());
    Navigator.pop(MACHINENAMEtable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_METHODE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_METHODE_INPROCESS",
      data: {
        "ITEMs": INPROCESSMASTERvar.ITEM_METHOD_ACTION,
        "METHOD": INPROCESSMASTERvar.METHOD_METHOD_ACTION,
        "DOCUMENTSM": INPROCESSMASTERvar.DOCUMENT_METHOD_ACTION,
        "masterID": INPROCESSMASTERvar.masterID_METHOD_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_METHODEget());
    Navigator.pop(METHODtable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_SPECIFICATION_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_SPECIFICATION_INPROCESS",
      data: {
        "ITEMs": INPROCESSMASTERvar.ITEM_SPECIALSPEC_ACTION,
        "SPECIFICATION": INPROCESSMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION,
        "masterID": INPROCESSMASTERvar.masterID_SPECIALSPEC_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_SPECIALSPECget());
    Navigator.pop(SPECIALSPECtable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_CALCULATE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_CALCULATE_INPROCESS",
      data: {
        "CALCULATE": INPROCESSMASTERvar.CALCULATE_CALCULATE_ACTION,
        "FORMULA": INPROCESSMASTERvar.FORMULA_CALCULATE_ACTION,
        "X": INPROCESSMASTERvar.X_CALCULATE_ACTION,
        "Xb": INPROCESSMASTERvar.Xb_CALCULATE_ACTION,
        "Y": INPROCESSMASTERvar.Y_CALCULATE_ACTION,
        "Yb": INPROCESSMASTERvar.Yb_CALCULATE_ACTION,
        "Z": INPROCESSMASTERvar.Z_CALCULATE_ACTION,
        "Zb": INPROCESSMASTERvar.Zb_CALCULATE_ACTION,
        "I": INPROCESSMASTERvar.I_CALCULATE_ACTION,
        "Ib": INPROCESSMASTERvar.Ib_CALCULATE_ACTION,
        "K1": INPROCESSMASTERvar.K1_CALCULATE_ACTION,
        "K1b": INPROCESSMASTERvar.K1b_CALCULATE_ACTION,
        "K2": INPROCESSMASTERvar.K2_CALCULATE_ACTION,
        "K2b": INPROCESSMASTERvar.K2b_CALCULATE_ACTION,
        "K3": INPROCESSMASTERvar.K3_CALCULATE_ACTION,
        "K3b": INPROCESSMASTERvar.K3b_CALCULATE_ACTION,
        "masterID": INPROCESSMASTERvar.masterID_CALCULATE_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_CALCULATEget());
    Navigator.pop(CALCULATEtable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_COMMENT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_COMMENT_INPROCESS",
      data: {
        "masterID": INPROCESSMASTERvar.masterID_COMMENT_ACTION,
        "COMMENT": INPROCESSMASTERvar.COMMENT_COMMENT_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_COMMENTget());
    Navigator.pop(COMMENTtable_IPContext);
    emit(output);
  }

  Future<void> _INPROCESSMASTERmsg_CALCULATECON_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_CALCULATECON_INPROCESS",
      data: {
        "CALCULATE": INPROCESSMASTERvar.CALCULATECON_CALCULATECON_ACTION,
        "FORMULA": INPROCESSMASTERvar.FORMULA_CALCULATECON_ACTION,
        "X": INPROCESSMASTERvar.X_CALCULATECON_ACTION,
        "Xb": INPROCESSMASTERvar.Xb_CALCULATECON_ACTION,
        "Y": INPROCESSMASTERvar.Y_CALCULATECON_ACTION,
        "Yb": INPROCESSMASTERvar.Yb_CALCULATECON_ACTION,
        "Z": INPROCESSMASTERvar.Z_CALCULATECON_ACTION,
        "Zb": INPROCESSMASTERvar.Zb_CALCULATECON_ACTION,
        "I": INPROCESSMASTERvar.I_CALCULATECON_ACTION,
        "Ib": INPROCESSMASTERvar.Ib_CALCULATECON_ACTION,
        "K1": INPROCESSMASTERvar.K1_CALCULATECON_ACTION,
        "K1b": INPROCESSMASTERvar.K1b_CALCULATECON_ACTION,
        "K2": INPROCESSMASTERvar.K2_CALCULATECON_ACTION,
        "K2b": INPROCESSMASTERvar.K2b_CALCULATECON_ACTION,
        "K3": INPROCESSMASTERvar.K3_CALCULATECON_ACTION,
        "K3b": INPROCESSMASTERvar.K3b_CALCULATECON_ACTION,
        "masterID": INPROCESSMASTERvar.masterID_CALCULATECON_ACTION,
      },
    );
    INPROCESSMASTERmainCONTEXT.read<INPROCESSMASTER_Bloc>()
        .add(INPROCESSMASTER_CALCULATECONget());
    Navigator.pop(CALCULATECONtable_IPContext);
    emit(output);
  }

  //

  Future<void> _INPROCESSMASTERmsg_FULSH(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    emit(output);
  }
}
