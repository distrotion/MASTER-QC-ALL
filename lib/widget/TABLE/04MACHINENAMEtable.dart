import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class MACHINEtableWidget extends StatelessWidget {
  MACHINEtableWidget({
    super.key,
    this.BGColorMain,
    this.METHODtext,
    this.MACHINEtext,
    this.DESIMALtext,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
    this.F02,
  });
  Color? BGColorMain;
  String? METHODtext;
  String? MACHINEtext;
  String? DESIMALtext;
  String? ACTIONtext;
  bool? isACTION;
  String? masterIDtext;
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
                flex: 1,
                child: EACHCELL(
                  data: METHODtext ?? "",
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
                  data: MACHINEtext ?? "",
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
                  data: DESIMALtext ?? "",
                  tapCell: (v) {},
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
