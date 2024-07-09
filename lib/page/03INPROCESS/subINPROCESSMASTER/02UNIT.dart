import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../../../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/02UNITtable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INPROCESSMASTERvar.dart';

//context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_UNITget());

late BuildContext UNITStable_IPContext;

class UNITStable extends StatelessWidget {
  UNITStable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    UNITStable_IPContext = context;
    List<dataset> _data = data ?? [];
    if (INPROCESSMASTERvar.UNIT_SORT_ST == 0) {
    } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 1) {
      if (INPROCESSMASTERvar.UNIT_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INPROCESSMASTERvar.UNIT_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      }
    } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 2) {
      if (INPROCESSMASTERvar.UNIT_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INPROCESSMASTERvar.UNIT_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INPROCESSMASTERvar.iscontrol = true;
              INPROCESSMASTERvar.TYPEid_UNIT_ACTION = "";
              INPROCESSMASTERvar.UNIT_UNIT_ACTION = "";
              INPROCESSMASTERvar.masterID_UNIT_ACTION = "";
              UNITPOPUP(context);
            },
            child: Container(
              height: 30,
              width: 100,
              color: Colors.blue,
              child: const Center(
                  child: Text(
                "NEW",
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: UNITtableWidget(
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "TYPE",
            UNITtext: "UNIT",
            DESIMALtext: "DESIMAL",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INPROCESSMASTERvar.UNIT_SORT_F = 0;
              if (INPROCESSMASTERvar.UNIT_SORT_ST == 0) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 1) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 2) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_UNITget());
              }
            },
            F02: (v) {
              INPROCESSMASTERvar.UNIT_SORT_F = 1;
              if (INPROCESSMASTERvar.UNIT_SORT_ST == 0) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 1) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.UNIT_SORT_ST == 2) {
                INPROCESSMASTERvar.UNIT_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_UNITget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: UNITtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              TYPEtext: _data[i].f11,
              UNITtext: _data[i].f02,
              DESIMALtext: _data[i].f03,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INPROCESSMASTERvar.masterID_UNIT = _data[i].f21;
                // context
                //     .read<INPROCESSMASTERmsg_Bloc>()
                //     .add(INPROCESSMASTERmsg_UNIT_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INPROCESSMASTERmsg_Bloc>()
                      .add(INPROCESSMASTERmsg_UNIT_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INPROCESSMASTERvar.iscontrol = true;
                INPROCESSMASTERvar.TYPEid_UNIT_ACTION = _data[i].f01;
                INPROCESSMASTERvar.UNIT_UNIT_ACTION = _data[i].f02;
                INPROCESSMASTERvar.masterID_UNIT_ACTION = _data[i].f21;
                UNITPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void UNITPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: UNITACTION(),
      );
    },
  );
}

class UNITACTION extends StatefulWidget {
  const UNITACTION({super.key});

  @override
  State<UNITACTION> createState() => _UNITACTIONState();
}

class _UNITACTIONState extends State<UNITACTION> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 450,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              child: Center(
                child: Text("UNIT"),
              ),
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "TYPE",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: INPROCESSMASTERvar.TYPEddBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    INPROCESSMASTERvar.TYPEid_UNIT_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.TYPEid_UNIT_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "UNIT",
              height: 40,
              width: 400,
              isContr: INPROCESSMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  INPROCESSMASTERvar.iscontrol = input;
                });
              },
              sValue: INPROCESSMASTERvar.UNIT_UNIT_ACTION,
              returnfunc: (String s) {
                INPROCESSMASTERvar.UNIT_UNIT_ACTION = s;
              },
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "DESIMAL",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: const [
                  MapEntry("", ""),
                  MapEntry("0", "0"),
                  MapEntry("1", "1"),
                  MapEntry("2", "2"),
                  MapEntry("3", "3"),
                  MapEntry("4", "4"),
                  MapEntry("5", "5"),
                ],
                onChangeinside: (d, k) {
                  setState(() {
                    INPROCESSMASTERvar.DESIMAL_UNIT_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.DESIMAL_UNIT_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "masterID",
              height: 40,
              width: 400,
              isContr: INPROCESSMASTERvar.iscontrol,
              // isEnabled: INPROCESSMASTERvar.masterID_ACTION_isEnabled,
              fnContr: (input) {
                setState(() {
                  INPROCESSMASTERvar.iscontrol = input;
                });
              },
              sValue: INPROCESSMASTERvar.masterID_UNIT_ACTION,
              returnfunc: (String s) {
                INPROCESSMASTERvar.masterID_UNIT_ACTION = s;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                UNITStable_IPContext.read<INPROCESSMASTERmsg_Bloc>()
                    .add(INPROCESSMASTERmsg_UNIT_EDIT());
              },
              child: Container(
                height: 40,
                width: 200,
                color: Colors.blue,
                child: const Center(
                    child: Text(
                  "SAVE",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
