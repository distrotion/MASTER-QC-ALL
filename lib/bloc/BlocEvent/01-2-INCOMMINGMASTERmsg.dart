import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/01INCOMMINGMASTER/INCOMMINGMASTERmain.dart';
import '../../page/01INCOMMINGMASTER/INCOMMINGMASTERvar.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/01TYPES.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/02UNIT.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/03ITEMs.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/04MACHINENAME.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/05METHODE.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/06SPECIALSPEC.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/07CALCULATE.dart';
import '../../page/01INCOMMINGMASTER/subINCOMMINGMASTER/08COMMENT.dart';
import '01-1-INCOMMINGMASTERget.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_TYPE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_UNIT_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_ITEMS_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_MACHINENAME_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_METHODE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SPECIFICATION_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_CALCULATE_DROP extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_COMMENT_DROP extends INCOMMINGMASTERmsg_Event {}

//----------------------------------------------------------------

class INCOMMINGMASTERmsg_TYPE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_UNIT_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_ITEMS_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_MACHINENAME_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_METHODE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_SPECIFICATION_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_CALCULATE_EDIT extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_COMMENT_EDIT extends INCOMMINGMASTERmsg_Event {}

//------------------------------------------------------------------

class INCOMMINGMASTERmsg_FULSH extends INCOMMINGMASTERmsg_Event {}

class INCOMMINGMASTERmsg_Bloc extends Bloc<INCOMMINGMASTERmsg_Event, String> {
  INCOMMINGMASTERmsg_Bloc() : super('') {
    on<INCOMMINGMASTERmsg_TYPE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_TYPE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_UNIT_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_UNIT_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_ITEMS_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_ITEMS_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_MACHINENAME_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_MACHINENAME_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_METHODE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_METHODE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_SPECIFICATION_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_SPECIFICATION_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_CALCULATE_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_CALCULATE_DROP('', emit);
    });

    on<INCOMMINGMASTERmsg_COMMENT_DROP>((event, emit) {
      return _INCOMMINGMASTERmsg_COMMENT_DROP('', emit);
    });
    //----------------------------------------------

    on<INCOMMINGMASTERmsg_TYPE_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_TYPE_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_UNIT_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_UNIT_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_ITEMS_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_ITEMS_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_MACHINENAME_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_MACHINENAME_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_METHODE_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_METHODE_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_SPECIFICATION_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_SPECIFICATION_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_CALCULATE_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_CALCULATE_EDIT('', emit);
    });

    on<INCOMMINGMASTERmsg_COMMENT_EDIT>((event, emit) {
      return _INCOMMINGMASTERmsg_COMMENT_EDIT('', emit);
    });

    //INCOMMINGMASTERmsg_CALCULATE_EDIT

    //

    on<INCOMMINGMASTERmsg_FULSH>((event, emit) {
      return _INCOMMINGMASTERmsg_FULSH('', emit);
    });
  }

  Future<void> _INCOMMINGMASTERmsg_TYPE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_TYPE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_TYPE,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_TYPEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_UNIT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_UNIT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_UNIT,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_UNITget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_ITEMS_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_ITEMS_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_ITEMS,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_ITEMSget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_MACHINENAME_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_MACHINENAME_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_MACHINENAME,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_MACHINENAMEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_METHODE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_METHODE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_METHODE,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_METHODEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_SPECIFICATION_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_SPECIALSPECget());
    emit(output);
  }

  //INCOMMINGMASTERmsg_CALCULATE_DROP
  Future<void> _INCOMMINGMASTERmsg_CALCULATE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_CALCULATE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_CALCULATE,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_CALCULATEget());
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_COMMENT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "DROP_COMMENT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_COMMENT,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_COMMENTget());
    emit(output);
  }

  //-------------------------------------

  Future<void> _INCOMMINGMASTERmsg_TYPE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_TYPE_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_TYPE_ACTION,
        "TYPE": INCOMMINGMASTERvar.TYPE_TYPE_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_TYPEget());
    Navigator.pop(TYPEStable_INCContext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_UNIT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_UNIT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_UNIT_ACTION,
        "UNIT": INCOMMINGMASTERvar.UNIT_UNIT_ACTION,
        "TYPE": INCOMMINGMASTERvar.TYPEid_UNIT_ACTION,
        "DESIMAL": INCOMMINGMASTERvar.DESIMAL_UNIT_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_UNITget());
    Navigator.pop(UNITStable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_ITEMS_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_ITEMS_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_ITEMS_ACTION,
        "TYPE": INCOMMINGMASTERvar.TYPEid_ITEMS_ACTION,
        "ITEMs": INCOMMINGMASTERvar.ITEMS_ITEMS_ACTION,
        "RESULTFORMAT": INCOMMINGMASTERvar.RESULTFORMAT_ITEMS_ACTION,
        "GRAPHTYPE": INCOMMINGMASTERvar.GRAPHTYPE_ITEMS_ACTION,
        "GRAPHINTERSECTION": INCOMMINGMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
        "CALCULATE": INCOMMINGMASTERvar.CALCULATE_ITEMS_ACTION,
        "DOCUMENTS": INCOMMINGMASTERvar.DOCUMENTS_ITEMS_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_ITEMSget());
    Navigator.pop(ITEMStable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_MACHINENAME_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_MACHINENAME_INCOMMING",
      data: {
        "METHOD": INCOMMINGMASTERvar.METHOD_MACHINENAME_ACTION,
        "DESIMAL": INCOMMINGMASTERvar.DESIMAL_MACHINENAME_ACTION,
        "masterID": INCOMMINGMASTERvar.masterID_MACHINENAME_ACTION,
        "MACHINE": INCOMMINGMASTERvar.MACHINElist_MACHINENAME_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_MACHINENAMEget());
    Navigator.pop(MACHINENAMEtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_METHODE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_METHODE_INCOMMING",
      data: {
        "ITEMs": INCOMMINGMASTERvar.ITEM_METHOD_ACTION,
        "METHOD": INCOMMINGMASTERvar.METHOD_METHOD_ACTION,
        "DOCUMENTSM": INCOMMINGMASTERvar.DOCUMENT_METHOD_ACTION,
        "masterID": INCOMMINGMASTERvar.masterID_METHOD_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_METHODEget());
    Navigator.pop(METHODtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_SPECIFICATION_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_SPECIFICATION_INCOMMING",
      data: {
        "ITEMs": INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION,
        "SPECIFICATION": INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION,
        "masterID": INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_SPECIALSPECget());
    Navigator.pop(SPECIALSPECtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_CALCULATE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_CALCULATE_INCOMMING",
      data: {
        "CALCULATE": INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION,
        "FORMULA": INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION,
        "X": INCOMMINGMASTERvar.X_CALCULATE_ACTION,
        "Xb": INCOMMINGMASTERvar.Xb_CALCULATE_ACTION,
        "Y": INCOMMINGMASTERvar.Y_CALCULATE_ACTION,
        "Yb": INCOMMINGMASTERvar.Yb_CALCULATE_ACTION,
        "Z": INCOMMINGMASTERvar.Z_CALCULATE_ACTION,
        "Zb": INCOMMINGMASTERvar.Zb_CALCULATE_ACTION,
        "I": INCOMMINGMASTERvar.I_CALCULATE_ACTION,
        "Ib": INCOMMINGMASTERvar.Ib_CALCULATE_ACTION,
        "K1": INCOMMINGMASTERvar.K1_CALCULATE_ACTION,
        "K1b": INCOMMINGMASTERvar.K1b_CALCULATE_ACTION,
        "K2": INCOMMINGMASTERvar.K2_CALCULATE_ACTION,
        "K2b": INCOMMINGMASTERvar.K2b_CALCULATE_ACTION,
        "K3": INCOMMINGMASTERvar.K3_CALCULATE_ACTION,
        "K3b": INCOMMINGMASTERvar.K3b_CALCULATE_ACTION,
        "masterID": INCOMMINGMASTERvar.masterID_CALCULATE_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_CALCULATEget());
    Navigator.pop(CALCULATEtable_INCcontext);
    emit(output);
  }

  Future<void> _INCOMMINGMASTERmsg_COMMENT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      options: Options(
        // contentType: "application/json",

        headers: {
          "server": USERDATA.MASTER,
        },
      ),
      serverGB + "EDIT_COMMENT_INCOMMING",
      data: {
        "masterID": INCOMMINGMASTERvar.masterID_COMMENT_ACTION,
        "COMMENT": INCOMMINGMASTERvar.COMMENT_COMMENT_ACTION,
      },
    );
    INCOMMINGMASTERmainCONTEXT.read<INCOMMINGMASTER_Bloc>()
        .add(INCOMMINGMASTER_COMMENTget());
    Navigator.pop(COMMENTtable_INCContext);
    emit(output);
  }

  //

  Future<void> _INCOMMINGMASTERmsg_FULSH(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    emit(output);
  }
}
