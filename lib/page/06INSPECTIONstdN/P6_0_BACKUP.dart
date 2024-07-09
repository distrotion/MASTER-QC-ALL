import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/06-1-P6FINSPECTIONget.dart';
import '../../bloc/BlocEvent/06-4-P6UPLOADSPEC.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import 'P6INSPECTIONstdFunction_FN.dart';
import 'P6INSPECTIONstdNvar.dart';

ScrollController _controllerIN01 = ScrollController();
ScrollController _controllerIN02 = ScrollController();

class INSFINALBACKUP extends StatefulWidget {
  INSFINALBACKUP({super.key, this.Mdata});
  P6InspectionSTD? Mdata;
  @override
  State<INSFINALBACKUP> createState() => _INSFINALBACKUPState();
}

class _INSFINALBACKUPState extends State<INSFINALBACKUP> {
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
      // height: 300,
      // width: 1000,
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text("FINAL PATTERN"),
              Spacer(),
              InkWell(
                onTap: () {
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
                            RESULTFORMAT: result['ITEMs'][i]['RESULTFORMAT'] !=
                                    null
                                ? result['ITEMs'][i]['RESULTFORMAT'].toString()
                                : '',
                            TYPE: result['ITEMs'][i]['TYPE'] != null
                                ? result['ITEMs'][i]['TYPE'].toString()
                                : '',
                            GRAPHTYPE: result['ITEMs'][i]['GRAPHTYPE'] != null
                                ? result['ITEMs'][i]['GRAPHTYPE'].toString()
                                : '',
                            INTERSECTION: result['ITEMs'][i]['INTERSECTION'] !=
                                    null
                                ? result['ITEMs'][i]['INTERSECTION'].toString()
                                : '',
                            masterID: result['ITEMs'][i]['masterID'] != null
                                ? result['ITEMs'][i]['masterID'].toString()
                                : '',
                          ));
                        }
                      }
                    }

                    setState(() {
                      P6NewdataFINAL();
                    });
                  });
                },
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
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 15,
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
                          POSITION: "POSITION",
                          PCS: "PCS",
                          FREQUENCY: "FREQUENCY",
                          REMARK: "REMARK",
                          SWreport: "SHOW REPORT",
                          ACTION: "ACTION",
                          isACTION: false,
                        ),
                      ),
                      for (int i = 0; i < _Mdata.FINAL.length; i++) ...[
                        Container(
                          height: 40,
                          child: PATTERNtable(
                            ShowCORStype: false,
                            ShowLOAD: false,
                            ShowGT: false,
                            ShowCONVERSE: false,
                            ShowFORMULA: false,
                            BGColorMain: i.isEven
                                ? Colors.grey.shade50
                                : Colors.grey.shade200,
                            seq: _Mdata.FINAL[i].seq,
                            ITEMs: _Mdata.FINAL[i].ITEMsname,

                            K1CALDATA:
                                _KSW(_Mdata.FINAL[i].K1b, _Mdata.FINAL[i].K1v),
                            // "${_Mdata.FINAL[i].K1b}(${_Mdata.FINAL[i].K1v})",
                            CORStype: "-",
                            FORMULA: "-",
                            SCMARK: _Mdata.FINAL[i].SCMARK,
                            SCMARKtype: "-",
                            DOCUMENT: _Mdata.FINAL[i].DOCUMENT,
                            METHOD: _Mdata.FINAL[i].METHODname,
                            IMGreaddata: "-",
                            IMGno: "-",
                            LOAD: _Mdata.FINAL[i].LOAD,
                            GT: "-",
                            SPECIFICATIONve:
                                _Mdata.FINAL[i].SPECIFICATIONvename,
                            CALCULATE: "-",
                            UNIT: _Mdata.FINAL[i].UNITname,
                            CONVERSE: _Mdata.FINAL[i].CONVERSEname,
                            POSITION: _Mdata.FINAL[i].POINT,
                            PCS: _Mdata.FINAL[i].PCS,
                            FREQUENCY: _Mdata.FINAL[i].FREQUENCY,
                            REMARK: _Mdata.FINAL[i].REMARK,
                            SWreport: _Mdata.FINAL[i].SWreport,
                            ACTION: "ACTION",

                            EditFN: (v) {
                              //
                              // print(_Mdata.FINAL[i].ITEMsname);

                              P6ClearFINAL();
                              P6INSPECTIONstdNvar_FINAL.seq =
                                  _Mdata.FINAL[i].seq;
                              //---------------------
                              // P6INSPECTIONstdNvar_FINAL.List_ITEMs = [
                              //   MapEntry("-", "-")
                              // ];
                              // P6INSPECTIONstdNvar_FINAL.List_ITEMs.add(
                              //     MapEntry(_Mdata.FINAL[i].ITEMsname,
                              //         _Mdata.FINAL[i].ITEMs));

                              P6INSPECTION_FINAL_GET_STEP1(
                                      P6INSPECTIONstdNvar_BASIC.CP)
                                  .then((dynamic result) {
                                // print(result);

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
                                          .add(P6List_ITEMs_SET_Class(
                                        ITEMs:
                                            result['ITEMs'][i]['ITEMs'] != null
                                                ? result['ITEMs'][i]['ITEMs']
                                                    .toString()
                                                : '',
                                        RESULTFORMAT: result['ITEMs'][i]
                                                    ['RESULTFORMAT'] !=
                                                null
                                            ? result['ITEMs'][i]['RESULTFORMAT']
                                                .toString()
                                            : '',
                                        TYPE: result['ITEMs'][i]['TYPE'] != null
                                            ? result['ITEMs'][i]['TYPE']
                                                .toString()
                                            : '',
                                        masterID: result['ITEMs'][i]
                                                    ['masterID'] !=
                                                null
                                            ? result['ITEMs'][i]['masterID']
                                                .toString()
                                            : '',
                                      ));
                                    }
                                  }
                                }
                                //
                                P6INSPECTIONstdNvar_FINAL.ITEMs =
                                    _Mdata.FINAL[i].ITEMs;

                                for (int j = 0;
                                    j <
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set.length;
                                    j++) {
                                  if (P6INSPECTIONstdNvar_FINAL
                                          .List_ITEMs_set[j].masterID ==
                                      _Mdata.FINAL[i].ITEMs) {
                                    P6INSPECTIONstdNvar_FINAL.TYPE =
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set[j].TYPE;
                                    P6INSPECTIONstdNvar_FINAL.RESULTFORMAT =
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set[j].RESULTFORMAT;
                                    break;
                                  }
                                }

                                if (_Mdata.FINAL[i].ITEMs != '-') {
                                  P6INSPECTION_FINAL_GET_STEP2(
                                          _Mdata.FINAL[i].ITEMs)
                                      .then((dynamic result) {
                                    setState(() {
                                      P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL.List_METHOD
                                              .add(MapEntry(
                                                  result['METHOD'][i]['METHOD']
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
                                          P6INSPECTIONstdNvar_FINAL.List_LOAD
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
                                          P6INSPECTIONstdNvar_FINAL
                                                  .List_CORETYPE
                                              .add(MapEntry(
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
                                          P6INSPECTIONstdNvar_FINAL.List_GT.add(
                                              MapEntry(
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
                                          P6INSPECTIONstdNvar_FINAL.List_UNIT
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                      print(result['COMMENT']);
                                      if (result['COMMENT'] != null &&
                                          result['COMMENT'].length > 0) {
                                        for (int i = 0;
                                            i < result['COMMENT'].length;
                                            i++) {
                                          P6INSPECTIONstdNvar_FINAL.List_COMMENT
                                              .add(MapEntry(
                                                  result['COMMENT'][i]
                                                          ['COMMENT']
                                                      .toString(),
                                                  result['COMMENT'][i]
                                                          ['masterID']
                                                      .toString()));
                                        }
                                      }
                                    });

                                    P6INSPECTIONstdNvar_FINAL.COREtype = "-";
                                    P6INSPECTIONstdNvar_FINAL.FORMULA = "-";
                                    P6INSPECTIONstdNvar_FINAL.SCMARK =
                                        _Mdata.FINAL[i].SCMARK;
                                    P6INSPECTIONstdNvar_FINAL.SCMARKTYPE = "-";
                                    P6INSPECTIONstdNvar_FINAL.DOCUMENT =
                                        _Mdata.FINAL[i].DOCUMENT;

                                    if (_Mdata.FINAL[i].METHOD != '-') {
                                      // P6INSPECTIONstdNvar_FINAL.List_METHOD = [
                                      //   MapEntry("-", "-"),
                                      //   MapEntry(_Mdata.FINAL[i].METHODname,
                                      //       _Mdata.FINAL[i].METHOD)
                                      // ];

                                      P6INSPECTIONstdNvar_FINAL.METHOD =
                                          _Mdata.FINAL[i].METHOD;

                                      // print(response);
                                    }

                                    P6INSPECTIONstdNvar_FINAL.IMGreaddata = "-";
                                    P6INSPECTIONstdNvar_FINAL.IMGno = "-";

                                    P6INSPECTIONstdNvar_FINAL.LOAD =
                                        _Mdata.FINAL[i].LOAD;

                                    P6INSPECTIONstdNvar_FINAL.GT = "-";
                                    P6INSPECTIONstdNvar_FINAL.SPECIFICATION =
                                        _Mdata.FINAL[i].SPECIFICATION;

                                    P6INSPECTIONstdNvar_FINAL.SPECIFICATIONstr =
                                        _Mdata.FINAL[i].SPECIFICATIONstr;

                                    P6INSPECTIONstdNvar_FINAL.SPECIFICATIONve =
                                        "-";
                                    P6INSPECTIONstdNvar_FINAL
                                        .SPECIFICATIONveOB = NveOB();

                                    // P6INSPECTIONstdNvar_FINAL
                                    //         .SPECIFICATIONveOB
                                    //         .condition =
                                    //     _Mdata.FINAL[i]
                                    //         .SPECIFICATIONcondition;

                                    P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB =
                                        NveOB(
                                            condition: _Mdata.FINAL[i]
                                                .SPECIFICATIONcondition,
                                            BTW_HI: _Mdata
                                                .FINAL[i].SPECIFICATIONBTW_HI,
                                            BTW_LOW: _Mdata
                                                .FINAL[i].SPECIFICATIONBTW_LOW,
                                            HIM_L: _Mdata
                                                .FINAL[i].SPECIFICATIONHIM_L,
                                            LOL_H: _Mdata
                                                .FINAL[i].SPECIFICATIONLOL_H,
                                            TARGET: _Mdata
                                                .FINAL[i].SPECIFICATIONTARGET);
                                    if (_Mdata.FINAL[i].UNIT != '-') {
                                      // P6INSPECTIONstdNvar_FINAL.List_UNIT = [
                                      //   MapEntry("-", "-"),
                                      //   MapEntry(_Mdata.FINAL[i].UNITname,
                                      //       _Mdata.FINAL[i].UNIT)
                                      // ];

                                      P6INSPECTIONstdNvar_FINAL.UNIT =
                                          _Mdata.FINAL[i].UNIT;
                                    } else {
                                      P6INSPECTIONstdNvar_FINAL.UNIT = "-";
                                    }

                                    if (_Mdata.FINAL[i].CONVERSE != '-') {
                                      // P6INSPECTIONstdNvar_FINAL
                                      //     .List_UNIT_CONVERST = [
                                      //   MapEntry("-", "-"),
                                      //   MapEntry(_Mdata.FINAL[i].CONVERSEname,
                                      //       _Mdata.FINAL[i].CONVERSE)
                                      // ];

                                      P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST =
                                          _Mdata.FINAL[i].CONVERSE;
                                    } else {
                                      P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST =
                                          "-";
                                    }

                                    P6INSPECTIONstdNvar_FINAL.POINT = "-";
                                    P6INSPECTIONstdNvar_FINAL.POINT =
                                        _Mdata.FINAL[i].POINT;
                                    P6INSPECTIONstdNvar_FINAL.PCS =
                                        _Mdata.FINAL[i].PCS;
                                    // P6INSPECTIONstdNvar_FINAL.FREQUENCY =
                                    //     _Mdata.FINAL[i].FREQUENCY;

                                    if (_Mdata.FINAL[i].FREQUENCY != '-') {
                                      // P6INSPECTIONstdNvar_FINAL.List_FREQUENCY =
                                      //     [
                                      //   MapEntry("-", "-"),
                                      //   MapEntry(_Mdata.FINAL[i].FREQUENCY,
                                      //       _Mdata.FINAL[i].FREQUENCY)
                                      // ];

                                      P6INSPECTIONstdNvar_FINAL.FREQUENCY =
                                          _Mdata.FINAL[i].FREQUENCY;
                                    } else {
                                      P6INSPECTIONstdNvar_FINAL.FREQUENCY = "-";
                                    }
                                    P6INSPECTIONstdNvar_FINAL.REMARK =
                                        _Mdata.FINAL[i].REMARK;

                                    P6INSPECTIONstdNvar_FINAL.RESULTFORMATdata =
                                        _Mdata.FINAL[i].RESULTFORMAT;
                                    P6INSPECTIONstdNvar_FINAL.SWreport = "-";

                                    P6INSPECTIONstdNvar_FINAL.CALCULATE = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K1 = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K2 = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K3 = "-";

                                    P6INSPECTIONstdNvar_FINAL.CAL_K1_N = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K2_N = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K3_N = "-";
                                    P6INSPECTIONstdNvar_FINAL.CAL_K1b = false;
                                    P6INSPECTIONstdNvar_FINAL.CAL_K2b = false;
                                    P6INSPECTIONstdNvar_FINAL.CAL_K3b = false;
                                  });
                                }

                                if (P6INSPECTIONstdNvar_FINAL.POP) {
                                  setState(() {
                                    P6INSPECTIONstdNvar_FINAL.POP = false;
                                  });
                                } else {
                                  setState(() {
                                    P6INSPECTIONstdNvar_FINAL.POP = true;
                                  });
                                }
                              });

                              //
                            },
                            DeleteFN: (s) {
                              P6INSPECTIONstdNvar_FINAL.ITEMs =
                                  _Mdata.FINAL[i].ITEMs;
                              context
                                  .read<P6UPLOADSPEC_Bloc>()
                                  .add(DELETESPEC_FINAL());
                            },
                            isACTION: true,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (P6INSPECTIONstdNvar_FINAL.POP) ...[
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
                  // height: 40,
                  width: 2500,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onLongPress: () {
                            P6ClearFINAL();
                            P6INSPECTION_FINAL_GET_STEP1(
                                    P6INSPECTIONstdNvar_BASIC.CP)
                                .then((dynamic result) {
                              // print(result);

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
                                              .toString()),
                                    );
                                    P6INSPECTIONstdNvar_FINAL.List_ITEMs_set
                                        .add(P6List_ITEMs_SET_Class(
                                      ITEMs: result['ITEMs'][i]['ITEMs'] != null
                                          ? result['ITEMs'][i]['ITEMs']
                                              .toString()
                                          : '',
                                      RESULTFORMAT: result['ITEMs'][i]
                                                  ['RESULTFORMAT'] !=
                                              null
                                          ? result['ITEMs'][i]['RESULTFORMAT']
                                              .toString()
                                          : '',
                                      TYPE: result['ITEMs'][i]['TYPE'] != null
                                          ? result['ITEMs'][i]['TYPE']
                                              .toString()
                                          : '',
                                      masterID:
                                          result['ITEMs'][i]['masterID'] != null
                                              ? result['ITEMs'][i]['masterID']
                                                  .toString()
                                              : '',
                                    ));
                                  }
                                }
                              }

                              setState(() {});
                            });
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
                            POSITION: "POSITION",
                            PCS: "PCS",
                            FREQUENCY: "FREQUENCY",
                            REMARK: "REMARK",
                            SWreport: "SHOW REPORT",
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
                            seq: P6INSPECTIONstdNvar_FINAL.seq,
                            ITEMs: "ITEMs",
                            WIDGETITEMs: AdvanceDropDown(
                              isEnable: P6INSPECTIONstdNvar_FINAL.ITEMs != '-',
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_ITEMs,
                              onChangeinside: (d, k) {
                                // print(d);
                                P6INSPECTIONstdNvar_FINAL.ITEMs = d;
                                for (var i = 0;
                                    i <
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set.length;
                                    i++) {
                                  if (P6INSPECTIONstdNvar_FINAL
                                          .List_ITEMs_set[i].masterID ==
                                      d) {
                                    P6INSPECTIONstdNvar_FINAL.TYPE =
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set[i].TYPE;
                                    P6INSPECTIONstdNvar_FINAL.RESULTFORMAT =
                                        P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs_set[i].RESULTFORMAT;
                                    break;
                                  }
                                }

                                if (d != '-') {
                                  P6INSPECTION_FINAL_GET_STEP2(d)
                                      .then((dynamic result) {
                                    // print(result);

                                    setState(() {
                                      P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL.List_METHOD
                                              .add(MapEntry(
                                                  result['METHOD'][i]['METHOD']
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
                                          P6INSPECTIONstdNvar_FINAL.List_LOAD
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
                                          P6INSPECTIONstdNvar_FINAL
                                                  .List_CORETYPE
                                              .add(MapEntry(
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
                                          P6INSPECTIONstdNvar_FINAL.List_GT.add(
                                              MapEntry(
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
                                          P6INSPECTIONstdNvar_FINAL.List_UNIT
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                          P6INSPECTIONstdNvar_FINAL
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
                                      print(result['COMMENT']);
                                      if (result['COMMENT'] != null &&
                                          result['COMMENT'].length > 0) {
                                        for (int i = 0;
                                            i < result['COMMENT'].length;
                                            i++) {
                                          P6INSPECTIONstdNvar_FINAL.List_COMMENT
                                              .add(MapEntry(
                                                  result['COMMENT'][i]
                                                          ['COMMENT']
                                                      .toString(),
                                                  result['COMMENT'][i]
                                                          ['masterID']
                                                      .toString()));
                                        }
                                      }
                                    });
                                  });
                                }
                              },
                              value: P6INSPECTIONstdNvar_FINAL.ITEMs,
                              height: 40,
                              width: 400,
                            ),
                            //   P6INSPECTIONstdNvar_FINAL.RESULTFORMAT ==
                            K1CALDATA: "Constant",
                            WIDGETK1CALDATA: Column(
                              children: [
                                AdvanceDropDown(
                                  isEnable:
                                      P6INSPECTIONstdNvar_FINAL.RESULTFORMAT !=
                                          'CAL1',
                                  imgpath: 'assets/icons/icon-down_4@3x.png',
                                  listdropdown: [
                                    MapEntry("-", "-"),
                                    MapEntry("Kcon.", "1"),
                                    MapEntry("Kvar.", "2")
                                  ],
                                  onChangeinside: (d, k) {
                                    setState(() {
                                      P6INSPECTIONstdNvar_FINAL.K1b = d;
                                    });
                                  },
                                  value: P6INSPECTIONstdNvar_FINAL.K1b,
                                  height: 40,
                                  width: 80,
                                ),
                                if (P6INSPECTIONstdNvar_FINAL.K1b == '1') ...[
                                  ComInputText(
                                    nLimitedChar: 100,
                                    isNumberOnly: true,
                                    height: 40,
                                    width: 200,
                                    isContr:
                                        P6INSPECTIONstdNvar_FINAL.iscontrol,
                                    // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                    fnContr: (input) {
                                      setState(() {
                                        P6INSPECTIONstdNvar_FINAL.iscontrol =
                                            input;
                                      });
                                    },
                                    sValue: P6INSPECTIONstdNvar_FINAL.K1v,
                                    returnfunc: (String s) {
                                      P6INSPECTIONstdNvar_FINAL.K1v = s;
                                    },
                                  ),
                                ]
                              ],
                            ),
                            CORStype: "CORStype",
                            WIDGETCORStype: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_CORETYPE,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.COREtype = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.COREtype,
                              height: 40,
                              width: 400,
                            ),

                            FORMULA: "NO USE",
                            //                   if (P6INSPECTIONstdNvar_FINAL.RESULTFORMATdata ==
                            //  'Calculate')
                            WIDGETFORMULA: P6INSPECTIONstdNvar_FINAL
                                        .RESULTFORMATdata ==
                                    'CAL1'
                                ? Column(
                                    children: [
                                      AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: P6INSPECTIONstdNvar_FINAL
                                            .List_CALCULATE,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_FINAL.CALCULATE =
                                              d;
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_FINAL.CALCULATE,
                                        height: 40,
                                        width: 400,
                                      ),
                                      if (P6INSPECTIONstdNvar_FINAL.CAL_K1b)
                                        ComInputText(
                                          nLimitedChar: 100,
                                          sLabel: P6INSPECTIONstdNvar_FINAL
                                              .CAL_K1_N,

                                          height: 40,
                                          width: 200,
                                          isContr: P6INSPECTIONstdNvar_FINAL
                                              .iscontrol,
                                          // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                          fnContr: (input) {
                                            setState(() {
                                              P6INSPECTIONstdNvar_FINAL
                                                  .iscontrol = input;
                                            });
                                          },
                                          sValue:
                                              P6INSPECTIONstdNvar_FINAL.CAL_K1,
                                          returnfunc: (String s) {
                                            P6INSPECTIONstdNvar_FINAL.CAL_K1 =
                                                s;
                                          },
                                        ),
                                      if (P6INSPECTIONstdNvar_FINAL.CAL_K2b)
                                        ComInputText(
                                          nLimitedChar: 100,
                                          sLabel: P6INSPECTIONstdNvar_FINAL
                                              .CAL_K2_N,
                                          height: 40,
                                          width: 200,
                                          isContr: P6INSPECTIONstdNvar_FINAL
                                              .iscontrol,
                                          // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                          fnContr: (input) {
                                            setState(() {
                                              P6INSPECTIONstdNvar_FINAL
                                                  .iscontrol = input;
                                            });
                                          },
                                          sValue:
                                              P6INSPECTIONstdNvar_FINAL.CAL_K2,
                                          returnfunc: (String s) {
                                            P6INSPECTIONstdNvar_FINAL.CAL_K2 =
                                                s;
                                          },
                                        ),
                                      if (P6INSPECTIONstdNvar_FINAL.CAL_K3b)
                                        ComInputText(
                                          nLimitedChar: 100,
                                          sLabel: P6INSPECTIONstdNvar_FINAL
                                              .CAL_K3_N,
                                          height: 40,
                                          width: 200,
                                          isContr: P6INSPECTIONstdNvar_FINAL
                                              .iscontrol,
                                          // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                          fnContr: (input) {
                                            setState(() {
                                              P6INSPECTIONstdNvar_FINAL
                                                  .iscontrol = input;
                                            });
                                          },
                                          sValue:
                                              P6INSPECTIONstdNvar_FINAL.CAL_K3,
                                          returnfunc: (String s) {
                                            P6INSPECTIONstdNvar_FINAL.CAL_K3 =
                                                s;
                                          },
                                        ),
                                    ],
                                  )
                                : null,
                            SCMARK: "SCMARK",
                            WIDGETSCMARK: Column(
                              children: [
                                AdvanceDropDown(
                                  imgpath: 'assets/icons/icon-down_4@3x.png',
                                  listdropdown:
                                      P6INSPECTIONstdNvar_FINAL.List_SCMARK,
                                  onChangeinside: (d, k) {
                                    setState(() {
                                      P6INSPECTIONstdNvar_FINAL.SCMARK = d;
                                    });
                                  },
                                  value: P6INSPECTIONstdNvar_FINAL.SCMARK,
                                  height: 40,
                                  width: 400,
                                ),
                                if (P6INSPECTIONstdNvar_FINAL.SCMARK == 'YES')
                                  AdvanceDropDown(
                                    imgpath: 'assets/icons/icon-down_4@3x.png',
                                    listdropdown: [
                                      MapEntry("-", "-"),
                                      MapEntry("TYPE 1", "1"),
                                      MapEntry("TYPE 2", "2")
                                    ],
                                    onChangeinside: (d, k) {
                                      P6INSPECTIONstdNvar_FINAL.SCMARKTYPE = d;
                                    },
                                    value: P6INSPECTIONstdNvar_FINAL.SCMARKTYPE,
                                    height: 40,
                                    width: 400,
                                  ),
                              ],
                            ),
                            SCMARKtype: "SCMARKtype",
                            ShowSCMARKtype: false,
                            DOCUMENT: "DOCUMENT",
                            WIDGETDOCUMENT: ComInputText(
                              nLimitedChar: 100,
                              height: 40,
                              width: 400,
                              isContr: P6INSPECTIONstdNvar_FINAL.iscontrol,
                              isEnabled:
                                  P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                              fnContr: (input) {
                                setState(() {
                                  P6INSPECTIONstdNvar_FINAL.iscontrol = input;
                                });
                              },
                              sValue: P6INSPECTIONstdNvar_FINAL.DOCUMENT,
                              returnfunc: (String s) {
                                P6INSPECTIONstdNvar_FINAL.DOCUMENT = s;
                              },
                            ),
                            METHOD: "METHOD",
                            WIDGETMETHOD: Column(
                              children: [
                                AdvanceDropDown(
                                  imgpath: 'assets/icons/icon-down_4@3x.png',
                                  listdropdown:
                                      P6INSPECTIONstdNvar_FINAL.List_METHOD,
                                  onChangeinside: (d, k) async {
                                    P6INSPECTIONstdNvar_FINAL.METHOD = d;
                                    print(d);
                                    final response = await Dio().post(
                                      serverGB + "GET_FINAL_DOCUMENT",
                                      data: {
                                        "ITEMs":
                                            P6INSPECTIONstdNvar_FINAL.ITEMs,
                                        "METHODid":
                                            P6INSPECTIONstdNvar_FINAL.METHOD,
                                      },
                                    );

                                    // print(response);
                                    if (response.statusCode == 200) {
                                      var databuff = response.data;

                                      P6INSPECTIONstdNvar_FINAL.iscontrol =
                                          true;
                                      P6INSPECTIONstdNvar_FINAL.DOCUMENT =
                                          databuff['DOCUMENT'];
                                      setState(() {});
                                    }
                                  },
                                  value: P6INSPECTIONstdNvar_FINAL.METHOD,
                                  height: 40,
                                  width: 400,
                                ),
                                if (P6INSPECTIONstdNvar_FINAL
                                            .RESULTFORMATdata ==
                                        'Picture' ||
                                    P6INSPECTIONstdNvar_FINAL
                                            .RESULTFORMATdata ==
                                        'OCR') ...[
                                  AdvanceDropDown(
                                    imgpath: 'assets/icons/icon-down_4@3x.png',
                                    listdropdown: MethodePIC,
                                    onChangeinside: (d, k) {
                                      P6INSPECTIONstdNvar_FINAL.IMGreaddata = d;
                                    },
                                    value:
                                        P6INSPECTIONstdNvar_FINAL.IMGreaddata,
                                    height: 40,
                                    width: 400,
                                  ),
                                  AdvanceDropDown(
                                    imgpath: 'assets/icons/icon-down_4@3x.png',
                                    listdropdown:
                                        P6INSPECTIONstdNvar_FINAL.List_IMGno,
                                    onChangeinside: (d, k) {
                                      P6INSPECTIONstdNvar_FINAL.IMGno = d;
                                    },
                                    value: P6INSPECTIONstdNvar_FINAL.IMGno,
                                    height: 40,
                                    width: 400,
                                  )
                                ],
                              ],
                            ),
                            IMGreaddata: "IMGreaddata",
                            WIDGETIMGreaddata: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_IMGreaddata,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.IMGreaddata = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.IMGreaddata,
                              height: 40,
                              width: 400,
                            ),
                            IMGno: "IMGno",
                            WIDGETIMGno: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_IMGno,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.IMGno = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.IMGno,
                              height: 40,
                              width: 400,
                            ),
                            LOAD: "LOAD",
                            WIDGETLOAD: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown: P6INSPECTIONstdNvar_FINAL.List_LOAD,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.LOAD = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.LOAD,
                              height: 40,
                              width: 400,
                            ),
                            GT: "GT",
                            WIDGETGT: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown: P6INSPECTIONstdNvar_FINAL.List_GT,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.GT = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.GT,
                              height: 40,
                              width: 400,
                            ),
                            CALCULATE: "CALCULATE",
                            SPECIFICATIONve: "SPECIFICATIONve",
                            WIDGETSPECIFICATIONve: Column(
                              children: [
                                if (P6INSPECTIONstdNvar_FINAL.RESULTFORMAT !=
                                        'Text' &&
                                    P6INSPECTIONstdNvar_FINAL.RESULTFORMAT !=
                                        'Picture') ...[
                                  SizedBox(
                                    width: 200,
                                    child: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown: [
                                        const MapEntry("-", "-"),
                                        const MapEntry("BTW", "BTW"),
                                        const MapEntry("Lower", "LOL(<)"),
                                        const MapEntry("Higher", "HIM(>)"),
                                        const MapEntry("Actual", "Actual"),
                                      ],
                                      onChangeinside: (d, k) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.condition = d;
                                        context
                                            .read<BlocPageRebuild>()
                                            .rebuildPage();
                                      },
                                      value: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.condition,
                                      height: 40,
                                      width: 200,
                                    ),
                                  ),
                                  if (P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.condition ==
                                      'BTW') ...[
                                    ComInputText(
                                      nLimitedChar: 100,
                                      sLabel: "BTW_HI",
                                      height: 40,
                                      width: 200,
                                      isContr:
                                          P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          P6INSPECTIONstdNvar_FINAL.iscontrol =
                                              input;
                                        });
                                      },
                                      sValue: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.BTW_HI,
                                      returnfunc: (String s) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.BTW_HI = s;
                                      },
                                    ),
                                    ComInputText(
                                      nLimitedChar: 100,
                                      sLabel: "BTW_LOW",
                                      height: 40,
                                      width: 200,
                                      isContr:
                                          P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          P6INSPECTIONstdNvar_FINAL.iscontrol =
                                              input;
                                        });
                                      },
                                      sValue: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.BTW_LOW,
                                      returnfunc: (String s) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.BTW_LOW = s;
                                      },
                                    ),
                                  ],
                                  if (P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.condition ==
                                      'HIM(>)') ...[
                                    ComInputText(
                                      nLimitedChar: 100,
                                      sLabel: "HIM_L",
                                      height: 40,
                                      width: 200,
                                      isContr:
                                          P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          P6INSPECTIONstdNvar_FINAL.iscontrol =
                                              input;
                                        });
                                      },
                                      sValue: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.HIM_L,
                                      returnfunc: (String s) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.HIM_L = s;
                                      },
                                    ),
                                  ],
                                  if (P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.condition ==
                                      'LOL(<)') ...[
                                    ComInputText(
                                      nLimitedChar: 100,
                                      sLabel: "LOL_H",
                                      height: 40,
                                      width: 200,
                                      isContr:
                                          P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          P6INSPECTIONstdNvar_FINAL.iscontrol =
                                              input;
                                        });
                                      },
                                      sValue: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.LOL_H,
                                      returnfunc: (String s) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.LOL_H = s;
                                      },
                                    ),
                                  ],
                                  if (P6INSPECTIONstdNvar_FINAL.SPECIFICATIONveOB.condition == 'HIM(>)' ||
                                      P6INSPECTIONstdNvar_FINAL
                                              .SPECIFICATIONveOB.condition ==
                                          'LOL(<)' ||
                                      P6INSPECTIONstdNvar_FINAL
                                              .SPECIFICATIONveOB.condition ==
                                          'BTW') ...[
                                    ComInputText(
                                      nLimitedChar: 100,
                                      sLabel: "TARGET",
                                      height: 40,
                                      width: 200,
                                      isContr:
                                          P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                      fnContr: (input) {
                                        setState(() {
                                          P6INSPECTIONstdNvar_FINAL.iscontrol =
                                              input;
                                        });
                                      },
                                      sValue: P6INSPECTIONstdNvar_FINAL
                                          .SPECIFICATIONveOB.TARGET,
                                      returnfunc: (String s) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONveOB.TARGET = s;
                                      },
                                    ),
                                  ],
                                ] else ...[
                                  SizedBox(
                                    width: 200,
                                    child: AdvanceDropDown(
                                      imgpath:
                                          'assets/icons/icon-down_4@3x.png',
                                      listdropdown: P6INSPECTIONstdNvar_FINAL
                                          .List_SPECIFICATIONt,
                                      onChangeinside: (d, k) {
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATION = d;
                                        P6INSPECTIONstdNvar_FINAL
                                            .SPECIFICATIONstr = k;
                                      },
                                      value: P6INSPECTIONstdNvar_FINAL
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
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown: P6INSPECTIONstdNvar_FINAL.List_UNIT,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.UNIT = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.UNIT,
                              height: 40,
                              width: 400,
                            ),
                            CONVERSE: "CONVERSE",
                            WIDGETCONVERSE: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_UNIT_CONVERST,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST,
                              height: 40,
                              width: 400,
                            ),
                            POSITION: "POSITION",
                            WIDGETPOSITION: ComInputText(
                              nLimitedChar: 100,

                              height: 40,
                              width: 400,
                              isContr: P6INSPECTIONstdNvar_FINAL.iscontrol,
                              // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                              fnContr: (input) {
                                print(input);
                                setState(() {
                                  setState(() {
                                    P6INSPECTIONstdNvar_FINAL.iscontrol = input;
                                  });
                                });
                              },
                              sValue: P6INSPECTIONstdNvar_FINAL.POINT,
                              returnfunc: (String s) {
                                P6INSPECTIONstdNvar_FINAL.POINT = s;
                              },
                            ),
                            PCS: "PCS",
                            WIDGETPCS: (P6INSPECTIONstdNvar_FINAL
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
                                          MapEntry("AQL", "AQL"),
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL.TEXTTYPE =
                                                d;
                                          });
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_FINAL.TEXTTYPE,
                                        height: 40,
                                        width: 80,
                                      ),
                                      ComInputText(
                                        nLimitedChar: 100,

                                        height: 40,
                                        width: 400,
                                        isContr:
                                            P6INSPECTIONstdNvar_FINAL.iscontrol,
                                        // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                        fnContr: (input) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL
                                                .iscontrol = input;
                                          });
                                        },
                                        sValue: P6INSPECTIONstdNvar_FINAL.PCS,
                                        returnfunc: (String s) {
                                          P6INSPECTIONstdNvar_FINAL.PCS = s;
                                        },
                                      ),
                                    ],
                                  )
                                : ComInputText(
                                    nLimitedChar: 100,

                                    height: 40,
                                    width: 400,
                                    isContr:
                                        P6INSPECTIONstdNvar_FINAL.iscontrol,
                                    // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                    fnContr: (input) {
                                      setState(() {
                                        P6INSPECTIONstdNvar_FINAL.iscontrol =
                                            input;
                                      });
                                    },
                                    sValue: P6INSPECTIONstdNvar_FINAL.PCS,
                                    returnfunc: (String s) {
                                      P6INSPECTIONstdNvar_FINAL.PCS = s;
                                    },
                                  ),
                            FREQUENCY: "FREQUENCY",
                            WIDGETFREQUENCY: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_FREQUENCY,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.FREQUENCY = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.FREQUENCY,
                              height: 40,
                              width: 400,
                            ),
                            REMARK: "REMARK",
                            WIDGETREMARK: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_COMMENT,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.REMARK = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.REMARK,
                              height: 40,
                              width: 400,
                            ),

                            // ComInputText(
                            //   nLimitedChar: 100,

                            //   height: 40,
                            //   width: 400,
                            //   isContr: P6INSPECTIONstdNvar_FINAL.iscontrol,
                            //   // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                            //   fnContr: (input) {
                            //     setState(() {
                            //       P6INSPECTIONstdNvar_FINAL.iscontrol = input;
                            //     });
                            //   },
                            //   sValue: P6INSPECTIONstdNvar_FINAL.REMARK,
                            //   returnfunc: (String s) {
                            //     P6INSPECTIONstdNvar_FINAL.REMARK = s;
                            //   },
                            // ),
                            SWreport: "SWreport",
                            WIDGETSWreport: AdvanceDropDown(
                              imgpath: 'assets/icons/icon-down_4@3x.png',
                              listdropdown:
                                  P6INSPECTIONstdNvar_FINAL.List_SWreport,
                              onChangeinside: (d, k) {
                                P6INSPECTIONstdNvar_FINAL.SWreport = d;
                              },
                              value: P6INSPECTIONstdNvar_FINAL.SWreport,
                              height: 40,
                              width: 400,
                            ),
                            ACTION: "ACTION",
                            isACTION: true,
                            ACTIONMODE: 1,
                            SAVEFN: (v) {
                              print(P6INSPECTIONstdNvar_FINAL.RESULTFORMAT);
                              if (P6INSPECTIONstdNvar_FINAL
                                          .RESULTFORMAT ==
                                      'Text' ||
                                  P6INSPECTIONstdNvar_FINAL
                                          .RESULTFORMAT ==
                                      'Picture') {
                                context
                                    .read<P6UPLOADSPEC_Bloc>()
                                    .add(P6UPLOADSPEC_FINAL_TEXT());
                              } else if (P6INSPECTIONstdNvar_FINAL
                                          .RESULTFORMAT ==
                                      'OCR' ||
                                  P6INSPECTIONstdNvar_FINAL.RESULTFORMAT ==
                                      'Number' ||
                                  P6INSPECTIONstdNvar_FINAL.RESULTFORMAT ==
                                      'Graph' ||
                                  P6INSPECTIONstdNvar_FINAL.RESULTFORMAT ==
                                      'CAL1') {
                                context
                                    .read<P6UPLOADSPEC_Bloc>()
                                    .add(P6UPLOADSPEC_FINAL_NUM());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ] else ...[
            // InkWell(
            //   onTap: () {
            //     newdata();
            //   },
            //   child: Container(
            //     color: Colors.blue,
            //     height: 40,
            //     // width: 100,
            //     child: Center(
            //       child: Text(
            //         "NEW",
            //         style: TextStyle(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
          SizedBox(
            height: 24,
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
