import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class MATCPlistTABLE extends StatelessWidget {
  MATCPlistTABLE({
    super.key,
    this.BGColorMain,
    this.isACTION,
    this.CP,
    this.FG,
    this.CUSTOMMER,
    this.PART,
    this.PARTNAME,
    this.MATERIAL,
    this.STATUS,
    this.EditFN,
  });
  Function(String)? EditFN;
  Function(String)? DeleteFN;
  String? ACTION, CP, FG, CUSTOMMER, PART, PARTNAME, MATERIAL, STATUS;
  bool? isACTION;
  Color? BGColorMain;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGColorMain ?? Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: CP ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: FG ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: CUSTOMMER ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 2,
            child: EACHCELL(
              data: PART ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 2,
            child: EACHCELL(
              data: PARTNAME ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: MATERIAL ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: EACHCELL(
              data: STATUS ?? "",
              tapCell: (v) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: isACTION ?? false
                ? ACTIONCELL(
                    isdelete: false,
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
                    data: "ACTION",
                    tapCell: (v) {},
                  ),
          ),
        ],
      ),
    );
  }
}
