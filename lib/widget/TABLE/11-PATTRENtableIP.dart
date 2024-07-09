import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class PATTERNIPtable extends StatelessWidget {
  PATTERNIPtable({
    super.key,
    this.seq,
    this.ITEMs,
    this.CORStype,
    this.FORMULA,
    this.SCMARK,
    this.SCMARKtype,
    this.DOCUMENT,
    this.METHOD,
    this.IMGreaddata,
    this.IMGno,
    this.LOAD,
    this.GT,
    this.SPECIFICATIONve,
    this.CALCULATE,
    this.UNIT,
    this.CONVERSE,
    this.POSITION,
    this.PCS,
    this.FREQUENCY,
    this.REMARK,
    this.SWreport,
    this.K1CALDATA,
    this.CONVERSEDATA,
    this.SUMdata,
    this.SRAWDATA,
    this.CONITEM,
    //
    this.Showseq,
    this.ShowITEMs,
    this.ShowCORStype,
    this.ShowFORMULA,
    this.ShowSCMARK,
    this.ShowSCMARKtype,
    this.ShowDOCUMENT,
    this.ShowMETHOD,
    this.ShowIMGreaddata,
    this.ShowIMGno,
    this.ShowLOAD,
    this.ShowGT,
    this.ShowSPECIFICATIONve,
    this.ShowCALCULATE,
    this.ShowUNIT,
    this.ShowCONVERSE,
    this.ShowPOSITION,
    this.ShowPCS,
    this.ShowFREQUENCY,
    this.ShowREMARK,
    this.ShowSWreport,
    this.ShowK1CALDATA,
    this.ShowCONVERSEDATA,
    this.ShowSUMdata,
    this.ShowSRAWDATA,
    this.ShowCONITEM,

    //
    this.WIDGETseq,
    this.WIDGETITEMs,
    this.WIDGETCORStype,
    this.WIDGETFORMULA,
    this.WIDGETSCMARK,
    this.WIDGETSCMARKtype,
    this.WIDGETDOCUMENT,
    this.WIDGETMETHOD,
    this.WIDGETIMGreaddata,
    this.WIDGETIMGno,
    this.WIDGETLOAD,
    this.WIDGETGT,
    this.WIDGETSPECIFICATIONve,
    this.WIDGETCALCULATE,
    this.WIDGETUNIT,
    this.WIDGETCONVERSE,
    this.WIDGETPOSITION,
    this.WIDGETPCS,
    this.WIDGETFREQUENCY,
    this.WIDGETREMARK,
    this.WIDGETSWreport,
    this.WIDGETK1CALDATA,
    this.WIDGETCONVERSEDATA,
    this.WIDGETSUMdata,
    this.WIDGETSRAWDATA,
    this.WIDGETCONIP,
    this.WIDGETCONIPITEM,
    this.WIDGETCONIPITEMVAR,

    //
    this.ACTION,
    this.ACTIONMODE,
    this.isACTION,
    this.EditFN,
    this.DeleteFN,
    this.SAVEFN,
    this.BGColorMain,
    //
    this.CONIP,
    this.CONIPITEM,
    this.CONIPITEMVAR,
    //
    this.ShowCONIP,
    this.ShowCONIPITEM,
    this.ShowCONIPITEMVAR,
  });
  String? seq;
  String? ITEMs;
  String? CORStype;
  String? FORMULA;
  String? SCMARK;
  String? SCMARKtype;
  String? DOCUMENT;
  String? METHOD;
  String? IMGreaddata;
  String? IMGno;
  String? LOAD;
  String? GT;
  String? SPECIFICATIONve;
  String? CALCULATE;
  String? UNIT;
  String? CONVERSE;
  String? POSITION;
  String? PCS;
  String? FREQUENCY;
  String? REMARK;
  String? SWreport;
  String? K1CALDATA;

  String? CONVERSEDATA;
  String? SUMdata;
  String? SRAWDATA;
  String? CON;
  String? CONITEM;
  //
  String? CONIP;
  String? CONIPITEM;
  String? CONIPITEMVAR;

//
  bool? Showseq;
  bool? ShowITEMs;
  bool? ShowCORStype;
  bool? ShowFORMULA;
  bool? ShowSCMARK;
  bool? ShowSCMARKtype;
  bool? ShowDOCUMENT;
  bool? ShowMETHOD;
  bool? ShowIMGreaddata;
  bool? ShowIMGno;
  bool? ShowLOAD;
  bool? ShowGT;
  bool? ShowSPECIFICATIONve;
  bool? ShowCALCULATE;
  bool? ShowUNIT;
  bool? ShowCONVERSE;
  bool? ShowPOSITION;
  bool? ShowPCS;
  bool? ShowFREQUENCY;
  bool? ShowREMARK;
  bool? ShowSWreport;
  bool? ShowK1CALDATA;

  bool? ShowCONVERSEDATA;
  bool? ShowSUMdata;
  bool? ShowSRAWDATA;
  bool? ShowCON;
  bool? ShowCONITEM;

  bool? ShowCONIP;
  bool? ShowCONIPITEM;
  bool? ShowCONIPITEMVAR;
//
  Widget? WIDGETseq;
  Widget? WIDGETITEMs;
  Widget? WIDGETCORStype;
  Widget? WIDGETFORMULA;
  Widget? WIDGETSCMARK;
  Widget? WIDGETSCMARKtype;
  Widget? WIDGETDOCUMENT;
  Widget? WIDGETMETHOD;
  Widget? WIDGETIMGreaddata;
  Widget? WIDGETIMGno;
  Widget? WIDGETLOAD;
  Widget? WIDGETGT;
  Widget? WIDGETSPECIFICATIONve;
  Widget? WIDGETCALCULATE;
  Widget? WIDGETUNIT;
  Widget? WIDGETCONVERSE;
  Widget? WIDGETPOSITION;
  Widget? WIDGETPCS;
  Widget? WIDGETFREQUENCY;
  Widget? WIDGETREMARK;
  Widget? WIDGETSWreport;

  Widget? WIDGETK1CALDATA;

  Widget? WIDGETCONVERSEDATA;
  Widget? WIDGETSUMdata;
  Widget? WIDGETSRAWDATA;
  Widget? WIDGETCON;

  Widget? WIDGETCONIP;
  Widget? WIDGETCONIPITEM;
  Widget? WIDGETCONIPITEMVAR;
//
  String? ACTION;
  int? ACTIONMODE;
  bool? isACTION;
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  Function(String)? SAVEFN;
  Color? BGColorMain;
  @override
  Widget build(BuildContext context) {
    int _ACTIONMODE = ACTIONMODE ?? 0;
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (Showseq ?? true) ...[
                Expanded(
                  flex: 3,
                  child: WIDGETseq == null
                      ? EACHCELL(
                          data: seq ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETseq ?? SizedBox(),
                ),
              ],

              if (ShowITEMs ?? true) ...[
                Expanded(
                  flex: 20,
                  child: WIDGETITEMs == null
                      ? EACHCELL(
                          data: ITEMs ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETITEMs ?? SizedBox(),
                ),
              ],
              if (ShowK1CALDATA ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETK1CALDATA == null
                      ? EACHCELL(
                          data: K1CALDATA ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETK1CALDATA ?? SizedBox(),
                ),
              ],
              if (ShowFORMULA ?? true) ...[
                Expanded(
                  flex: 20,
                  child: WIDGETFORMULA == null
                      ? EACHCELL(
                          data: FORMULA ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETFORMULA ?? SizedBox(),
                ),
              ],
              if (ShowSCMARK ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETSCMARK == null
                      ? EACHCELL(
                          data: SCMARK ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETSCMARK ?? SizedBox(),
                ),
              ],
              // if (ShowSCMARKtype ?? true) ...[
              //   Expanded(
              //     flex: 1,
              //     child: WIDGETSCMARKtype == null
              //         ? EACHCELL(
              //             data: SCMARKtype ?? "",
              //             tapCell: (v) {},
              //           )
              //         : WIDGETSCMARKtype ?? SizedBox(),
              //   ),
              // ],
              if (ShowDOCUMENT ?? true) ...[
                Expanded(
                  flex: 8,
                  child: WIDGETDOCUMENT == null
                      ? EACHCELL(
                          data: DOCUMENT ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETDOCUMENT ?? SizedBox(),
                ),
              ],
              if (ShowMETHOD ?? true) ...[
                Expanded(
                  flex: 8,
                  child: WIDGETMETHOD == null
                      ? EACHCELL(
                          data: METHOD ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETMETHOD ?? SizedBox(),
                ),
              ],
              // if (ShowIMGreaddata ?? true) ...[
              //   Expanded(
              //     flex: 2,
              //     child: WIDGETIMGreaddata == null
              //         ? EACHCELL(
              //             data: IMGreaddata ?? "",
              //             tapCell: (v) {},
              //           )
              //         : WIDGETIMGreaddata ?? SizedBox(),
              //   ),
              // ],
              // if (ShowIMGno ?? true) ...[
              //   Expanded(
              //     flex: 2,
              //     child: WIDGETIMGno == null
              //         ? EACHCELL(
              //             data: IMGno ?? "",
              //             tapCell: (v) {},
              //           )
              //         : WIDGETIMGno ?? SizedBox(),
              //   ),
              // ],
              if (ShowLOAD ?? true) ...[
                Expanded(
                  flex: 10,
                  child: WIDGETLOAD == null
                      ? EACHCELL(
                          data: LOAD ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETLOAD ?? SizedBox(),
                ),
              ],
              if (ShowGT ?? true) ...[
                Expanded(
                  flex: 10,
                  child: WIDGETGT == null
                      ? EACHCELL(
                          data: GT ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETGT ?? SizedBox(),
                ),
              ],
              if (ShowSPECIFICATIONve ?? true) ...[
                Expanded(
                  flex: 8,
                  child: WIDGETSPECIFICATIONve == null
                      ? EACHCELL(
                          data: SPECIFICATIONve ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETSPECIFICATIONve ?? SizedBox(),
                ),
              ],
              // if (ShowCALCULATE ?? true) ...[
              //   Expanded(
              //     flex: 1,
              //     child: WIDGETCALCULATE == null
              //         ? EACHCELL(
              //             data: CALCULATE ?? "",
              //             tapCell: (v) {},
              //           )
              //         : WIDGETCALCULATE ?? SizedBox(),
              //   ),
              // ],
              if (ShowUNIT ?? true) ...[
                Expanded(
                  flex: 4,
                  child: WIDGETUNIT == null
                      ? EACHCELL(
                          data: UNIT ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETUNIT ?? SizedBox(),
                ),
              ],

              if (ShowCONVERSE ?? true) ...[
                Expanded(
                  flex: 10,
                  child: WIDGETCONVERSE == null
                      ? EACHCELL(
                          data: CONVERSE ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCONVERSE ?? SizedBox(),
                ),
              ],
              if (ShowCONVERSEDATA ?? true) ...[
                Expanded(
                  flex: 10,
                  child: WIDGETCONVERSEDATA == null
                      ? EACHCELL(
                          data: CONVERSEDATA ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCONVERSEDATA ?? SizedBox(),
                ),
              ],

              if (ShowPOSITION ?? true) ...[
                Expanded(
                  flex: 3,
                  child: WIDGETPOSITION == null
                      ? EACHCELL(
                          data: POSITION ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETPOSITION ?? SizedBox(),
                ),
              ],
              if (ShowPCS ?? true) ...[
                Expanded(
                  flex: 4,
                  child: WIDGETPCS == null
                      ? EACHCELL(
                          data: PCS ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETPCS ?? SizedBox(),
                ),
              ],
              if (ShowFREQUENCY ?? true) ...[
                Expanded(
                  flex: 10,
                  child: WIDGETFREQUENCY == null
                      ? EACHCELL(
                          data: FREQUENCY ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETFREQUENCY ?? SizedBox(),
                ),
              ],
              if (ShowREMARK ?? true) ...[
                Expanded(
                  flex: 20,
                  child: WIDGETREMARK == null
                      ? EACHCELL(
                          data: REMARK ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETREMARK ?? SizedBox(),
                ),
              ],
              if (ShowCORStype ?? true) ...[
                Expanded(
                  flex: 20,
                  child: WIDGETCORStype == null
                      ? EACHCELL(
                          data: CORStype ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCORStype ?? SizedBox(),
                ),
              ],
              if (ShowSWreport ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETSWreport == null
                      ? EACHCELL(
                          data: SWreport ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETSWreport ?? SizedBox(),
                ),
              ],
              if (ShowSUMdata ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETSUMdata == null
                      ? EACHCELL(
                          data: SUMdata ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETSUMdata ?? SizedBox(),
                ),
              ],
              if (ShowSRAWDATA ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETSRAWDATA == null
                      ? EACHCELL(
                          data: SRAWDATA ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETSRAWDATA ?? SizedBox(),
                ),
              ],

              //-----------------------
              if (ShowCONIP ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETCONIP == null
                      ? EACHCELL(
                          data: CONIP ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCONIP ?? SizedBox(),
                ),
              ],
              if (ShowCONIPITEM ?? true) ...[
                Expanded(
                  flex: 15,
                  child: WIDGETCONIPITEM == null
                      ? EACHCELL(
                          data: CONIPITEM ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCONIPITEM ?? SizedBox(),
                ),
              ],
              if (ShowCONIPITEMVAR ?? true) ...[
                Expanded(
                  flex: 5,
                  child: WIDGETCONIPITEMVAR == null
                      ? EACHCELL(
                          data: CONIPITEMVAR ?? "",
                          tapCell: (v) {},
                        )
                      : WIDGETCONIPITEMVAR ?? SizedBox(),
                ),
              ],
//-----------------------

              if (_ACTIONMODE == 0) ...[
                Expanded(
                  flex: 10,
                  child: isACTION ?? false
                      ? ACTIONCELL(
                          isEdit: true,
                          DeleteFN: (v) {
                            if (DeleteFN != null) {
                              DeleteFN!("DeleteFN");
                            }
                          },
                          EditFN: (v) {
                            if (EditFN != null) {
                              EditFN!("EditFN");
                            }
                          },
                        )
                      : EACHCELL(
                          data: ACTION ?? "",
                          tapCell: (v) {},
                        ),
                ),
              ] else if (_ACTIONMODE == 1) ...[
                Expanded(
                  flex: 10,
                  child: isACTION ?? false
                      ? ACTIONCELLs(
                          SaveFN: (v) {
                            if (SAVEFN != null) {
                              SAVEFN!("SAVEFN");
                            }
                          },
                        )
                      : EACHCELL(
                          data: ACTION ?? "",
                          tapCell: (v) {},
                        ),
                ),
              ],
            ],
          )
        ],
      ),
    );
  }
}
