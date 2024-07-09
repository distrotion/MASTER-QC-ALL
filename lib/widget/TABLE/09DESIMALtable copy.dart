import 'package:flutter/material.dart';

import '../common/CheckboxC.dart';
import '00EACHCALL.dart';

class DESIMALtableWidget extends StatelessWidget {
  DESIMALtableWidget({
    super.key,
    this.BGColorMain,
    this.UNITtext,
    this.ITEMsext,
    this.DESIMAL_SE01_text,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.F02,
    this.F03,
    this.FUCHECK,
    this.isCHECK,
  });
  Color? BGColorMain;
  String? UNITtext;
  String? ITEMsext;

  String? DESIMAL_SE01_text;

  String? ACTIONtext;
  bool? isACTION;
  bool? isCHECK;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  Function(String)? F01;
  Function(String)? F02;
  Function(String)? F03;
  Function(String)? FUCHECK;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              // //------------------------------  OOP side

              // Expanded(
              //   flex: 1,
              //   child: SizedBox(
              //     height: 24,
              //     width: 24,
              //     child: CheckBoxC(
              //       value: isCHECK ?? false,
              //       getChbox: (value) {
              //         if (FUCHECK != null) {
              //           FUCHECK!(value.toString());
              //         }
              //       },
              //     ),
              //   ),
              // ),

              // //------------------------------

              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: ITEMsext ?? "",
                  tapCell: (v) {
                    if (F01 != null) {
                      F01!("F01");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: UNITtext ?? "",
                  tapCell: (v) {
                    if (F01 != null) {
                      F01!("F01");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: DESIMAL_SE01_text ?? "",
                  tapCell: (v) {
                    if (F02 != null) {
                      F02!("F02");
                    }
                  },
                ),
              ),

              Expanded(
                flex: 1,
                child: isACTION ?? false
                    ? ACTIONCELL(
                        DeleteFN: (v) {
                          DeleteFN!("DeleteFN");
                        },
                        EditFN: (v) {
                          EditFN!("EditFN");
                        },
                      )
                    : EACHCELL(
                        data: ACTIONtext ?? "",
                        tapCell: (v) {},
                      ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: masterIDtext ?? "",
                  tapCell: (v) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
