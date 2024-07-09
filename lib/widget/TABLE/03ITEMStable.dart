import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class ITEMstableWidget extends StatelessWidget {
  ITEMstableWidget({
    super.key,
    this.BGColorMain,
    this.TYPEtext,
    this.ITEMstext,
    this.RESULTFORMATtext,
    this.GRAPHTYPEtext,
    this.GRAPHINTERSECTIONtext,
    this.DOCUMENTStext,
    this.CALtext,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.F02,
    this.F03,
  });
  Color? BGColorMain;
  String? TYPEtext;
  String? ITEMstext;
  String? RESULTFORMATtext;
  String? GRAPHTYPEtext;
  String? GRAPHINTERSECTIONtext;
  String? DOCUMENTStext;
  String? CALtext;
  String? ACTIONtext;
  bool? isACTION;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  Function(String)? F01;
  Function(String)? F02;
  Function(String)? F03;

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
                flex: 1,
                child: EACHCELL(
                  data: TYPEtext ?? "",
                  tapCell: (v) {
                    if (F01 != null) {
                      F01!("F01");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: EACHCELL(
                  data: ITEMstext ?? "",
                  tapCell: (v) {
                    if (F02 != null) {
                      F02!("F02");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: RESULTFORMATtext ?? "",
                  tapCell: (v) {
                    if (F03 != null) {
                      F03!("F03");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: GRAPHTYPEtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: GRAPHINTERSECTIONtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              //CALtext
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: CALtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: DOCUMENTStext ?? "",
              //     tapCell: (v) {},
              //   ),
              // ),
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
                flex: 2,
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
