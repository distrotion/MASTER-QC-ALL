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

class INPROCESS extends StatefulWidget {
  INPROCESS({
    super.key,
    this.Mdata,
  });
  P6InspectionSTD? Mdata;

  @override
  State<INPROCESS> createState() => _INPROCESSState();
}

class _INPROCESSState extends State<INPROCESS> {
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
                  child: Text("INPROCESS PATTERN"),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    P6INSPECTION_INPROCESS_GET_STEP1(
                            P6INSPECTIONstdNvar_BASIC.CP)
                        .then((dynamic result) {
                      // print(result);
                      P6ClearINPROCESS();
                      if (result['ITEMs'] != null) {
                        if (result['ITEMs'].length > 0) {
                          for (int i = 0; i < result['ITEMs'].length; i++) {
                            P6INSPECTIONstdNvar_INPROCESS.List_ITEMs.add(
                                MapEntry(result['ITEMs'][i]['ITEMs'].toString(),
                                    result['ITEMs'][i]['masterID'].toString()));

                            P6INSPECTIONstdNvar_INPROCESS.List_ITEMs_set.add(
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
                        P6NewdataINPROCESS();
                      });
                    });
                    P6INSPECTION_FINAL_GET_STEP1(P6INSPECTIONstdNvar_BASIC.CP)
                        .then((dynamic result) {
                      // print(result);
                      P6ClearFINAL();
                      if (result['ITEMs'] != null) {
                        if (result['ITEMs'].length > 0) {
                          for (int i = 0; i < result['ITEMs'].length; i++) {
                            P6INSPECTIONstdNvar_FINAL.List_ITEMs.add(MapEntry(
                                result['ITEMs'][i]['ITEMs'].toString(),
                                result['ITEMs'][i]['masterID'].toString()));

                            P6INSPECTIONstdNvar_FINAL.List_ITEMs_set.add(
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
                                GRAPHTYPE: result['ITEMs'][i]['GRAPHTYPE'] !=
                                        null
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
                              ),
                            );
                          }
                        }
                      }

                      setState(() {
                        P6NewdataFINAL();
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
                        child: PATTERNIPtable(
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
                          CONIP: "to final",
                          CONIPITEM: "COM ITEMs",
                          CONIPITEMVAR: "VAR",
                          ACTION: "ACTION",
                          isACTION: false,
                        ),
                      ),
                      for (int i = 0; i < _Mdata.INPROCESS.length; i++) ...[
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
                            seq: _Mdata.INPROCESS[i].seq,
                            // ITEMs: _Mdata.INPROCESS[i].ITEMsname,
                            ITEMs: _Mdata.INPROCESS[i].ITEMsname,

                            K1CALDATA: _KSW(_Mdata.INPROCESS[i].K1b,
                                _Mdata.INPROCESS[i].K1v),
                            // "${_Mdata.INPROCESS[i].K1b}(${_Mdata.INPROCESS[i].K1v})",
                            CORStype: "-",
                            FORMULA: "-",
                            SCMARK: _Mdata.INPROCESS[i].SCMARK,
                            SCMARKtype: "-",
                            DOCUMENT: _Mdata.INPROCESS[i].DOCUMENT,
                            METHOD: _Mdata.INPROCESS[i].METHODname,
                            IMGreaddata: "-",
                            IMGno: "-",
                            LOAD: _Mdata.INPROCESS[i].LOAD,
                            GT: "-",
                            SPECIFICATIONve:
                                _Mdata.INPROCESS[i].SPECIFICATIONvename,
                            CALCULATE: "-",
                            UNIT: _Mdata.INPROCESS[i].UNITname,
                            CONVERSE: _Mdata.INPROCESS[i].CONVERSEname,
                            CONVERSEDATA: _Mdata.INPROCESS[i].CONVERSEDATA,
                            // POSITION: _Mdata.INPROCESS[i].AQL == 'YES'
                            //     ? _Mdata.INPROCESS[i].AQLV
                            //     : _Mdata.INPROCESS[i].POINT,
                            POSITION: _Mdata.INPROCESS[i].POINT,
                            PCS: _Mdata.INPROCESS[i].AQL == 'YES'
                                ? "AQL(${_Mdata.INPROCESS[i].AQLV}%)"
                                : _Mdata.INPROCESS[i].PCS,
                            FREQUENCY: _Mdata.INPROCESS[i].FREQUENCY,
                            REMARK: _Mdata.INPROCESS[i].REMARK,
                            SWreport: _Mdata.INPROCESS[i].SWreport,
                            SUMdata: _Mdata.INPROCESS[i].SUMdata,
                            SRAWDATA: _Mdata.INPROCESS[i].SRAWDATA,

                            CONIP: _Mdata.INPROCESS[i].CONIP,
                            CONIPITEM: _Mdata.INPROCESS[i].CONIPITEMNAME,
                            CONIPITEMVAR: _Mdata.INPROCESS[i].CONIPITEMVAR,

                            ACTION: "ACTION",

                            EditFN: (v) {
                              //
                              // print(_Mdata.INPROCESS[i].ITEMsname);

                              P6INSPECTION_FINAL_GET_STEP1(
                                      P6INSPECTIONstdNvar_BASIC.CP)
                                  .then((dynamic result) {
                                // print(result);
                                P6ClearFINAL();
                                if (result['ITEMs'] != null) {
                                  if (result['ITEMs'].length > 0) {
                                    for (int i = 0;
                                        i < result['ITEMs'].length;
                                        i++) {
                                      P6INSPECTIONstdNvar_FINAL.List_ITEMs.add(
                                          MapEntry(
                                              result['ITEMs'][i]['ITEMs']
                                                  .toString(),
                                              result['ITEMs'][i]['masterID']
                                                  .toString()));

                                      P6INSPECTIONstdNvar_FINAL.List_ITEMs_set
                                          .add(
                                        P6List_ITEMs_SET_Class(
                                          ITEMs: result['ITEMs'][i]['ITEMs'] !=
                                                  null
                                              ? result['ITEMs'][i]['ITEMs']
                                                  .toString()
                                              : '',
                                          RESULTFORMAT: result['ITEMs'][i]
                                                      ['RESULTFORMAT'] !=
                                                  null
                                              ? result['ITEMs'][i]
                                                      ['RESULTFORMAT']
                                                  .toString()
                                              : '',
                                          TYPE:
                                              result['ITEMs'][i]['TYPE'] != null
                                                  ? result['ITEMs'][i]['TYPE']
                                                      .toString()
                                                  : '',
                                          GRAPHTYPE: result['ITEMs'][i]
                                                      ['GRAPHTYPE'] !=
                                                  null
                                              ? result['ITEMs'][i]['GRAPHTYPE']
                                                  .toString()
                                              : '',
                                          INTERSECTION: result['ITEMs'][i]
                                                      ['INTERSECTION'] !=
                                                  null
                                              ? result['ITEMs'][i]
                                                      ['INTERSECTION']
                                                  .toString()
                                              : '',
                                          masterID: result['ITEMs'][i]
                                                      ['masterID'] !=
                                                  null
                                              ? result['ITEMs'][i]['masterID']
                                                  .toString()
                                              : '',
                                        ),
                                      );
                                    }
                                  }
                                }

                                setState(() {
                                  P6NewdataFINAL();
                                });
                              });

                              P6ClearINPROCESS();
                              P6INSPECTIONstdNvar_INPROCESS.seq =
                                  _Mdata.INPROCESS[i].seq;
                              //---------------------

                              P6INSPECTIONstdNvar_INPROCESS.List_ITEMs = [
                                MapEntry("-", "-")
                              ];
                              P6INSPECTIONstdNvar_INPROCESS.List_ITEMs.add(
                                MapEntry(
                                  _Mdata.INPROCESS[i].ITEMsname,
                                  _Mdata.INPROCESS[i].ITEMs,
                                ),
                              );

                              P6INSPECTIONstdNvar_INPROCESS.ITEMs =
                                  _Mdata.INPROCESS[i].ITEMs;

                              for (var i = 0;
                                  i <
                                      P6INSPECTIONstdNvar_INPROCESS
                                          .List_ITEMs_set.length;
                                  i++) {
                                if (P6INSPECTIONstdNvar_INPROCESS
                                        .List_ITEMs_set[i].masterID ==
                                    _Mdata.INPROCESS[i].ITEMs) {
                                  P6INSPECTIONstdNvar_INPROCESS.TYPE =
                                      P6INSPECTIONstdNvar_INPROCESS
                                          .List_ITEMs_set[i].TYPE;
                                  P6INSPECTIONstdNvar_INPROCESS.RESULTFORMAT =
                                      P6INSPECTIONstdNvar_INPROCESS
                                          .List_ITEMs_set[i].RESULTFORMAT;
                                  break;
                                }
                              }

                              if (P6INSPECTIONstdNvar_INPROCESS.RESULTFORMAT !=
                                  '-') {
                                P6INSPECTION_INPROCESS_GET_STEP2(
                                        _Mdata.INPROCESS[i].ITEMs)
                                    .then((dynamic result) {
                                  // print(result);

                                  setState(() {
                                    P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS.List_LOAD
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS.List_GT
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
                                        P6INSPECTIONstdNvar_INPROCESS.List_UNIT
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS
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
                                        P6INSPECTIONstdNvar_INPROCESS
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

                              P6INSPECTIONstdNvar_INPROCESS.K1b =
                                  _Mdata.INPROCESS[i].K1b;
                              P6INSPECTIONstdNvar_INPROCESS.K1v =
                                  _Mdata.INPROCESS[i].K1v;
                              P6INSPECTIONstdNvar_INPROCESS.TYPE =
                                  _Mdata.INPROCESS[i].TYPE;
                              P6INSPECTIONstdNvar_INPROCESS.RESULTFORMAT =
                                  _Mdata.INPROCESS[i].RESULTFORMAT;
                              P6INSPECTIONstdNvar_INPROCESS.GRAPHTYPE =
                                  _Mdata.INPROCESS[i].GRAPHTYPE;
                              P6INSPECTIONstdNvar_INPROCESS.INTERSECTION =
                                  _Mdata.INPROCESS[i].INTERSECTION;
                              // P6INSPECTIONstdNvar_INPROCESS.COREtype = _Mdata.INPROCESS[i].COREtype;
                              // P6INSPECTIONstdNvar_INPROCESS.FORMULA = _Mdata.INPROCESS[i].FORMULA;
                              P6INSPECTIONstdNvar_INPROCESS.SCMARK =
                                  _Mdata.INPROCESS[i].SCMARK;
                              // P6INSPECTIONstdNvar_INPROCESS.SCMARKTYPE = _Mdata.INPROCESS[i].SCMARKTYPE;
                              P6INSPECTIONstdNvar_INPROCESS.DOCUMENT =
                                  _Mdata.INPROCESS[i].DOCUMENT;
                              P6INSPECTIONstdNvar_INPROCESS.METHOD =
                                  _Mdata.INPROCESS[i].METHOD;
                              // P6INSPECTIONstdNvar_INPROCESS.IMGreaddata = _Mdata.INPROCESS[i].IMGreaddata;
                              // P6INSPECTIONstdNvar_INPROCESS.IMGno = _Mdata.INPROCESS[i].IMGno;
                              P6INSPECTIONstdNvar_INPROCESS.LOAD =
                                  _Mdata.INPROCESS[i].LOAD;
                              // P6INSPECTIONstdNvar_INPROCESS.GT = _Mdata.INPROCESS[i].GT;
                              P6INSPECTIONstdNvar_INPROCESS.SPECIFICATION =
                                  _Mdata.INPROCESS[i].SPECIFICATION;
                              P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONstr =
                                  _Mdata.INPROCESS[i].SPECIFICATIONstr;
                              P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONve =
                                  _Mdata.INPROCESS[i].SPECIFICATIONve;
                              P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONveOB =
                                  NveOB(
                                condition:
                                    _Mdata.INPROCESS[i].SPECIFICATIONcondition,
                                BTW_HI: _Mdata.INPROCESS[i].SPECIFICATIONBTW_HI,
                                BTW_LOW:
                                    _Mdata.INPROCESS[i].SPECIFICATIONBTW_LOW,
                                HIM_L: _Mdata.INPROCESS[i].SPECIFICATIONHIM_L,
                                LOL_H: _Mdata.INPROCESS[i].SPECIFICATIONLOL_H,
                                TARGET: _Mdata.INPROCESS[i].SPECIFICATIONTARGET,
                              );
                              P6INSPECTIONstdNvar_INPROCESS.UNIT =
                                  _Mdata.INPROCESS[i].UNIT;
                              // P6INSPECTIONstdNvar_INPROCESS.UNIT_CONVERST = _Mdata.INPROCESS[i].UNIT_CONVERST;
                              P6INSPECTIONstdNvar_INPROCESS.CONVERSEDATA =
                                  _Mdata.INPROCESS[i].CONVERSEDATA;
                              // static String POINTPCS = "-";
                              P6INSPECTIONstdNvar_INPROCESS.POINT =
                                  _Mdata.INPROCESS[i].POINT;
                              P6INSPECTIONstdNvar_INPROCESS.PCS =
                                  _Mdata.INPROCESS[i].PCS;
                              P6INSPECTIONstdNvar_INPROCESS.FREQUENCY =
                                  _Mdata.INPROCESS[i].FREQUENCY;
                              // P6INSPECTIONstdNvar_INPROCESS.REMARK = _Mdata.INPROCESS[i].REMARK;
                              // P6INSPECTIONstdNvar_INPROCESS.RESULTFORMATdata = _Mdata.INPROCESS[i].RESULTFORMATdata;
                              P6INSPECTIONstdNvar_INPROCESS.SWreport =
                                  _Mdata.INPROCESS[i].SWreport;
                              P6INSPECTIONstdNvar_INPROCESS.SUMDATA =
                                  _Mdata.INPROCESS[i].SUMdata;
                              P6INSPECTIONstdNvar_INPROCESS.SRAWDATA =
                                  _Mdata.INPROCESS[i].SRAWDATA;
                              P6INSPECTIONstdNvar_INPROCESS.AQL =
                                  _Mdata.INPROCESS[i].AQL;
                              P6INSPECTIONstdNvar_INPROCESS.AQLV =
                                  _Mdata.INPROCESS[i].AQLV;

                              P6INSPECTIONstdNvar_INPROCESS.CONIP =
                                  _Mdata.INPROCESS[i].CONIP;
                              P6INSPECTIONstdNvar_INPROCESS.CONIPITEM =
                                  _Mdata.INPROCESS[i].CONIPITEM;

                              P6INSPECTIONstdNvar_INPROCESS.CONIPITEMVAR =
                                  _Mdata.INPROCESS[i].CONIPITEMVAR;

                              setState(() {
                                P6INSPECTIONstdNvar_INPROCESS.POP = true;
                              });
                            },
                            DeleteFN: (s) {
                              P6INSPECTIONstdNvar_INPROCESS.ITEMs =
                                  _Mdata.INPROCESS[i].ITEMs;
                              context
                                  .read<P6UPLOADSPEC_Bloc>()
                                  .add(DELETESPEC_INPROCESS());
                            },
                            isACTION: true,
                          ),
                        ),
                      ],
                      if (P6INSPECTIONstdNvar_INPROCESS.POP) ...[
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
                                        P6ClearINPROCESS();
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
                                    child: PATTERNIPtable(
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
                                      CONIP: "to final",
                                      CONIPITEM: "COM ITEMs",
                                      CONIPITEMVAR: "VAR",
                                      ACTION: "ACTION",
                                      isACTION: false,
                                    ),
                                  ),
                                  Container(
                                    constraints: BoxConstraints(minHeight: 80),
                                    child: PATTERNIPtable(
                                      ShowCORStype: false,
                                      ShowLOAD: false,
                                      ShowGT: false,
                                      ShowCONVERSE: false,
                                      ShowFORMULA: false,
                                      BGColorMain: Colors.white,
                                      seq: "seq",
                                      ITEMs: "ITEMs",
                                      WIDGETITEMs: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_INPROCESS
                                                .ITEMs !=
                                            '-',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .List_ITEMs,
                                        onChangeinside: (d, k) async {
                                          // print(d);
                                          P6INSPECTIONstdNvar_INPROCESS.ITEMs =
                                              d;
                                          for (var i = 0;
                                              i <
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .List_ITEMs_set.length;
                                              i++) {
                                            if (P6INSPECTIONstdNvar_INPROCESS
                                                    .List_ITEMs_set[i]
                                                    .masterID ==
                                                d) {
                                              P6INSPECTIONstdNvar_INPROCESS
                                                      .TYPE =
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .List_ITEMs_set[i].TYPE;
                                              P6INSPECTIONstdNvar_INPROCESS
                                                      .RESULTFORMAT =
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .List_ITEMs_set[i]
                                                      .RESULTFORMAT;
                                              break;
                                            }
                                          }
                                          print(P6INSPECTIONstdNvar_INPROCESS
                                              .RESULTFORMAT);

                                          if (d != '-') {
                                            P6INSPECTION_INPROCESS_GET_STEP2(d)
                                                .then((dynamic result) {
                                              // print(result);

                                              setState(() {
                                                P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS.List_METHOD
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                            P6INSPECTIONstdNvar_INPROCESS.ITEMs,
                                        height: 40,
                                        width: 400,
                                      ),
                                      K1CALDATA: "Constant",
                                      WIDGETK1CALDATA: Column(
                                        children: [
                                          AdvanceDropDown(
                                            isEnable:
                                                P6INSPECTIONstdNvar_INPROCESS
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
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .K1b = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INPROCESS
                                                .K1b,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_INPROCESS
                                                  .K1b ==
                                              '1') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              isNumberOnly: true,
                                              height: 40,
                                              width: 200,
                                              isContr:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .K1v,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INPROCESS
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
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .List_SCMARK,
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .SCMARK = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INPROCESS
                                                .SCMARK,
                                            height: 40,
                                            width: 400,
                                          ),
                                          if (P6INSPECTIONstdNvar_INPROCESS
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
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .SCMARKTYPE = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INPROCESS
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
                                      //       P6INSPECTIONstdNvar_INPROCESS.iscontrol,
                                      //   isEnabled: P6INSPECTIONstdNvar_INPROCESS
                                      //       .ACTION_isEnabled,
                                      //   fnContr: (input) {
                                      //     setState(() {
                                      //       P6INSPECTIONstdNvar_INPROCESS
                                      //           .iscontrol = input;
                                      //     });
                                      //   },
                                      //   sValue:
                                      //       P6INSPECTIONstdNvar_INPROCESS.DOCUMENT,
                                      //   returnfunc: (String s) {
                                      //     P6INSPECTIONstdNvar_INPROCESS.DOCUMENT =
                                      //         s;
                                      //   },
                                      // ),
                                      WIDGETDOCUMENT: Container(
                                        height: 40,
                                        width: 400,
                                        child: Center(
                                          child: Text(
                                            P6INSPECTIONstdNvar_INPROCESS
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
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .List_METHOD,
                                            onChangeinside: (d, k) async {
                                              P6INSPECTIONstdNvar_INPROCESS
                                                  .METHOD = d;
                                              print(d);
                                              final response = await Dio().post(
                                                serverGB +
                                                    "GET_INPROCESS_DOCUMENT",
                                                data: {
                                                  "ITEMs":
                                                      P6INSPECTIONstdNvar_INPROCESS
                                                          .ITEMs,
                                                  "METHODid":
                                                      P6INSPECTIONstdNvar_INPROCESS
                                                          .METHOD,
                                                },
                                              );

                                              // print(response);
                                              if (response.statusCode == 200) {
                                                var databuff = response.data;

                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .iscontrol = true;
                                                P6INSPECTIONstdNvar_INPROCESS
                                                        .DOCUMENT =
                                                    databuff['DOCUMENT'];
                                                setState(() {});
                                              }
                                            },
                                            value: P6INSPECTIONstdNvar_INPROCESS
                                                .METHOD,
                                            height: 40,
                                            width: 400,
                                          ),
                                          if (P6INSPECTIONstdNvar_INPROCESS
                                                      .RESULTFORMATdata ==
                                                  'Picture' ||
                                              P6INSPECTIONstdNvar_INPROCESS
                                                      .RESULTFORMATdata ==
                                                  'OCR') ...[
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: MethodePIC,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .IMGreaddata = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .IMGreaddata,
                                              height: 40,
                                              width: 400,
                                            ),
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .List_IMGno,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .IMGno = d;
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INPROCESS
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
                                          if (P6INSPECTIONstdNvar_INPROCESS
                                                      .RESULTFORMAT !=
                                                  'Text' &&
                                              P6INSPECTIONstdNvar_INPROCESS
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
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATIONveOB
                                                      .condition = d;
                                                  setState(() {});
                                                },
                                                value:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .condition,
                                                height: 40,
                                                width: 200,
                                              ),
                                            ),
                                            if (P6INSPECTIONstdNvar_INPROCESS
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "BTW_HI",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .BTW_HI,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .BTW_LOW,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATIONveOB
                                                      .BTW_LOW = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INPROCESS
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'HIM(>)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "HIM_L",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .HIM_L,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATIONveOB
                                                      .HIM_L = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INPROCESS
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'LOL(<)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "LOL_H",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .LOL_H,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATIONveOB
                                                      .LOL_H = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONveOB.condition == 'HIM(>)' ||
                                                P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'LOL(<)' ||
                                                P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "TARGET",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .SPECIFICATIONveOB
                                                        .TARGET,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_INPROCESS
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
                                                    P6INSPECTIONstdNvar_INPROCESS
                                                        .List_SPECIFICATIONt,
                                                onChangeinside: (d, k) {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATION = d;
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SPECIFICATIONstr = k;
                                                },
                                                value:
                                                    P6INSPECTIONstdNvar_INPROCESS
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
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INPROCESS.UNIT =
                                              d;
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_INPROCESS.UNIT,
                                        height: 40,
                                        width: 400,
                                      ),

                                      WIDGETCONVERSE: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INPROCESS
                                              .UNIT_CONVERST = d;
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
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
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .CONVERSEDATA = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
                                            .CONVERSEDATA,
                                        height: 40,
                                        width: 80,
                                      ),
                                      POSITION: "POSITION",
                                      WIDGETPOSITION: ComInputText(
                                        nLimitedChar: 100,

                                        height: 40,
                                        width: 400,
                                        isContr: P6INSPECTIONstdNvar_INPROCESS
                                            .iscontrol,
                                        // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                        fnContr: (input) {
                                          print(input);
                                          setState(() {
                                            setState(() {
                                              P6INSPECTIONstdNvar_INPROCESS
                                                  .iscontrol = input;
                                            });
                                          });
                                        },
                                        sValue:
                                            P6INSPECTIONstdNvar_INPROCESS.POINT,
                                        returnfunc: (String s) {
                                          P6INSPECTIONstdNvar_INPROCESS.POINT =
                                              s;
                                        },
                                      ),
                                      PCS: "PCS",
                                      WIDGETPCS: (P6INSPECTIONstdNvar_INPROCESS
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
                                                      P6INSPECTIONstdNvar_INPROCESS
                                                          .AQL = d;
                                                    });
                                                  },
                                                  value:
                                                      P6INSPECTIONstdNvar_INPROCESS
                                                          .AQL,
                                                  height: 40,
                                                  width: 80,
                                                ),
                                                if (P6INSPECTIONstdNvar_INPROCESS
                                                        .AQL ==
                                                    'YES') ...[
                                                  ComInputText(
                                                    nLimitedChar: 100,
                                                    sLabel: "%AQL",
                                                    height: 40,
                                                    width: 400,
                                                    isContr:
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .AQLV,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_INPROCESS
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
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_INPROCESS
                                                            .PCS,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_INPROCESS
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
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .PCS,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .PCS = s;
                                              },
                                            ),
                                      FREQUENCY: "FREQUENCY",
                                      WIDGETFREQUENCY: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .List_FREQUENCY,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INPROCESS
                                              .FREQUENCY = d;
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
                                            .FREQUENCY,
                                        height: 40,
                                        width: 400,
                                      ),
                                      REMARK: "REMARK",
                                      WIDGETREMARK: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .List_COMMENT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_INPROCESS.REMARK =
                                              d;
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
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
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .SWreport = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
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
                                                P6INSPECTIONstdNvar_INPROCESS
                                                    .SUMDATA = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_INPROCESS
                                                .SUMDATA,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_INPROCESS
                                                  .AQL ==
                                              'SUMDATA') ...[
                                            ComInputText(
                                              nLimitedChar: 100,

                                              height: 40,
                                              width: 400,
                                              isContr:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .SUMDATATEXT,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_INPROCESS
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
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .SRAWDATA = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_INPROCESS
                                            .SRAWDATA,
                                        height: 40,
                                        width: 80,
                                      ),

                                      CONIP: "to final",
                                      WIDGETCONIP: AdvanceDropDown(
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
                                            P6INSPECTIONstdNvar_INPROCESS
                                                .CONIP = d;
                                          });
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_INPROCESS.CONIP,
                                        height: 40,
                                        width: 80,
                                      ),
                                      CONITEM: "ITEM final",
                                      WIDGETCONIPITEM: Column(
                                        children: [
                                          if (P6INSPECTIONstdNvar_INPROCESS
                                                  .CONIP ==
                                              'YES') ...[
                                            AdvanceDropDown(
                                              // isEnable: true,
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown:
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .List_ITEMs,
                                              onChangeinside: (d, k) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .CONIPITEM = d;
                                                });
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .CONIPITEM,
                                              height: 40,
                                              width: 200,
                                            ),
                                            AdvanceDropDown(
                                              // isEnable: true,
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: [
                                                MapEntry("-", "-"),
                                                MapEntry("X", "X"),
                                                MapEntry("X-Y", "X-Y"),
                                                MapEntry("X-Y-Z", "X-Y-Z"),
                                              ],
                                              onChangeinside: (d, k) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .CONIPITEMVAR = d;
                                                });
                                              },
                                              value:
                                                  P6INSPECTIONstdNvar_INPROCESS
                                                      .CONIPITEMVAR,
                                              height: 40,
                                              width: 200,
                                            )
                                          ],
                                        ],
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
                                        if (P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'Text' ||
                                            P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'Picture') {
                                          context.read<P6UPLOADSPEC_Bloc>().add(
                                              P6UPLOADSPEC_INPROCESS_TEXT());
                                        } else if (P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'OCR' ||
                                            P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'Number' ||
                                            P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'Graph' ||
                                            P6INSPECTIONstdNvar_INPROCESS
                                                    .RESULTFORMAT ==
                                                'CAL1') {
                                          context.read<P6UPLOADSPEC_Bloc>().add(
                                              P6UPLOADSPEC_INPROCESS_NUM());
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
