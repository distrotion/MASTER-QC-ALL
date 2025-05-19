import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class GRAPHtabletableWidget extends StatelessWidget {
  GRAPHtabletableWidget({
    super.key,
    this.BGColorMain,
    this.NAME,
    this.S01,
    this.S02,
    this.S03,
    this.S04,
    this.S05,
    this.S06,
    this.S07,
    this.S08,
    this.S09,
    this.S10,
    this.S11,
    this.S12,
    this.S13,
    this.S14,
    this.S15,
    this.S16,
    this.S17,
    this.S18,
    this.S19,
    this.S20,
    this.ACTIONtext,
    this.isACTION,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.F02,
  });
  String? NAME;
  String? S01;
  String? S02;
  String? S03;
  String? S04;
  String? S05;
  String? S06;
  String? S07;
  String? S08;
  String? S09;
  String? S10;
  String? S11;
  String? S12;
  String? S13;
  String? S14;
  String? S15;
  String? S16;
  String? S17;
  String? S18;
  String? S19;
  String? S20;

  Color? BGColorMain;
  String? ACTIONtext;
  bool? isACTION;

  Function(String)? EditFN;
  Function(String)? DeleteFN;

  Function(String)? F01;
  Function(String)? F02;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: EACHCELL(
                  data: NAME ?? "",
                  tapCell: (v) {
                    if (F01 != null) {
                      F01!("F1");
                    }
                  },
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S01 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S02 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S03 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S04 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S05 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S06 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S07 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S08 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S08 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S09 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S10 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S11 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S12 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S13 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S14 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S15 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S16 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S17 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S18 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S19 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: S20 ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
              Expanded(
                flex: 1,
                child: isACTION ?? false
                    ? ACTIONCELL(
                        isdelete: false,
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
            ],
          ),
        ],
      ),
    );
  }
}
