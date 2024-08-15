import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class CALCULATECONtableWidget extends StatelessWidget {
  CALCULATECONtableWidget({
    super.key,
    this.BGColorMain,
    this.CALCULATECONtext,
    this.FORMULAtext,
    this.ACTIONtext,
    this.isACTION,
    this.masterIDtext,
    this.EditFN,
    this.DeleteFN,
    this.F01,
  });
  Color? BGColorMain;
  String? CALCULATECONtext;
  String? FORMULAtext;
  String? ACTIONtext;
  bool? isACTION;
  String? masterIDtext;
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  Function(String)? F01;
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
                  data: CALCULATECONtext ?? "",
                  tapCell: (v) {
                    if (F01 != null) {
                      F01!("F01");
                    }
                  },
                ),
              ),
              // Expanded(
              //   flex: 1,
              //   child: EACHCELL(
              //     data: FORMULAtext ?? "",
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
