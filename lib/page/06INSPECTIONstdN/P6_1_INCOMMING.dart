import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/06-1-P6FINSPECTIONget.dart';
import '../../bloc/BlocEvent/06-4-P6UPLOADSPEC.dart';
import '../../data/global.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/TABLE/11-PATTRENtableIP.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import 'P6INSPECTIONstdFunction_FN.dart';
import 'P6INSPECTIONstdNvar.dart';

ScrollController _controllerIN01 = ScrollController();
ScrollController _controllerIN02 = ScrollController();

class INSINCOMMING extends StatefulWidget {
  INSINCOMMING({
    super.key,
    this.Mdata,
  });
  P6InspectionSTD? Mdata;

  @override
  State<INSINCOMMING> createState() => _INSINCOMMINGState();
}

class _INSINCOMMINGState extends State<INSINCOMMING> {
  @override
  Widget build(BuildContext context) {
    P6InspectionSTD _Mdata = widget.Mdata ??
        P6InspectionSTD(
          INCOMMING: [],
          INPROCESS: [],
          FINAL: [],
        );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text("INCOMING PATTERN"),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    P6INSPECTION_INCOMMING_GET_STEP1(
                            P6INSPECTIONstdNvar_BASIC.CP)
                        .then((dynamic result) {
                      // print(result);
                      P6ClearINCOMMING();
                      if (result['ITEMs'] != null) {
                        if (result['ITEMs'].length > 0) {
                          for (int i = 0; i < result['ITEMs'].length; i++) {
                            P6INSPECTIONstdNvar_INCOMMING.List_ITEMs.add(
                                MapEntry(result['ITEMs'][i]['ITEMs'].toString(),
                                    result['ITEMs'][i]['masterID'].toString()));

                            P6INSPECTIONstdNvar_INCOMMING.List_ITEMs_set.add(
                                P6List_ITEMs_SET_Class(
                              ITEMs: result['ITEMs'][i]['ITEMs'] != null
                                  ? result['ITEMs'][i]['ITEMs'].toString()
                                  : '',
                              RESULTFORMAT:
                                  result['ITEMs'][i]['RESULTFORMAT'] != null
                                      ? result['ITEMs'][i]['RESULTFORMAT']
                                          .toString()
                                      : '',
                              TYPE: result['ITEMs'][i]['TYPE'] != null
                                  ? result['ITEMs'][i]['TYPE'].toString()
                                  : '',
                              GRAPHTYPE: result['ITEMs'][i]['GRAPHTYPE'] != null
                                  ? result['ITEMs'][i]['GRAPHTYPE'].toString()
                                  : '',
                              INTERSECTION:
                                  result['ITEMs'][i]['INTERSECTION'] != null
                                      ? result['ITEMs'][i]['INTERSECTION']
                                          .toString()
                                      : '',
                              masterID: result['ITEMs'][i]['masterID'] != null
                                  ? result['ITEMs'][i]['masterID'].toString()
                                  : '',
                            ));
                          }
                        }
                      }

                      setState(() {
                        P6NewdataINCOMMING();
                      });
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Container(
                      color: Colors.blue,
                      height: 40,
                      width: 100,
                      child: Center(
                        child: Text(
                          "NEW",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Scrollbar(
            controller: _controllerIN01,
            thumbVisibility: true,
            interactive: true,
            thickness: 10,
            radius: Radius.circular(20),
            child: SingleChildScrollView(
              controller: _controllerIN01,
              // keyboardDismissBehavior:
              //     ScrollViewKeyboardDismissBehavior.manual,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                // height: 40,
                width: 2500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: PATTERNtable(
                          ShowCORStype: false,
                          ShowLOAD: false,
                          ShowGT: false,
                          ShowCONVERSE: false,
                          ShowFORMULA: false,
                          BGColorMain: Colors.grey.shade400,
                          seq: "seq",
                          ITEMs: "ITEM",
                          K1CALDATA: "Constant",
                          CORStype: "CORStype",
                          FORMULA: "FORMULA",
                          SCMARK: "SC MARK",
                          SCMARKtype: "SCMARKtype",
                          DOCUMENT: "DOCUMENT",
                          METHOD: "METHOD",
                          IMGreaddata: "IMGreaddata",
                          IMGno: "IMGno",
                          LOAD: "LOAD",
                          GT: "GT",
                          SPECIFICATIONve: "SPECIFICATION",
                          CALCULATE: "CALCULATE",
                          UNIT: "UNIT",
                          CONVERSE: "CONVERSE",
                          CONVERSEDATA: "CONVERSEDATA",
                          POSITION: "POSITION",
                          PCS: "PCS",
                          FREQUENCY: "FREQUENCY",
                          REMARK: "REMARK",
                          SWreport: "SHOW REPORT",
                          SUMdata: "SUMdata",
                          SRAWDATA: "SRAWDATA",
                          ACTION: "ACTION",
                          isACTION: false,
                        ),
                      ),
                      for (int i = 0; i < _Mdata.INCOMMING.length; i++) ...[
                        Container(
                          height: 40,
                          child: PATTERNIPtable(
                            ShowCORStype: false,
                            ShowLOAD: false,
                            ShowGT: false,
                            ShowCONVERSE: false,
                            ShowFORMULA: false,
                            BGColorMain: i.isEven
                                ? Colors.grey.shade50
                                : Colors.grey.shade200,
                            seq: _Mdata.INCOMMING[i].seq,
                            ITEMs: _Mdata.INCOMMING[i].ITEMsname,

                            K1CALDATA: _KSW(_Mdata.INCOMMING[i].K1b,
                                _Mdata.INCOMMING[i].K1v),
                            // "${_Mdata.INCOMMING[i].K1b}(${_Mdata.INCOMMING[i].K1v})",
                            CORStype: "-",
                            FORMULA: "-",
                            SCMARK: _Mdata.INCOMMING[i].SCMARK,
                            SCMARKtype: "-",
                            DOCUMENT: _Mdata.INCOMMING[i].DOCUMENT,
                            METHOD: _Mdata.INCOMMING[i].METHODname,
                            IMGreaddata: "-",
                            IMGno: "-",
                            LOAD: _Mdata.INCOMMING[i].LOAD,
                            GT: "-",
                            SPECIFICATIONve:
                                _Mdata.INCOMMING[i].SPECIFICATIONvename,
                            CALCULATE: "-",
                            UNIT: _Mdata.INCOMMING[i].UNITname,
                            CONVERSE: _Mdata.INCOMMING[i].CONVERSEname,
                            CONVERSEDATA: _Mdata.INCOMMING[i].CONVERSEDATA,
                            // POSITION: _Mdata.INCOMMING[i].AQL == 'YES'
                            //     ? _Mdata.INCOMMING[i].AQLV
                            //     : _Mdata.INCOMMING[i].POINT,
                            POSITION: _Mdata.INCOMMING[i].POINT,
                            PCS: _Mdata.INCOMMING[i].AQL == 'YES'
                                ? "AQL(${_Mdata.INCOMMING[i].AQLV}%)"
                                : _Mdata.INCOMMING[i].PCS,
                            FREQUENCY: _Mdata.INCOMMING[i].FREQUENCY,
                            REMARK: _Mdata.INCOMMING[i].REMARK,
                            SWreport: _Mdata.INCOMMING[i].SWreport,
                            SUMdata: _Mdata.INCOMMING[i].SUMdata,
                            SRAWDATA: _Mdata.INCOMMING[i].SRAWDATA,
                            ACTION: "ACTION",

                            CONIP: _Mdata.INCOMMING[i].CONIP,
                            CONIPITEM: _Mdata.INCOMMING[i].CONIPITEM,
                            CONIPITEMVAR: _Mdata.INCOMMING[i].CONIPITEMVAR,

                            EditFN: (v) {
                              //
                              // print(_Mdata.INCOMMING[i].ITEMsname);

                              P6ClearINCOMMING();
                              P6INSPECTIONstdNvar_INCOMMING.seq =
                                  _Mdata.INCOMMING[i].seq;
                              //---------------------
                              P6INSPECTIONstdNvar_INCOMMING.List_ITEMs = [
                                MapEntry("-", "-")
                              ];
                              P6INSPECTIONstdNvar_INCOMMING.List_ITEMs.add(
                                MapEntry(
                                  _Mdata.INCOMMING[i].ITEMsname,
                                  _Mdata.INCOMMING[i].ITEMs,
                                ),
                              );

                              P6INSPECTIONstdNvar_INCOMMING.ITEMs =
                                  _Mdata.INCOMMING[i].ITEMs;

                              for (var i = 0;
                                  i <
                                      P6INSPECTIONstdNvar_INCOMMING
                                          .List_ITEMs_set.length;
                                  i++) {
                                if (P6INSPECTIONstdNvar_INCOMMING
                                        .List_ITEMs_set[i].masterID ==
                                    _Mdata.INCOMMING[i].ITEMs) {
                                  P6INSPECTIONstdNvar_INCOMMING.TYPE =
                                      P6INSPECTIONstdNvar_INCOMMING
                                          .List_ITEMs_set[i].TYPE;
                                  P6INSPECTIONstdNvar_INCOMMING.RESULTFORMAT =
                                      P6INSPECTIONstdNvar_INCOMMING
                                          .List_ITEMs_set[i].RESULTFORMAT;
                                  break;
                                }
                              }
                              // print(P6INSPECTIONstdNvar_INCOMMING.RESULTFORMAT);

                              if (P6INSPECTIONstdNvar_INCOMMING.RESULTFORMAT !=
                                  '-') {
                                P6INSPECTION_INCOMMING_GET_STEP2(
                                        _Mdata.INCOMMING[i].ITEMs)
                                    .then((dynamic result) {
                                  // print(result);

                                  setState(() {
                                    P6INSPECTIONstdNvar_INCOMMING
                                            .RESULTFORMATdata =
                                        result['RESULTFORMATdata'] != null
                                            ? result['RESULTFORMATdata']
                                                .toString()
                                            : '-';
                                    if (result['METHOD'] != null &&
                                        result['METHOD'].length > 0) {
                                      for (int i = 0;
                                          i < result['METHOD'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_METHOD
                                            .add(MapEntry(
                                                result['METHOD'][i]['METHOD']
                                                    .toString(),
                                                result['METHOD'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['LOAD'] != null &&
                                        result['LOAD'].length > 0) {
                                      for (int i = 0;
                                          i < result['LOAD'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING.List_LOAD
                                            .add(MapEntry(
                                                result['LOAD'][i]['LOAD']
                                                    .toString(),
                                                result['LOAD'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['CORETYPE'] != null &&
                                        result['CORETYPE'].length > 0) {
                                      for (int i = 0;
                                          i < result['CORETYPE'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_CORETYPE
                                            .add(
                                                MapEntry(
                                                    result['CORETYPE'][i]
                                                            ['CORETYPE']
                                                        .toString(),
                                                    result['CORETYPE'][i]
                                                            ['masterID']
                                                        .toString()));
                                      }
                                    }
                                    if (result['GT'] != null &&
                                        result['GT'].length > 0) {
                                      for (int i = 0;
                                          i < result['GT'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING.List_GT
                                            .add(MapEntry(
                                                result['GT'][i]['GT']
                                                    .toString(),
                                                result['GT'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['UNIT'] != null &&
                                        result['UNIT'].length > 0) {
                                      for (int i = 0;
                                          i < result['UNIT'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING.List_UNIT
                                            .add(MapEntry(
                                                result['UNIT'][i]['UNIT']
                                                    .toString(),
                                                result['UNIT'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['UNIT'] != null &&
                                        result['UNIT'].length > 0) {
                                      for (int i = 0;
                                          i < result['UNIT'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_UNIT_CONVERST
                                            .add(MapEntry(
                                                result['UNIT'][i]['UNIT']
                                                    .toString(),
                                                result['UNIT'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['FREQUENCY'] != null &&
                                        result['FREQUENCY'].length > 0) {
                                      for (int i = 0;
                                          i < result['FREQUENCY'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_FREQUENCY
                                            .add(MapEntry(
                                                result['FREQUENCY'][i]
                                                        ['FREQUENCY']
                                                    .toString(),
                                                result['FREQUENCY'][i]
                                                        ['masterID']
                                                    .toString()));
                                      }
                                    }
                                    if (result['CALCULATE'] != null &&
                                        result['CALCULATE'].length > 0) {
                                      for (int i = 0;
                                          i < result['CALCULATE'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_CALCULATE
                                            .add(MapEntry(
                                                result['CALCULATE'][i]
                                                        ['CALCULATE']
                                                    .toString(),
                                                result['CALCULATE'][i]
                                                        ['masterID']
                                                    .toString()));
                                      }
                                    }
                                    if (result['SPECIFICATION'] != null &&
                                        result['SPECIFICATION'].length > 0) {
                                      for (int i = 0;
                                          i < result['SPECIFICATION'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_SPECIFICATIONt
                                            .add(MapEntry(
                                                result['SPECIFICATION'][i]
                                                        ['SPECIFICATION']
                                                    .toString(),
                                                result['SPECIFICATION'][i]
                                                        ['masterID']
                                                    .toString()));
                                      }
                                    }
                                    // print(result['COMMENT']);
                                    if (result['COMMENT'] != null &&
                                        result['COMMENT'].length > 0) {
                                      for (int i = 0;
                                          i < result['COMMENT'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_INCOMMING
                                                .List_COMMENT
                                            .add(MapEntry(
                                                result['COMMENT'][i]['COMMENT']
                                                    .toString(),
                                                result['COMMENT'][i]['masterID']
                                                    .toString()));
                                      }
                                    }
                                  });
                                });
                              }

                              P6INSPECTIONstdNvar_INCOMMING.K1b =
                                  _Mdata.INCOMMING[i].K1b;
                              P6INSPECTIONstdNvar_INCOMMING.K1v =
                                  _Mdata.INCOMMING[i].K1v;
                              P6INSPECTIONstdNvar_INCOMMING.TYPE =
                                  _Mdata.INCOMMING[i].TYPE;
                              P6INSPECTIONstdNvar_INCOMMING.RESULTFORMAT =
                                  _Mdata.INCOMMING[i].RESULTFORMAT;
                              P6INSPECTIONstdNvar_INCOMMING.GRAPHTYPE =
                                  _Mdata.INCOMMING[i].GRAPHTYPE;
                              P6INSPECTIONstdNvar_INCOMMING.INTERSECTION =
                                  _Mdata.INCOMMING[i].INTERSECTION;
                              // P6INSPECTIONstdNvar_INCOMMING.COREtype = _Mdata.INCOMMING[i].COREtype;
                              // P6INSPECTIONstdNvar_INCOMMING.FORMULA = _Mdata.INCOMMING[i].FORMULA;
                              P6INSPECTIONstdNvar_INCOMMING.SCMARK =
                                  _Mdata.INCOMMING[i].SCMARK;
                              // P6INSPECTIONstdNvar_INCOMMING.SCMARKTYPE = _Mdata.INCOMMING[i].SCMARKTYPE;
                              P6INSPECTIONstdNvar_INCOMMING.DOCUMENT =
                                  _Mdata.INCOMMING[i].DOCUMENT;
                              P6INSPECTIONstdNvar_INCOMMING.METHOD =
                                  _Mdata.INCOMMING[i].METHOD;
                              // P6INSPECTIONstdNvar_INCOMMING.IMGreaddata = _Mdata.INCOMMING[i].IMGreaddata;
                              // P6INSPECTIONstdNvar_INCOMMING.IMGno = _Mdata.INCOMMING[i].IMGno;
                              P6INSPECTIONstdNvar_INCOMMING.LOAD =
                                  _Mdata.INCOMMING[i].LOAD;
                              // P6INSPECTIONstdNvar_INCOMMING.GT = _Mdata.INCOMMING[i].GT;
                              P6INSPECTIONstdNvar_INCOMMING.SPECIFICATION =
                                  _Mdata.INCOMMING[i].SPECIFICATION;
                              P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONstr =
                                  _Mdata.INCOMMING[i].SPECIFICATIONstr;
                              P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONve =
                                  _Mdata.INCOMMING[i].SPECIFICATIONve;
                              P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONveOB =
                                  NveOB(
                                condition:
                                    _Mdata.INCOMMING[i].SPECIFICATIONcondition,
                                BTW_HI: _Mdata.INCOMMING[i].SPECIFICATIONBTW_HI,
                                BTW_LOW:
                                    _Mdata.INCOMMING[i].SPECIFICATIONBTW_LOW,
                                HIM_L: _Mdata.INCOMMING[i].SPECIFICATIONHIM_L,
                                LOL_H: _Mdata.INCOMMING[i].SPECIFICATIONLOL_H,
                                TARGET: _Mdata.INCOMMING[i].SPECIFICATIONTARGET,
                              );
                              P6INSPECTIONstdNvar_INCOMMING.UNIT =
                                  _Mdata.INCOMMING[i].UNIT;
                              // P6INSPECTIONstdNvar_INCOMMING.UNIT_CONVERST = _Mdata.INCOMMING[i].UNIT_CONVERST;
                              P6INSPECTIONstdNvar_INCOMMING.CONVERSEDATA =
                                  _Mdata.INCOMMING[i].CONVERSEDATA;
                              // static String POINTPCS = "-";
                              P6INSPECTIONstdNvar_INCOMMING.POINT =
                                  _Mdata.INCOMMING[i].POINT;
                              P6INSPECTIONstdNvar_INCOMMING.PCS =
                                  _Mdata.INCOMMING[i].PCS;
                              P6INSPECTIONstdNvar_INCOMMING.FREQUENCY =
                                  _Mdata.INCOMMING[i].FREQUENCY;
                              // P6INSPECTIONstdNvar_INCOMMING.REMARK = _Mdata.INCOMMING[i].REMARK;
                              // P6INSPECTIONstdNvar_INCOMMING.RESULTFORMATdata = _Mdata.INCOMMING[i].RESULTFORMATdata;
                              P6INSPECTIONstdNvar_INCOMMING.SWreport =
                                  _Mdata.INCOMMING[i].SWreport;
                              P6INSPECTIONstdNvar_INCOMMING.SUMDATA =
                                  _Mdata.INCOMMING[i].SUMdata;
                              P6INSPECTIONstdNvar_INCOMMING.SRAWDATA =
                                  _Mdata.INCOMMING[i].SRAWDATA;
                              P6INSPECTIONstdNvar_INCOMMING.AQL =
                                  _Mdata.INCOMMING[i].AQL;
                              P6INSPECTIONstdNvar_INCOMMING.AQLV =
                                  _Mdata.INCOMMING[i].AQLV;

                              setState(() {
                                P6INSPECTIONstdNvar_INCOMMING.POP = true;
                              });
                            },
                            DeleteFN: (s) {
                              P6INSPECTIONstdNvar_INCOMMING.ITEMs =
                                  _Mdata.INCOMMING[i].ITEMs;
                              context
                                  .read<P6UPLOADSPEC_Bloc>()
                                  .add(DELETESPEC_INCOMMING());
                            },
                            isACTION: true,
                          ),
                        ),
                      ],
                      if (P6INSPECTIONstdNvar_INCOMMING.POP) ...[
                        Scrollbar(
                          controller: _controllerIN02,
                          thumbVisibility: true,
                          interactive: true,
                          thickness: 10,
                          radius: Radius.circular(20),
                          child: SingleChildScrollView(
                            controller: _controllerIN02,
                            // keyboardDismissBehavior:
                            //     ScrollViewKeyboardDismissBehavior.manual,
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              width: 2500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onLongPress: () {
                                      //
                                      setState(() {
                                        P6ClearINCOMMING();
                                      });

                                      //
                                    },
                                    child: Container(
                                      height: 40,
                                      color: Colors.red,
                                      child: Center(
                                        child: Text(
                                          "CLEAR",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: PATTERNtable(
                                      ShowCORStype: false,
                                      ShowLOAD: false,
                                      ShowGT: false,
                                      ShowCONVERSE: false,
                                      ShowFORMULA: false,
                                      BGColorMain: Colors.grey.shade400,
                                      seq: "seq",
                                      ITEMs: "ITEM",
                                      K1CALDATA: "Constant",
                                      CORStype: "CORStype",
                                      FORMULA: "FORMULA",
                                      SCMARK: "SC MARK",
                                      SCMARKtype: "SCMARKtype",
                                      DOCUMENT: "DOCUMENT",
                                      METHOD: "METHOD",
                                      IMGreaddata: "IMGreaddata",
                                      IMGno: "IMGno",
                                      LOAD: "LOAD",
                                      GT: "GT",
                                      SPECIFICATIONve: "SPECIFICATION",
                                      CALCULATE: "CALCULATE",
                                      UNIT: "UNIT",
                                      CONVERSE: "CONVERSE",
                                      CONVERSEDATA: "CONVERSEDATA",
                                      POSITION: "POSITION",
                                      PCS: "PCS",
                                      FREQUENCY: "FREQUENCY",
                                      REMARK: "REMARK",
                                      SWreport: "SHOW REPORT",
                                      SUMdata: "SUMdata",
                                      SRAWDATA: "SRAWDATA",
                                      ACTION: "ACTION",
                                      isACTION: false,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(minHeight: 80),
                                    child: PATTERNtable(
                                      ShowCORStype: false,
                                      ShowLOAD: false,
                                      ShowGT: false,
                                      ShowCONVERSE: false,
                                      ShowFORMULA: false,
                                      BGColorMain: Colors.white,
                                      seq: "seq",
                                      ITEMs: "ITEMs",
                                      WIDGETITEMs: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_INCOMMING
                                                .ITEMs !=
                                            '-',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .List_ITEMs,
                                        onChangeinside: (d, k) async {
                                          // print(d);
                                          P6INSPECTIONstdNvar_INCOMMING.ITEMs =
                                              d;
                                          for (var i = 0;
                                              i <
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .List_ITEMs_set.length;
                                              i++) {
                                            if (P6INSPECTIONstdNvar_INCOMMING
                                                    .List_ITEMs_set[i]
                                                    .masterID ==
                                                d) {
                                              P6INSPECTIONstdNvar_INCOMMING
                                                      .TYPE =
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .List_ITEMs_set[i].TYPE;
                                              P6INSPECTIONstdNvar_INCOMMING
                                                      .RESULTFORMAT =
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .List_ITEMs_set[i]
                                                      .RESULTFORMAT;
                                              break;
                                            }
                                          }
                                          print(P6INSPECTIONstdNvar_INCOMMING
                                              .RESULTFORMAT);

                                          if (d != '-') {
                                            P6INSPECTION_INCOMMING_GET_STEP2(d)
                                                .then((dynamic result) {
                                              // print(result);

                                              setState(() {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMATdata = result[
                                                            'RESULTFORMATdata'] !=
                                                        null
                                                    ? result['RESULTFORMATdata']
                                                        .toString()
                                                    : '-';
                                                if (result['METHOD'] != null &&
                                                    result['METHOD'].length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['METHOD']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING.List_METHOD
                                                        .add(MapEntry(
                                                            result['METHOD'][i]
                                                                    ['METHOD']
                                                                .toString(),
                                                            result['METHOD'][i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }

                                                if (result['LOAD'] != null &&
                                                    result['LOAD'].length > 0) {
                                                  for (int i = 0;
                                                      i < result['LOAD'].length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_LOAD
                                                        .add(MapEntry(
                                                            result['LOAD'][i]
                                                                    ['LOAD']
                                                                .toString(),
                                                            result['LOAD'][i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }

                                                if (result['CORETYPE'] !=
                                                        null &&
                                                    result['CORETYPE'].length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['CORETYPE']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_CORETYPE
                                                        .add(MapEntry(
                                                            result['CORETYPE']
                                                                        [i]
                                                                    ['CORETYPE']
                                                                .toString(),
                                                            result['CORETYPE']
                                                                        [i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }
                                                if (result['GT'] != null &&
                                                    result['GT'].length > 0) {
                                                  for (int i = 0;
                                                      i < result['GT'].length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_GT
                                                        .add(MapEntry(
                                                            result['GT'][i]
                                                                    ['GT']
                                                                .toString(),
                                                            result['GT'][i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }

                                                if (result['UNIT'] != null &&
                                                    result['UNIT'].length > 0) {
                                                  for (int i = 0;
                                                      i < result['UNIT'].length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_UNIT
                                                        .add(MapEntry(
                                                            result['UNIT'][i]
                                                                    ['UNIT']
                                                                .toString(),
                                                            result['UNIT'][i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }

                                                if (result['UNIT'] != null &&
                                                    result['UNIT'].length > 0) {
                                                  for (int i = 0;
                                                      i < result['UNIT'].length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_UNIT_CONVERST
                                                        .add(MapEntry(
                                                            result['UNIT'][i]
                                                                    ['UNIT']
                                                                .toString(),
                                                            result['UNIT'][i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }

                                                if (result['FREQUENCY'] !=
                                                        null &&
                                                    result['FREQUENCY'].length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['FREQUENCY']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_FREQUENCY
                                                        .add(MapEntry(
                                                            result['FREQUENCY']
                                                                        [i][
                                                                    'FREQUENCY']
                                                                .toString(),
                                                            result['FREQUENCY']
                                                                        [i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }
                                                if (result['CALCULATE'] !=
                                                        null &&
                                                    result['CALCULATE'].length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['CALCULATE']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_CALCULATE
                                                        .add(MapEntry(
                                                            result['CALCULATE']
                                                                        [i][
                                                                    'CALCULATE']
                                                                .toString(),
                                                            result['CALCULATE']
                                                                        [i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }
                                                if (result['SPECIFICATION'] !=
                                                        null &&
                                                    result['SPECIFICATION']
                                                            .length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['SPECIFICATION']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_SPECIFICATIONt
                                                        .add(MapEntry(
                                                            result['SPECIFICATION']
                                                                        [i][
                                                                    'SPECIFICATION']
                                                                .toString(),
                                                            result['SPECIFICATION']
                                                                        [i]
                                                                    ['masterID']
                                                                .toString()));
                                                  }
                                                }
                                                print(result['COMMENT']);
                                                if (result['COMMENT'] != null &&
                                                    result['COMMENT'].length >
                                                        0) {
                                                  for (int i = 0;
                                                      i <
                                                          result['COMMENT']
                                                              .length;
                                                      i++) {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                            .List_COMMENT
                                                        .add(
                                                            MapEntry(
                                                                result['COMMENT']
                                                                            [i][
                                                                        'COMMENT']
                                                                    .toString(),
                                                                result['COMMENT']
                                                                            [i][
                                                                        'masterID']
                                                                    .toString()));
                                                  }
                                                }
                                              });
                                            });
                                          }
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_INCOMMING.ITEMs,
                                        height: 40,
                                        width: 400,
                                      ),
                                      K1CALDATA: "Constant",
                                      WIDGETK1CALDATA: Column(
                                        children: [
                                          AdvanceDropDown(
                                            isEnable:
                                                P6INSPECTIONstdNvar_INCOMMING
                                                        .RESULTFORMAT !=
                                                    'CAL1',
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: [
                                              MapEntry("-", "-"),
                                              MapEntry("Kcon.", "1"),
                                              MapEntry("Kvar.", "2")
                                            ],
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .K1b = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INCOMMING
                                                .K1b,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_INCOMMING
                                                  .K1b ==
                                              '1') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              isNumberOnly: true,
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .K1v,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .K1v = s;
                                              },
                                            ),
                                          ]
                                        ],
                                      ),
                                      SCMARK: "SC MARK",
                                      WIDGETSCMARK: Column(
                                        children: [
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown:
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .List_SCMARK,
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .SCMARK = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INCOMMING
                                                .SCMARK,
                                            height: 40,
                                            width: 400,
                                          ),
                                          if (P6INSPECTIONstdNvar_INCOMMING
                                                  .SCMARK ==
                                              'YES')
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: [
                                                MapEntry("-", "-"),
                                                MapEntry("TYPE 1", "1"),
                                                MapEntry("TYPE 2", "2")
                                              ],
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .SCMARKTYPE = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SCMARKTYPE,
                                              height: 40,
                                              width: 400,
                                            ),
                                        ],
                                      ),
                                      DOCUMENT: "DOCUMENT",
                                      // WIDGETDOCUMENT: ComInputText(
                                      //   nLimitedChar: 100,
                                      //   height: 40,
                                      //   width: 400,
                                      //   isContr:
                                      //       P6INSPECTIONstdNvar_INCOMMING.iscontrol,
                                      //   isEnabled: P6INSPECTIONstdNvar_INCOMMING
                                      //       .ACTION_isEnabled,
                                      //   fnContr: (input) {
                                      //     setState(() {
                                      //       P6INSPECTIONstdNvar_INCOMMING
                                      //           .iscontrol = input;
                                      //     });
                                      //   },
                                      //   sValue:
                                      //       P6INSPECTIONstdNvar_INCOMMING.DOCUMENT,
                                      //   returnfunc: (String s) {
                                      //     P6INSPECTIONstdNvar_INCOMMING.DOCUMENT =
                                      //         s;
                                      //   },
                                      // ),
                                      WIDGETDOCUMENT: Container(
                                        height: 40,
                                        width: 400,
                                        child: Center(
                                          child: Text(
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .DOCUMENT,
                                          ),
                                        ),
                                      ),
                                      METHOD: "METHOD",
                                      WIDGETMETHOD: Column(
                                        children: [
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown:
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .List_METHOD,
                                            onChangeinside: (d, k) async {
                                              P6INSPECTIONstdNvar_INCOMMING
                                                  .METHOD = d;
                                              print(d);
                                              final response = await Dio().post(
                                                serverGB +
                                                    "GET_INCOMMING_DOCUMENT",
                                                data: {
                                                  "ITEMs":
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .ITEMs,
                                                  "METHODid":
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .METHOD,
                                                },
                                              );

                                              // print(response);
                                              if (response.statusCode == 200) {
                                                var databuff = response.data;

                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .iscontrol = true;
                                                P6INSPECTIONstdNvar_INCOMMING
                                                        .DOCUMENT =
                                                    databuff['DOCUMENT'];
                                                setState(() {});
                                              }
                                            },
                                            value: P6INSPECTIONstdNvar_INCOMMING
                                                .METHOD,
                                            height: 40,
                                            width: 400,
                                          ),
                                          if (P6INSPECTIONstdNvar_INCOMMING
                                                      .RESULTFORMATdata ==
                                                  'Picture' ||
                                              P6INSPECTIONstdNvar_INCOMMING
                                                      .RESULTFORMATdata ==
                                                  'OCR') ...[
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: MethodePIC,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .IMGreaddata = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .IMGreaddata,
                                              height: 40,
                                              width: 400,
                                            ),
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .List_IMGno,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .IMGno = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .IMGno,
                                              height: 40,
                                              width: 400,
                                            )
                                          ],
                                        ],
                                      ),
                                      SPECIFICATIONve: "SPECIFICATION",
                                      WIDGETSPECIFICATIONve: Column(
                                        children: [
                                          if (P6INSPECTIONstdNvar_INCOMMING
                                                      .RESULTFORMAT !=
                                                  'Text' &&
                                              P6INSPECTIONstdNvar_INCOMMING
                                                      .RESULTFORMAT !=
                                                  'Picture') ...[
                                            SizedBox(
                                              width: 200,
                                              child: AdvanceDropDown(
                                                imgpath:
                                                    'assets/icons/icon-down_4@3x.png',
                                                listdropdown: [
                                                  const MapEntry("-", "-"),
                                                  const MapEntry("BTW", "BTW"),
                                                  const MapEntry(
                                                      "Lower", "LOL(<)"),
                                                  const MapEntry(
                                                      "Higher", "HIM(>)"),
                                                  const MapEntry(
                                                      "Actual", "Actual"),
                                                ],
                                                onChangeinside: (d, k) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .condition = d;
                                                  setState(() {});
                                                },
                                                value:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .condition,
                                                height: 40,
                                                width: 200,
                                              ),
                                            ),
                                            if (P6INSPECTIONstdNvar_INCOMMING
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "BTW_HI",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .BTW_HI,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .BTW_HI = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "BTW_LOW",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .BTW_LOW,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .BTW_LOW = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INCOMMING
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'HIM(>)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "HIM_L",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .HIM_L,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .HIM_L = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INCOMMING
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'LOL(<)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "LOL_H",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .LOL_H,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .LOL_H = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONveOB.condition == 'HIM(>)' ||
                                                P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'LOL(<)' ||
                                                P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "TARGET",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATIONveOB
                                                        .TARGET,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONveOB
                                                      .TARGET = s;
                                                },
                                              ),
                                            ],
                                          ] else ...[
                                            SizedBox(
                                              width: 200,
                                              child: AdvanceDropDown(
                                                imgpath:
                                                    'assets/icons/icon-down_4@3x.png',
                                                listdropdown:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .List_SPECIFICATIONt,
                                                onChangeinside: (d, k) {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATION = d;
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SPECIFICATIONstr = k;
                                                },
                                                value:
                                                    P6INSPECTIONstdNvar_INCOMMING
                                                        .SPECIFICATION,
                                                height: 40,
                                                width: 200,
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                      UNIT: "UNIT",
                                      WIDGETUNIT: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INCOMMING.UNIT =
                                              d;
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_INCOMMING.UNIT,
                                        height: 40,
                                        width: 400,
                                      ),

                                      WIDGETCONVERSE: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INCOMMING
                                              .UNIT_CONVERST = d;
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .UNIT_CONVERST,
                                        height: 40,
                                        width: 400,
                                      ),
                                      CONVERSEDATA: "CONVERSEDATA",
                                      WIDGETCONVERSEDATA: AdvanceDropDown(
                                        // isEnable: true,
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .CONVERSEDATA = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .CONVERSEDATA,
                                        height: 40,
                                        width: 80,
                                      ),
                                      POSITION: "POSITION",
                                      WIDGETPOSITION: ComInputText(
                                        nLimitedChar: 100,

                                        height: 40,
                                        width: 400,
                                        isContr: P6INSPECTIONstdNvar_INCOMMING
                                            .iscontrol,
                                        // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                        fnContr: (input) {
                                          print(input);
                                          setState(() {
                                            setState(() {
                                              P6INSPECTIONstdNvar_INCOMMING
                                                  .iscontrol = input;
                                            });
                                          });
                                        },
                                        sValue:
                                            P6INSPECTIONstdNvar_INCOMMING.POINT,
                                        returnfunc: (String s) {
                                          P6INSPECTIONstdNvar_INCOMMING.POINT =
                                              s;
                                        },
                                      ),
                                      PCS: "PCS",
                                      WIDGETPCS: (P6INSPECTIONstdNvar_INCOMMING
                                                  .RESULTFORMAT ==
                                              'Text')
                                          ? Column(
                                              children: [
                                                AdvanceDropDown(
                                                  isEnable: false,
                                                  imgpath:
                                                      'assets/icons/icon-down_4@3x.png',
                                                  listdropdown: [
                                                    MapEntry("-", "-"),
                                                    MapEntry("AQL", "YES"),
                                                  ],
                                                  onChangeinside: (d, k) {
                                                    setState(() {
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .AQL = d;
                                                    });
                                                  },
                                                  value:
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .AQL,
                                                  height: 40,
                                                  width: 80,
                                                ),
                                                if (P6INSPECTIONstdNvar_INCOMMING
                                                        .AQL ==
                                                    'YES') ...[
                                                  ComInputText(
                                                    nLimitedChar: 100,
                                                    sLabel: "%AQL",
                                                    height: 40,
                                                    width: 400,
                                                    isContr:
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .AQLV,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .AQLV = s;
                                                    },
                                                  ),
                                                ] else ...[
                                                  ComInputText(
                                                    isNumberOnly: true,
                                                    nLimitedChar: 100,
                                                    sLabel: "PSC",
                                                    height: 40,
                                                    width: 400,
                                                    isContr:
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_INCOMMING
                                                            .PCS,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_INCOMMING
                                                          .PCS = s;
                                                    },
                                                  ),
                                                ],
                                              ],
                                            )
                                          : ComInputText(
                                              nLimitedChar: 100,

                                              height: 40,
                                              width: 400,
                                              isContr:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .PCS,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .PCS = s;
                                              },
                                            ),
                                      FREQUENCY: "FREQUENCY",
                                      WIDGETFREQUENCY: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .List_FREQUENCY,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INCOMMING
                                              .FREQUENCY = d;
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .FREQUENCY,
                                        height: 40,
                                        width: 400,
                                      ),
                                      REMARK: "REMARK",
                                      WIDGETREMARK: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .List_COMMENT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INCOMMING.REMARK =
                                              d;
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .REMARK,
                                        height: 40,
                                        width: 400,
                                      ),

                                      SWreport: "SWreport",
                                      WIDGETSWreport: AdvanceDropDown(
                                        // isEnable: true,
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .SWreport = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .SWreport,
                                        height: 40,
                                        width: 80,
                                      ),

                                      SUMdata: "SUMdata",
                                      WIDGETSUMdata: Column(
                                        children: [
                                          AdvanceDropDown(
                                            // isEnable: true,
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: [
                                              MapEntry("-", "-"),
                                              MapEntry("YES", "YES"),
                                              MapEntry("NO", "NO")
                                            ],
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .SUMDATA = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INCOMMING
                                                .SUMDATA,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_INCOMMING
                                                  .AQL ==
                                              'SUMDATA') ...[
                                            ComInputText(
                                              nLimitedChar: 100,

                                              height: 40,
                                              width: 400,
                                              isContr:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INCOMMING
                                                      .SUMDATATEXT,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INCOMMING
                                                    .SUMDATATEXT = s;
                                              },
                                            ),
                                          ]
                                        ],
                                      ),
                                      SRAWDATA: "SRAWDATA",
                                      WIDGETSRAWDATA: AdvanceDropDown(
                                        // isEnable: true,
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO"),
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_INCOMMING
                                                .SRAWDATA = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INCOMMING
                                            .SRAWDATA,
                                        height: 40,
                                        width: 80,
                                      ),

                                      //--------------GAS
                                      CONVERSE: "CONVERSE",
                                      CORStype: "CORStype",
                                      FORMULA: "FORMULA",
                                      SCMARKtype: "SCMARKtype",
                                      IMGreaddata: "IMGreaddata",
                                      IMGno: "IMGno",
                                      LOAD: "LOAD",
                                      GT: "GT",
                                      CALCULATE: "CALCULATE",
                                      //--------------ACTION
                                      ACTION: "ACTION",
                                      isACTION: true,
                                      ACTIONMODE: 1,
                                      SAVEFN: (v) {
                                        print(P6INSPECTIONstdNvar_INCOMMING
                                            .RESULTFORMAT);
                                        if (P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'Text' ||
                                            P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'Picture') {
                                          context.read<P6UPLOADSPEC_Bloc>().add(
                                              P6UPLOADSPEC_INCOMMING_TEXT());
                                        } else if (P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'OCR' ||
                                            P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'Number' ||
                                            P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'Graph' ||
                                            P6INSPECTIONstdNvar_INCOMMING
                                                    .RESULTFORMAT ==
                                                'CAL1') {
                                          context.read<P6UPLOADSPEC_Bloc>().add(
                                              P6UPLOADSPEC_INCOMMING_NUM());
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _KSW(String type, String value) {
  String output = '-';

  if (type == '1') {
    output = 'Kcon(${value})';
  } else if (type == '2') {
    output = 'Kvar';
  }

  return output;
}
