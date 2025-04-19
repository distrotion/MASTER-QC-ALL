import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/06-1-P6FINSPECTIONget.dart';
import '../../bloc/BlocEvent/06-4-P6UPLOADSPEC.dart';
import '../../data/global.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import 'P6INSPECTIONstdFunction_FN.dart';
import 'P6INSPECTIONstdNvar.dart';

ScrollController _controllerIN01 = ScrollController();
ScrollController _controllerIN02 = ScrollController();

class INSFINAL extends StatefulWidget {
  INSFINAL({
    super.key,
    this.Mdata,
  });
  P6InspectionSTD? Mdata;

  @override
  State<INSFINAL> createState() => _INSFINALState();
}

class _INSFINALState extends State<INSFINAL> {
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
                  child: Text("FINAL PATTERN"),
                ),
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
                          VARX: "VARX",
                          VARY: "VARY",
                          VARZ: "VARZ",
                          VARI: "VARI",
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
                                "${_KSW(_Mdata.FINAL[i].K1b, _Mdata.FINAL[i].K1v)}${_Mdata.FINAL[i].shape != "" ? "-" : ""}${_Mdata.FINAL[i].shape}",
                            // "${_Mdata.FINAL[i].K1b}(${_Mdata.FINAL[i].K1v})",
                            VARX: _Mdata.FINAL[i].VARX,
                            VARY: _Mdata.FINAL[i].VARY,
                            VARZ: _Mdata.FINAL[i].VARZ,
                            VARI: _Mdata.FINAL[i].VARI,
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
                            CONVERSEDATA: _Mdata.FINAL[i].CONVERSEDATA,
                            // POSITION: _Mdata.FINAL[i].AQL == 'YES'
                            //     ? _Mdata.FINAL[i].AQLV
                            //     : _Mdata.FINAL[i].POINT,
                            POSITION: _Mdata.FINAL[i].POINT,
                            PCS: _Mdata.FINAL[i].AQL == 'YES'
                                ? "AQL(${_Mdata.FINAL[i].AQLV}%)"
                                : _Mdata.FINAL[i].PCS,
                            FREQUENCY: _Mdata.FINAL[i].FREQUENCY,
                            REMARK: _Mdata.FINAL[i].REMARK,
                            SWreport: _Mdata.FINAL[i].SWreport,
                            SUMdata: _Mdata.FINAL[i].SUMdata,
                            SRAWDATA: _Mdata.FINAL[i].SRAWDATA,
                            ACTION: "ACTION",

                            EditFN: (v) {
                              //
                              // print(_Mdata.FINAL[i].ITEMsname);

                              P6ClearFINAL();
                              P6INSPECTIONstdNvar_FINAL.seq =
                                  _Mdata.FINAL[i].seq;
                              //---------------------
                              P6INSPECTIONstdNvar_FINAL.List_ITEMs = [
                                MapEntry("-", "-")
                              ];
                              P6INSPECTIONstdNvar_FINAL.List_ITEMs.add(
                                MapEntry(
                                  _Mdata.FINAL[i].ITEMsname,
                                  _Mdata.FINAL[i].ITEMs,
                                ),
                              );

                              P6INSPECTIONstdNvar_FINAL.ITEMs =
                                  _Mdata.FINAL[i].ITEMs;

                              for (var i = 0;
                                  i <
                                      P6INSPECTIONstdNvar_FINAL
                                          .List_ITEMs_set.length;
                                  i++) {
                                if (P6INSPECTIONstdNvar_FINAL
                                        .List_ITEMs_set[i].masterID ==
                                    _Mdata.FINAL[i].ITEMs) {
                                  P6INSPECTIONstdNvar_FINAL.TYPE =
                                      P6INSPECTIONstdNvar_FINAL
                                          .List_ITEMs_set[i].TYPE;
                                  P6INSPECTIONstdNvar_FINAL.RESULTFORMAT =
                                      P6INSPECTIONstdNvar_FINAL
                                          .List_ITEMs_set[i].RESULTFORMAT;
                                  break;
                                }
                              }
                              // print(P6INSPECTIONstdNvar_FINAL.RESULTFORMAT);

                              if (P6INSPECTIONstdNvar_FINAL.RESULTFORMAT !=
                                  '-') {
                                P6INSPECTION_FINAL_GET_STEP2(
                                        _Mdata.FINAL[i].ITEMs)
                                    .then((dynamic result) {
                                  // print(result);

                                  setState(() {
                                    P6INSPECTIONstdNvar_FINAL.RESULTFORMATdata =
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
                                                result['METHOD'][i]['masterID']
                                                    .toString()));
                                      }
                                    }

                                    if (result['LOAD'] != null &&
                                        result['LOAD'].length > 0) {
                                      for (int i = 0;
                                          i < result['LOAD'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_FINAL.List_LOAD.add(
                                            MapEntry(
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
                                        P6INSPECTIONstdNvar_FINAL.List_CORETYPE
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
                                        P6INSPECTIONstdNvar_FINAL.List_UNIT.add(
                                            MapEntry(
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
                                        P6INSPECTIONstdNvar_FINAL.List_FREQUENCY
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
                                        P6INSPECTIONstdNvar_FINAL.List_CALCULATE
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
                                    // print(result['COMMENT']);
                                    if (result['COMMENT'] != null &&
                                        result['COMMENT'].length > 0) {
                                      for (int i = 0;
                                          i < result['COMMENT'].length;
                                          i++) {
                                        P6INSPECTIONstdNvar_FINAL.List_COMMENT
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

                              P6INSPECTIONstdNvar_FINAL.K1b =
                                  _Mdata.FINAL[i].K1b;
                              P6INSPECTIONstdNvar_FINAL.K1v =
                                  _Mdata.FINAL[i].K1v;
                              P6INSPECTIONstdNvar_FINAL.TYPE =
                                  _Mdata.FINAL[i].TYPE;
                              P6INSPECTIONstdNvar_FINAL.RESULTFORMAT =
                                  _Mdata.FINAL[i].RESULTFORMAT;
                              P6INSPECTIONstdNvar_FINAL.GRAPHTYPE =
                                  _Mdata.FINAL[i].GRAPHTYPE;
                              P6INSPECTIONstdNvar_FINAL.INTERSECTION =
                                  _Mdata.FINAL[i].INTERSECTION;
                              // P6INSPECTIONstdNvar_FINAL.COREtype = _Mdata.FINAL[i].COREtype;
                              // P6INSPECTIONstdNvar_FINAL.FORMULA = _Mdata.FINAL[i].FORMULA;
                              P6INSPECTIONstdNvar_FINAL.SCMARK =
                                  _Mdata.FINAL[i].SCMARK;
                              // P6INSPECTIONstdNvar_FINAL.SCMARKTYPE = _Mdata.FINAL[i].SCMARKTYPE;
                              P6INSPECTIONstdNvar_FINAL.DOCUMENT =
                                  _Mdata.FINAL[i].DOCUMENT;
                              P6INSPECTIONstdNvar_FINAL.METHOD =
                                  _Mdata.FINAL[i].METHOD;
                              // P6INSPECTIONstdNvar_FINAL.IMGreaddata = _Mdata.FINAL[i].IMGreaddata;
                              // P6INSPECTIONstdNvar_FINAL.IMGno = _Mdata.FINAL[i].IMGno;
                              P6INSPECTIONstdNvar_FINAL.LOAD =
                                  _Mdata.FINAL[i].LOAD;
                              // P6INSPECTIONstdNvar_FINAL.GT = _Mdata.FINAL[i].GT;
                              P6INSPECTIONstdNvar_FINAL.SPECIFICATION =
                                  _Mdata.FINAL[i].SPECIFICATION;
                              P6INSPECTIONstdNvar_FINAL.SPECIFICATIONstr =
                                  _Mdata.FINAL[i].SPECIFICATIONstr;
                              P6INSPECTIONstdNvar_FINAL.SPECIFICATIONve =
                                  _Mdata.FINAL[i].SPECIFICATIONve;
                              P6INSPECTIONstdNvar_FINAL.SPECIFICATIONveOB =
                                  NveOB(
                                condition:
                                    _Mdata.FINAL[i].SPECIFICATIONcondition,
                                BTW_HI: _Mdata.FINAL[i].SPECIFICATIONBTW_HI,
                                BTW_LOW: _Mdata.FINAL[i].SPECIFICATIONBTW_LOW,
                                HIM_L: _Mdata.FINAL[i].SPECIFICATIONHIM_L,
                                LOL_H: _Mdata.FINAL[i].SPECIFICATIONLOL_H,
                                TARGET: _Mdata.FINAL[i].SPECIFICATIONTARGET,
                              );
                              P6INSPECTIONstdNvar_FINAL.UNIT =
                                  _Mdata.FINAL[i].UNIT;
                              // P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST = _Mdata.FINAL[i].UNIT_CONVERST;
                              P6INSPECTIONstdNvar_FINAL.CONVERSEDATA =
                                  _Mdata.FINAL[i].CONVERSEDATA;
                              // static String POINTPCS = "-";
                              P6INSPECTIONstdNvar_FINAL.POINT =
                                  _Mdata.FINAL[i].POINT;
                              P6INSPECTIONstdNvar_FINAL.PCS =
                                  _Mdata.FINAL[i].PCS;
                              P6INSPECTIONstdNvar_FINAL.FREQUENCY =
                                  _Mdata.FINAL[i].FREQUENCY;
                              // P6INSPECTIONstdNvar_FINAL.REMARK = _Mdata.FINAL[i].REMARK;
                              // P6INSPECTIONstdNvar_FINAL.RESULTFORMATdata = _Mdata.FINAL[i].RESULTFORMATdata;
                              P6INSPECTIONstdNvar_FINAL.SWreport =
                                  _Mdata.FINAL[i].SWreport;
                              P6INSPECTIONstdNvar_FINAL.SUMDATA =
                                  _Mdata.FINAL[i].SUMdata;
                              P6INSPECTIONstdNvar_FINAL.SRAWDATA =
                                  _Mdata.FINAL[i].SRAWDATA;
                              P6INSPECTIONstdNvar_FINAL.AQL =
                                  _Mdata.FINAL[i].AQL;
                              P6INSPECTIONstdNvar_FINAL.AQLV =
                                  _Mdata.FINAL[i].AQLV;

                              P6INSPECTIONstdNvar_FINAL.VARX =
                                  _Mdata.FINAL[i].VARX;

                              P6INSPECTIONstdNvar_FINAL.VARY =
                                  _Mdata.FINAL[i].VARY;

                              P6INSPECTIONstdNvar_FINAL.VARZ =
                                  _Mdata.FINAL[i].VARZ;

                              P6INSPECTIONstdNvar_FINAL.VARI =
                                  _Mdata.FINAL[i].VARI;

                              setState(() {
                                P6INSPECTIONstdNvar_FINAL.POP = true;
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
                              width: 2500,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onLongPress: () {
                                      //
                                      setState(() {
                                        P6ClearFINAL();
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
                                      VARX: "VARX",
                                      VARY: "VARY",
                                      VARZ: "VARZ",
                                      VARI: "VARI",
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
                                        isEnable:
                                            P6INSPECTIONstdNvar_FINAL.ITEMs !=
                                                '-',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: P6INSPECTIONstdNvar_FINAL
                                            .List_ITEMs,
                                        onChangeinside: (d, k) async {
                                          // print(d);
                                          P6INSPECTIONstdNvar_FINAL.ITEMs = d;
                                          for (var i = 0;
                                              i <
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .List_ITEMs_set.length;
                                              i++) {
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .List_ITEMs_set[i]
                                                    .masterID ==
                                                d) {
                                              P6INSPECTIONstdNvar_FINAL.TYPE =
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .List_ITEMs_set[i].TYPE;
                                              P6INSPECTIONstdNvar_FINAL
                                                      .RESULTFORMAT =
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .List_ITEMs_set[i]
                                                      .RESULTFORMAT;
                                              break;
                                            }
                                          }
                                          print(P6INSPECTIONstdNvar_FINAL
                                              .RESULTFORMAT);

                                          if (d != '-') {
                                            P6INSPECTION_FINAL_GET_STEP2(d)
                                                .then((dynamic result) {
                                              // print(result);

                                              setState(() {
                                                P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
                                                            .List_METHOD
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
                                                    P6INSPECTIONstdNvar_FINAL
                                                            .List_LOAD
                                                        .add(
                                                            MapEntry(
                                                                result['LOAD']
                                                                            [i]
                                                                        ['LOAD']
                                                                    .toString(),
                                                                result['LOAD']
                                                                            [i][
                                                                        'masterID']
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
                                                    P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
                                                            .List_UNIT
                                                        .add(
                                                            MapEntry(
                                                                result['UNIT']
                                                                            [i]
                                                                        ['UNIT']
                                                                    .toString(),
                                                                result['UNIT']
                                                                            [i][
                                                                        'masterID']
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
                                                    P6INSPECTIONstdNvar_FINAL.List_FREQUENCY
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
                                                    P6INSPECTIONstdNvar_FINAL.List_CALCULATE
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
                                                    P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
                                                            .List_COMMENT
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
                                      K1CALDATA: "Constant",
                                      WIDGETK1CALDATA: Column(
                                        children: [
                                          AdvanceDropDown(
                                            isEnable: P6INSPECTIONstdNvar_FINAL
                                                        .RESULTFORMAT !=
                                                    'CAL1' &&
                                                P6INSPECTIONstdNvar_FINAL
                                                        .RESULTFORMAT !=
                                                    'CAL2',
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown: [
                                              MapEntry("-", "-"),
                                              MapEntry("Kcon.", "1"),
                                              MapEntry("Kvar.", "2")
                                            ],
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_FINAL.K1b =
                                                    d;
                                              });
                                            },
                                            value:
                                                P6INSPECTIONstdNvar_FINAL.K1b,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_FINAL.K1b ==
                                              '2') ...[
                                            AdvanceDropDown(
                                              isEnable:
                                                  P6INSPECTIONstdNvar_FINAL
                                                              .RESULTFORMAT !=
                                                          'CAL1' &&
                                                      P6INSPECTIONstdNvar_FINAL
                                                              .RESULTFORMAT !=
                                                          'CAL2',
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: [
                                                MapEntry("-", "-"),
                                                MapEntry("sheet", "sheet"),
                                                MapEntry(
                                                    "cylinder", "cylinder"),
                                                MapEntry("tube", "tube")
                                              ],
                                              onChangeinside: (d, k) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .shape = d;
                                                });
                                              },
                                              value: P6INSPECTIONstdNvar_FINAL
                                                  .shape,
                                              height: 40,
                                              width: 80,
                                            ),
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .shape ==
                                                'sheet') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Ksw1",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Ksw2",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Ksh",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .shape ==
                                                'cylinder') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Kcr",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Kch",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .shape ==
                                                'tube') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Ktr1",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Ktr2",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "Kth1",
                                                isNumberOnly: true,
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .K1v,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .K1v = s;
                                                },
                                              ),
                                            ],
                                          ],
                                          if (P6INSPECTIONstdNvar_FINAL.K1b ==
                                              '1') ...[
                                            ComInputText(
                                              nLimitedChar: 100,
                                              isNumberOnly: true,
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
                                                  P6INSPECTIONstdNvar_FINAL.K1v,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_FINAL.K1v =
                                                    s;
                                              },
                                            ),
                                          ]
                                        ],
                                      ),
                                      VARX: "VARX",
                                      WIDGETVARX: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_FINAL
                                                .RESULTFORMAT !=
                                            'CAL2',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL.VARX = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.VARX,
                                        height: 40,
                                        width: 80,
                                      ),
                                      VARY: "VARY",
                                      WIDGETVARY: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_FINAL
                                                .RESULTFORMAT !=
                                            'CAL2',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL.VARY = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.VARY,
                                        height: 40,
                                        width: 80,
                                      ),
                                      VARZ: "VARZ",
                                      WIDGETVARZ: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_FINAL
                                                .RESULTFORMAT !=
                                            'CAL2',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL.VARZ = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.VARZ,
                                        height: 40,
                                        width: 80,
                                      ),
                                      VARI: "VARI",
                                      WIDGETVARI: AdvanceDropDown(
                                        isEnable: P6INSPECTIONstdNvar_FINAL
                                                .RESULTFORMAT !=
                                            'CAL2',
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: [
                                          MapEntry("-", "-"),
                                          MapEntry("YES", "YES"),
                                          MapEntry("NO", "NO")
                                        ],
                                        onChangeinside: (d, k) {
                                          setState(() {
                                            P6INSPECTIONstdNvar_FINAL.VARI = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.VARI,
                                        height: 40,
                                        width: 80,
                                      ),
                                      SCMARK: "SC MARK",
                                      WIDGETSCMARK: Column(
                                        children: [
                                          AdvanceDropDown(
                                            imgpath:
                                                'assets/icons/icon-down_4@3x.png',
                                            listdropdown:
                                                P6INSPECTIONstdNvar_FINAL
                                                    .List_SCMARK,
                                            onChangeinside: (d, k) {
                                              setState(() {
                                                P6INSPECTIONstdNvar_FINAL
                                                    .SCMARK = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_FINAL
                                                .SCMARK,
                                            height: 40,
                                            width: 400,
                                          ),
                                          if (P6INSPECTIONstdNvar_FINAL
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
                                                P6INSPECTIONstdNvar_FINAL
                                                    .SCMARKTYPE = d;
                                              },
                                              value: P6INSPECTIONstdNvar_FINAL
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
                                      //       P6INSPECTIONstdNvar_FINAL.iscontrol,
                                      //   isEnabled: P6INSPECTIONstdNvar_FINAL
                                      //       .ACTION_isEnabled,
                                      //   fnContr: (input) {
                                      //     setState(() {
                                      //       P6INSPECTIONstdNvar_FINAL
                                      //           .iscontrol = input;
                                      //     });
                                      //   },
                                      //   sValue:
                                      //       P6INSPECTIONstdNvar_FINAL.DOCUMENT,
                                      //   returnfunc: (String s) {
                                      //     P6INSPECTIONstdNvar_FINAL.DOCUMENT =
                                      //         s;
                                      //   },
                                      // ),
                                      WIDGETDOCUMENT: Container(
                                        height: 40,
                                        width: 400,
                                        child: Center(
                                          child: Text(
                                            P6INSPECTIONstdNvar_FINAL.DOCUMENT,
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
                                                P6INSPECTIONstdNvar_FINAL
                                                    .List_METHOD,
                                            onChangeinside: (d, k) async {
                                              P6INSPECTIONstdNvar_FINAL.METHOD =
                                                  d;
                                              print(d);
                                              final response = await Dio().post(
                                                options: Options(
                                                  // contentType: "application/json",

                                                  headers: {
                                                    "server": USERDATA.MASTER,
                                                  },
                                                ),
                                                serverGB + "GET_FINAL_DOCUMENT",
                                                data: {
                                                  "ITEMs":
                                                      P6INSPECTIONstdNvar_FINAL
                                                          .ITEMs,
                                                  "METHODid":
                                                      P6INSPECTIONstdNvar_FINAL
                                                          .METHOD,
                                                },
                                              );

                                              // print(response);
                                              if (response.statusCode == 200) {
                                                var databuff = response.data;

                                                P6INSPECTIONstdNvar_FINAL
                                                    .iscontrol = true;
                                                P6INSPECTIONstdNvar_FINAL
                                                        .DOCUMENT =
                                                    databuff['DOCUMENT'];
                                                setState(() {});
                                              }
                                            },
                                            value: P6INSPECTIONstdNvar_FINAL
                                                .METHOD,
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
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown: MethodePIC,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_FINAL
                                                    .IMGreaddata = d;
                                              },
                                              value: P6INSPECTIONstdNvar_FINAL
                                                  .IMGreaddata,
                                              height: 40,
                                              width: 400,
                                            ),
                                            AdvanceDropDown(
                                              imgpath:
                                                  'assets/icons/icon-down_4@3x.png',
                                              listdropdown:
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .List_IMGno,
                                              onChangeinside: (d, k) {
                                                P6INSPECTIONstdNvar_FINAL
                                                    .IMGno = d;
                                              },
                                              value: P6INSPECTIONstdNvar_FINAL
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
                                          if (P6INSPECTIONstdNvar_FINAL
                                                      .RESULTFORMAT !=
                                                  'Text' &&
                                              P6INSPECTIONstdNvar_FINAL
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
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .SPECIFICATIONveOB
                                                      .condition = d;
                                                  setState(() {});
                                                },
                                                value: P6INSPECTIONstdNvar_FINAL
                                                    .SPECIFICATIONveOB
                                                    .condition,
                                                height: 40,
                                                width: 200,
                                              ),
                                            ),
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "BTW_HI",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .BTW_HI,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .BTW_LOW,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .SPECIFICATIONveOB
                                                      .BTW_LOW = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'HIM(>)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "HIM_L",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .HIM_L,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .SPECIFICATIONveOB
                                                      .HIM_L = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_FINAL
                                                    .SPECIFICATIONveOB
                                                    .condition ==
                                                'LOL(<)') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "LOL_H",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .LOL_H,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .SPECIFICATIONveOB
                                                      .LOL_H = s;
                                                },
                                              ),
                                            ],
                                            if (P6INSPECTIONstdNvar_FINAL.SPECIFICATIONveOB.condition == 'HIM(>)' ||
                                                P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'LOL(<)' ||
                                                P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .condition ==
                                                    'BTW') ...[
                                              ComInputText(
                                                nLimitedChar: 100,
                                                sLabel: "TARGET",
                                                height: 40,
                                                width: 200,
                                                isContr:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol,
                                                // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P6INSPECTIONstdNvar_FINAL
                                                        .SPECIFICATIONveOB
                                                        .TARGET,
                                                returnfunc: (String s) {
                                                  P6INSPECTIONstdNvar_FINAL
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
                                                    P6INSPECTIONstdNvar_FINAL
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
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_FINAL.List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_FINAL.UNIT = d;
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.UNIT,
                                        height: 40,
                                        width: 400,
                                      ),

                                      WIDGETCONVERSE: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown:
                                            P6INSPECTIONstdNvar_FINAL.List_UNIT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_FINAL
                                              .UNIT_CONVERST = d;
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL
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
                                            P6INSPECTIONstdNvar_FINAL
                                                .CONVERSEDATA = d;
                                          });
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL
                                            .CONVERSEDATA,
                                        height: 40,
                                        width: 80,
                                      ),
                                      POSITION: "POSITION",
                                      WIDGETPOSITION: ComInputText(
                                        nLimitedChar: 100,

                                        height: 40,
                                        width: 400,
                                        isContr:
                                            P6INSPECTIONstdNvar_FINAL.iscontrol,
                                        // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                        fnContr: (input) {
                                          print(input);
                                          setState(() {
                                            setState(() {
                                              P6INSPECTIONstdNvar_FINAL
                                                  .iscontrol = input;
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
                                                    MapEntry("AQL", "YES"),
                                                    MapEntry("%", "Percen"),
                                                  ],
                                                  onChangeinside: (d, k) {
                                                    setState(() {
                                                      P6INSPECTIONstdNvar_FINAL
                                                          .AQL = d;
                                                    });
                                                  },
                                                  value:
                                                      P6INSPECTIONstdNvar_FINAL
                                                          .AQL,
                                                  height: 40,
                                                  width: 80,
                                                ),
                                                if (P6INSPECTIONstdNvar_FINAL
                                                        .AQL ==
                                                    'YES') ...[
                                                  ComInputText(
                                                    nLimitedChar: 100,
                                                    sLabel: "%AQL",
                                                    height: 40,
                                                    width: 400,
                                                    isContr:
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .AQLV,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_FINAL
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
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .iscontrol,
                                                    // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                                    fnContr: (input) {
                                                      setState(() {
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .iscontrol = input;
                                                      });
                                                    },
                                                    sValue:
                                                        P6INSPECTIONstdNvar_FINAL
                                                            .PCS,
                                                    returnfunc: (String s) {
                                                      P6INSPECTIONstdNvar_FINAL
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
                                                  P6INSPECTIONstdNvar_FINAL.PCS,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_FINAL.PCS =
                                                    s;
                                              },
                                            ),
                                      FREQUENCY: "FREQUENCY",
                                      WIDGETFREQUENCY: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: P6INSPECTIONstdNvar_FINAL
                                            .List_FREQUENCY,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_FINAL.FREQUENCY =
                                              d;
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_FINAL.FREQUENCY,
                                        height: 40,
                                        width: 400,
                                      ),
                                      REMARK: "REMARK",
                                      WIDGETREMARK: AdvanceDropDown(
                                        imgpath:
                                            'assets/icons/icon-down_4@3x.png',
                                        listdropdown: P6INSPECTIONstdNvar_FINAL
                                            .List_COMMENT,
                                        onChangeinside: (d, k) {
                                          P6INSPECTIONstdNvar_FINAL.REMARK = d;
                                        },
                                        value: P6INSPECTIONstdNvar_FINAL.REMARK,
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
                                            P6INSPECTIONstdNvar_FINAL.SWreport =
                                                d;
                                          });
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_FINAL.SWreport,
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
                                                P6INSPECTIONstdNvar_FINAL
                                                    .SUMDATA = d;
                                              });
                                            },
                                            value: P6INSPECTIONstdNvar_FINAL
                                                .SUMDATA,
                                            height: 40,
                                            width: 80,
                                          ),
                                          if (P6INSPECTIONstdNvar_FINAL.AQL ==
                                              'SUMDATA') ...[
                                            ComInputText(
                                              nLimitedChar: 100,

                                              height: 40,
                                              width: 400,
                                              isContr: P6INSPECTIONstdNvar_FINAL
                                                  .iscontrol,
                                              // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                                              fnContr: (input) {
                                                setState(() {
                                                  P6INSPECTIONstdNvar_FINAL
                                                      .iscontrol = input;
                                                });
                                              },
                                              sValue: P6INSPECTIONstdNvar_FINAL
                                                  .SUMDATATEXT,
                                              returnfunc: (String s) {
                                                P6INSPECTIONstdNvar_FINAL
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
                                            P6INSPECTIONstdNvar_FINAL.SRAWDATA =
                                                d;
                                          });
                                        },
                                        value:
                                            P6INSPECTIONstdNvar_FINAL.SRAWDATA,
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
                                        print(P6INSPECTIONstdNvar_FINAL
                                            .RESULTFORMAT);
                                        if (P6INSPECTIONstdNvar_FINAL.RESULTFORMAT == 'Text' ||
                                            P6INSPECTIONstdNvar_FINAL
                                                    .RESULTFORMAT ==
                                                'Picture') {
                                          context
                                              .read<P6UPLOADSPEC_Bloc>()
                                              .add(P6UPLOADSPEC_FINAL_TEXT());
                                        } else if (P6INSPECTIONstdNvar_FINAL.RESULTFORMAT ==
                                                'OCR' ||
                                            P6INSPECTIONstdNvar_FINAL
                                                    .RESULTFORMAT ==
                                                'Number' ||
                                            P6INSPECTIONstdNvar_FINAL
                                                    .RESULTFORMAT ==
                                                'Graph' ||
                                            P6INSPECTIONstdNvar_FINAL
                                                    .RESULTFORMAT ==
                                                'CAL1' ||
                                            P6INSPECTIONstdNvar_FINAL
                                                    .RESULTFORMAT ==
                                                'CAL2') {
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
