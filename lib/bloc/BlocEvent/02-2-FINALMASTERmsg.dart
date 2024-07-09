import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/02FINALMASTER/FINALMASTERmain.dart';
import '../../page/02FINALMASTER/FINALMASTERvar.dart';
import '../../page/02FINALMASTER/subFINALMASTER/01TYPES.dart';
import '../../page/02FINALMASTER/subFINALMASTER/02UNIT.dart';
import '../../page/02FINALMASTER/subFINALMASTER/03ITEMs.dart';
import '../../page/02FINALMASTER/subFINALMASTER/04MACHINENAME.dart';
import '../../page/02FINALMASTER/subFINALMASTER/05METHODE.dart';
import '../../page/02FINALMASTER/subFINALMASTER/06SPECIALSPEC.dart';
import '../../page/02FINALMASTER/subFINALMASTER/07CALCULATE.dart';
import '../../page/02FINALMASTER/subFINALMASTER/08COMMENT.dart';
import '../../page/02FINALMASTER/subFINALMASTER/10CALCULATECON.dart';
import '02-1-FINALMASTERget.dart';

//-------------------------------------------------
// String serverGB = serverGBGB;

abstract class FINALMASTERmsg_Event {}

class FINALMASTERmsg_TYPE_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_UNIT_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_ITEMS_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_MACHINENAME_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_METHODE_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_SPECIFICATION_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_CALCULATE_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_COMMENT_DROP extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_CALCULATECON_DROP extends FINALMASTERmsg_Event {}

//----------------------------------------------------------------

class FINALMASTERmsg_TYPE_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_UNIT_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_ITEMS_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_MACHINENAME_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_METHODE_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_SPECIFICATION_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_CALCULATE_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_COMMENT_EDIT extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_CALCULATECON_EDIT extends FINALMASTERmsg_Event {}

//------------------------------------------------------------------

class FINALMASTERmsg_FULSH extends FINALMASTERmsg_Event {}

class FINALMASTERmsg_Bloc extends Bloc<FINALMASTERmsg_Event, String> {
  FINALMASTERmsg_Bloc() : super('') {
    on<FINALMASTERmsg_TYPE_DROP>((event, emit) {
      return _FINALMASTERmsg_TYPE_DROP('', emit);
    });

    on<FINALMASTERmsg_UNIT_DROP>((event, emit) {
      return _FINALMASTERmsg_UNIT_DROP('', emit);
    });

    on<FINALMASTERmsg_ITEMS_DROP>((event, emit) {
      return _FINALMASTERmsg_ITEMS_DROP('', emit);
    });

    on<FINALMASTERmsg_MACHINENAME_DROP>((event, emit) {
      return _FINALMASTERmsg_MACHINENAME_DROP('', emit);
    });

    on<FINALMASTERmsg_METHODE_DROP>((event, emit) {
      return _FINALMASTERmsg_METHODE_DROP('', emit);
    });

    on<FINALMASTERmsg_SPECIFICATION_DROP>((event, emit) {
      return _FINALMASTERmsg_SPECIFICATION_DROP('', emit);
    });

    on<FINALMASTERmsg_CALCULATE_DROP>((event, emit) {
      return _FINALMASTERmsg_CALCULATE_DROP('', emit);
    });

    on<FINALMASTERmsg_COMMENT_DROP>((event, emit) {
      return _FINALMASTERmsg_COMMENT_DROP('', emit);
    });

    on<FINALMASTERmsg_CALCULATECON_DROP>((event, emit) {
      return _FINALMASTERmsg_CALCULATECON_DROP('', emit);
    });
    //----------------------------------------------

    on<FINALMASTERmsg_TYPE_EDIT>((event, emit) {
      return _FINALMASTERmsg_TYPE_EDIT('', emit);
    });

    on<FINALMASTERmsg_UNIT_EDIT>((event, emit) {
      return _FINALMASTERmsg_UNIT_EDIT('', emit);
    });

    on<FINALMASTERmsg_ITEMS_EDIT>((event, emit) {
      return _FINALMASTERmsg_ITEMS_EDIT('', emit);
    });

    on<FINALMASTERmsg_MACHINENAME_EDIT>((event, emit) {
      return _FINALMASTERmsg_MACHINENAME_EDIT('', emit);
    });

    on<FINALMASTERmsg_METHODE_EDIT>((event, emit) {
      return _FINALMASTERmsg_METHODE_EDIT('', emit);
    });

    on<FINALMASTERmsg_SPECIFICATION_EDIT>((event, emit) {
      return _FINALMASTERmsg_SPECIFICATION_EDIT('', emit);
    });

    on<FINALMASTERmsg_CALCULATE_EDIT>((event, emit) {
      return _FINALMASTERmsg_CALCULATE_EDIT('', emit);
    });

    on<FINALMASTERmsg_COMMENT_EDIT>((event, emit) {
      return _FINALMASTERmsg_COMMENT_EDIT('', emit);
    });

    on<FINALMASTERmsg_CALCULATECON_EDIT>((event, emit) {
      return _FINALMASTERmsg_CALCULATECON_EDIT('', emit);
    });

    on<FINALMASTERmsg_FULSH>((event, emit) {
      return _FINALMASTERmsg_FULSH('', emit);
    });
  }

  Future<void> _FINALMASTERmsg_TYPE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      serverGB + "DROP_TYPE_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_TYPE,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_UNIT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_UNIT_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_UNIT,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_ITEMS_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_ITEMS_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_ITEMS,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_MACHINENAME_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_MACHINENAME_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_MACHINENAME,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_MACHINENAMEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_METHODE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_METHODE_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_METHODE,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_METHODEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_SPECIFICATION_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_SPECIFICATION_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_SPECIALSPEC,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_SPECIALSPECget());
    emit(output);
  }

  //FINALMASTERmsg_CALCULATE_DROP
  Future<void> _FINALMASTERmsg_CALCULATE_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_CALCULATE_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_CALCULATE,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_CALCULATEget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_COMMENT_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      serverGB + "DROP_COMMENT_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_COMMENT,
      },
    );
    if (response.statusCode == 200) {
      // var databuff = jsonDecode(response.body);
      var databuff = response.data;
    } else {
      //
    }
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_COMMENTget());
    emit(output);
  }

  Future<void> _FINALMASTERmsg_CALCULATECON_DROP(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "DROP_CALCULATECON_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_CALCULATE,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_CALCULATECONget());
    emit(output);
  }

  //-------------------------------------

  Future<void> _FINALMASTERmsg_TYPE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_TYPE_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_TYPE_ACTION,
        "TYPE": FINALMASTERvar.TYPE_TYPE_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
    Navigator.pop(TYPEStableContext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_UNIT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_UNIT_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_UNIT_ACTION,
        "UNIT": FINALMASTERvar.UNIT_UNIT_ACTION,
        "TYPE": FINALMASTERvar.TYPEid_UNIT_ACTION,
        "DESIMAL": FINALMASTERvar.DESIMAL_UNIT_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());
    Navigator.pop(UNITStablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_ITEMS_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_ITEMS_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_ITEMS_ACTION,
        "TYPE": FINALMASTERvar.TYPEid_ITEMS_ACTION,
        "ITEMs": FINALMASTERvar.ITEMS_ITEMS_ACTION,
        "RESULTFORMAT": FINALMASTERvar.RESULTFORMAT_ITEMS_ACTION,
        "GRAPHTYPE": FINALMASTERvar.GRAPHTYPE_ITEMS_ACTION,
        "GRAPHINTERSECTION": FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
        "CALCULATE": FINALMASTERvar.CALCULATE_ITEMS_ACTION,
        "DOCUMENTS": FINALMASTERvar.DOCUMENTS_ITEMS_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
    Navigator.pop(ITEMStablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_MACHINENAME_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_MACHINENAME_FINAL",
      data: {
        "METHOD": FINALMASTERvar.METHOD_MACHINENAME_ACTION,
        "DESIMAL": FINALMASTERvar.DESIMAL_MACHINENAME_ACTION,
        "masterID": FINALMASTERvar.masterID_MACHINENAME_ACTION,
        "MACHINE": FINALMASTERvar.MACHINElist_MACHINENAME_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_MACHINENAMEget());
    Navigator.pop(MACHINENAMEtablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_METHODE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_METHODE_FINAL",
      data: {
        "ITEMs": FINALMASTERvar.ITEM_METHOD_ACTION,
        "METHOD": FINALMASTERvar.METHOD_METHOD_ACTION,
        "DOCUMENTSM": FINALMASTERvar.DOCUMENT_METHOD_ACTION,
        "masterID": FINALMASTERvar.masterID_METHOD_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_METHODEget());
    Navigator.pop(METHODtablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_SPECIFICATION_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_SPECIFICATION_FINAL",
      data: {
        "ITEMs": FINALMASTERvar.ITEM_SPECIALSPEC_ACTION,
        "SPECIFICATION": FINALMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION,
        "masterID": FINALMASTERvar.masterID_SPECIALSPEC_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_SPECIALSPECget());
    Navigator.pop(SPECIALSPECtablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_CALCULATE_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_CALCULATE_FINAL",
      data: {
        "CALCULATE": FINALMASTERvar.CALCULATE_CALCULATE_ACTION,
        "FORMULA": FINALMASTERvar.FORMULA_CALCULATE_ACTION,
        "X": FINALMASTERvar.X_CALCULATE_ACTION,
        "Xb": FINALMASTERvar.Xb_CALCULATE_ACTION,
        "Y": FINALMASTERvar.Y_CALCULATE_ACTION,
        "Yb": FINALMASTERvar.Yb_CALCULATE_ACTION,
        "Z": FINALMASTERvar.Z_CALCULATE_ACTION,
        "Zb": FINALMASTERvar.Zb_CALCULATE_ACTION,
        "I": FINALMASTERvar.I_CALCULATE_ACTION,
        "Ib": FINALMASTERvar.Ib_CALCULATE_ACTION,
        "K1": FINALMASTERvar.K1_CALCULATE_ACTION,
        "K1b": FINALMASTERvar.K1b_CALCULATE_ACTION,
        "K2": FINALMASTERvar.K2_CALCULATE_ACTION,
        "K2b": FINALMASTERvar.K2b_CALCULATE_ACTION,
        "K3": FINALMASTERvar.K3_CALCULATE_ACTION,
        "K3b": FINALMASTERvar.K3b_CALCULATE_ACTION,
        "masterID": FINALMASTERvar.masterID_CALCULATE_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_CALCULATEget());
    Navigator.pop(CALCULATEtablecontext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_COMMENT_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_COMMENT_FINAL",
      data: {
        "masterID": FINALMASTERvar.masterID_COMMENT_ACTION,
        "COMMENT": FINALMASTERvar.COMMENT_COMMENT_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_COMMENTget());
    Navigator.pop(COMMENTtableContext);
    emit(output);
  }

  Future<void> _FINALMASTERmsg_CALCULATECON_EDIT(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      serverGB + "EDIT_CALCULATECON_FINAL",
      data: {
        "CALCULATE": FINALMASTERvar.CALCULATECON_CALCULATECON_ACTION,
        "FORMULA_01": FINALMASTERvar.FORMULA_CALCULATECON_ACTION_01,
        "FORMULA_02": FINALMASTERvar.FORMULA_CALCULATECON_ACTION_02,
        "FORMULA_03": FINALMASTERvar.FORMULA_CALCULATECON_ACTION_03,
        "FORMULA_04": FINALMASTERvar.FORMULA_CALCULATECON_ACTION_04,
        "FORMULA_05": FINALMASTERvar.FORMULA_CALCULATECON_ACTION_05,
        "X": FINALMASTERvar.X_CALCULATECON_ACTION,
        "Xb": FINALMASTERvar.Xb_CALCULATECON_ACTION,
        "Y": FINALMASTERvar.Y_CALCULATECON_ACTION,
        "Yb": FINALMASTERvar.Yb_CALCULATECON_ACTION,
        "Z": FINALMASTERvar.Z_CALCULATECON_ACTION,
        "Zb": FINALMASTERvar.Zb_CALCULATECON_ACTION,
        "I": FINALMASTERvar.I_CALCULATECON_ACTION,
        "Ib": FINALMASTERvar.Ib_CALCULATECON_ACTION,
        "K1": FINALMASTERvar.K1_CALCULATECON_ACTION,
        "K1b": FINALMASTERvar.K1b_CALCULATECON_ACTION,
        "K2": FINALMASTERvar.K2_CALCULATECON_ACTION,
        "K2b": FINALMASTERvar.K2b_CALCULATECON_ACTION,
        "K3": FINALMASTERvar.K3_CALCULATECON_ACTION,
        "K3b": FINALMASTERvar.K3b_CALCULATECON_ACTION,
        "masterID": FINALMASTERvar.masterID_CALCULATECON_ACTION,
      },
    );
    FINALMASTERmainCONTEXT.read<FINALMASTER_Bloc>()
        .add(FINALMASTER_CALCULATECONget());
    Navigator.pop(CALCULATECONtablecontext);
    emit(output);
  }

  //

  Future<void> _FINALMASTERmsg_FULSH(String toAdd, Emitter<String> emit) async {
    String output = '';

    emit(output);
  }
}
