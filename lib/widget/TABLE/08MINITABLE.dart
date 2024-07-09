import 'package:flutter/material.dart';

import '00EACHCALL.dart';

class SINGLETABLE extends StatelessWidget {
  SINGLETABLE({
    super.key,
    this.MCtext,
    this.DeleteFN,
  });
  String? MCtext;
  Function(String)? DeleteFN;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: EACHCELL(
                  data: MCtext ?? "",
                  tapCell: (v) {},
                ),
              ),
              Expanded(
                flex: 1,
                child: ACTIONCELLsingle(
                  DeleteFN: (v) {
                    DeleteFN!("DeleteFN");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
