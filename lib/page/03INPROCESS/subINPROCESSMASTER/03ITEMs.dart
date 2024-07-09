import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../../../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/03ITEMStable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INPROCESSMASTERvar.dart';

late BuildContext ITEMStable_IPContext;

class ITEMStable extends StatelessWidget {
  ITEMStable({
    super.key,
    this.data,
    this.TYPEdd,
  });
  List<dataset>? data;
  List<MapEntry<String, String>>? TYPEdd;

  @override
  Widget build(BuildContext context) {
    ITEMStable_IPContext = context;
    List<dataset> _data = data ?? [];
    if (INPROCESSMASTERvar.ITEMS_SORT_ST == 0) {
    } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 1) {
      if (INPROCESSMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INPROCESSMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      } else if (INPROCESSMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((a, b) => a.f03.compareTo(b.f03));
      }
    } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 2) {
      if (INPROCESSMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INPROCESSMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      } else if (INPROCESSMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((b, a) => a.f03.compareTo(b.f03));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INPROCESSMASTERvar.TYPEid_ITEMS_ACTION = '';
              INPROCESSMASTERvar.ITEMS_ITEMS_ACTION = '';
              INPROCESSMASTERvar.RESULTFORMAT_ITEMS_ACTION = '';
              INPROCESSMASTERvar.GRAPHTYPE_ITEMS_ACTION = '';
              INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = '';
              INPROCESSMASTERvar.DOCUMENTS_ITEMS_ACTION = '';
              INPROCESSMASTERvar.CALCULATE_ITEMS_ACTION = '';
              INPROCESSMASTERvar.masterID_ITEMS_ACTION = '';
              ITEMSPOPUP(context);
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
          child: ITEMstableWidget(
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "TYPE",
            ITEMstext: "ITEMs",
            RESULTFORMATtext: "RESULT FORMAT",
            GRAPHTYPEtext: " GRAPH TYPE",
            GRAPHINTERSECTIONtext: "GRAPH INTERSECTION",
            DOCUMENTStext: "DOCUMENTS",
            CALtext: "F(x) Name",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INPROCESSMASTERvar.ITEMS_SORT_F = 0;
              if (INPROCESSMASTERvar.ITEMS_SORT_ST == 0) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 1) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 2) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_ITEMSget());
              }
            },
            F02: (v) {
              INPROCESSMASTERvar.ITEMS_SORT_F = 1;
              if (INPROCESSMASTERvar.ITEMS_SORT_ST == 0) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 1) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 2) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_ITEMSget());
              }
            },
            F03: (v) {
              INPROCESSMASTERvar.ITEMS_SORT_F = 2;
              if (INPROCESSMASTERvar.ITEMS_SORT_ST == 0) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 1) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.ITEMS_SORT_ST == 2) {
                INPROCESSMASTERvar.ITEMS_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_ITEMSget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: ITEMstableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              TYPEtext: _data[i].f11,
              ITEMstext: _data[i].f02,
              RESULTFORMATtext: _data[i].f03,
              GRAPHTYPEtext: _data[i].f04,
              GRAPHINTERSECTIONtext: _data[i].f05,
              DOCUMENTStext: _data[i].f06,
              CALtext: _data[i].f17,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INPROCESSMASTERvar.masterID_ITEMS = _data[i].f21;
                // context
                //     .read<INPROCESSMASTERmsg_Bloc>()
                //     .add(INPROCESSMASTERmsg_ITEMS_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INPROCESSMASTERmsg_Bloc>()
                      .add(INPROCESSMASTERmsg_ITEMS_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INPROCESSMASTERvar.TYPEid_ITEMS_ACTION = _data[i].f01;
                INPROCESSMASTERvar.ITEMS_ITEMS_ACTION = _data[i].f02;
                INPROCESSMASTERvar.RESULTFORMAT_ITEMS_ACTION = _data[i].f03;
                INPROCESSMASTERvar.GRAPHTYPE_ITEMS_ACTION = _data[i].f04;
                INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION =
                    _data[i].f05;
                INPROCESSMASTERvar.DOCUMENTS_ITEMS_ACTION = _data[i].f06;
                INPROCESSMASTERvar.CALCULATE_ITEMS_ACTION = _data[i].f07;
                INPROCESSMASTERvar.masterID_ITEMS_ACTION = _data[i].f21;
                ITEMSPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void ITEMSPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: ITEMSACTION(),
      );
    },
  );
}

class ITEMSACTION extends StatefulWidget {
  const ITEMSACTION({super.key});

  @override
  State<ITEMSACTION> createState() => _ITEMSACTIONState();
}

class _ITEMSACTIONState extends State<ITEMSACTION> {
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
                child: Text("ITEMS"),
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
                    INPROCESSMASTERvar.TYPEid_ITEMS_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.TYPEid_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "ITEMS",
              height: 40,
              width: 400,
              isContr: INPROCESSMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  INPROCESSMASTERvar.iscontrol = input;
                });
              },
              sValue: INPROCESSMASTERvar.ITEMS_ITEMS_ACTION,
              returnfunc: (String s) {
                INPROCESSMASTERvar.ITEMS_ITEMS_ACTION = s;
              },
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "RESULTFORMAT",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: INPROCESSMASTERvar.RESULTFORMATBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    INPROCESSMASTERvar.RESULTFORMAT_ITEMS_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.RESULTFORMAT_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "GRAPH TYPE",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: INPROCESSMASTERvar.GRAPHTYPEBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    INPROCESSMASTERvar.GRAPHTYPE_ITEMS_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.GRAPHTYPE_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "GRAPH INTERSECTION",
              height: 40,
              width: 400,
              isContr: INPROCESSMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  INPROCESSMASTERvar.iscontrol = input;
                });
              },
              sValue: INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
              returnfunc: (String s) {
                INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = s;
              },
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "CALCULATE",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: INPROCESSMASTERvar.CALCULATEBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    INPROCESSMASTERvar.CALCULATE_ITEMS_ACTION = d;
                  });
                },
                value: INPROCESSMASTERvar.CALCULATE_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            // ComInputText(nLimitedChar: 100,
            //   sLabel: "DOCUMENTS",
            //   height: 40,
            //   width: 400,
            //   isContr: INPROCESSMASTERvar.iscontrol,
            //   fnContr: (input) {
            //     setState(() {
            //       INPROCESSMASTERvar.iscontrol = input;
            //     });
            //   },
            //   sValue: INPROCESSMASTERvar.DOCUMENTS_ITEMS_ACTION,
            //   returnfunc: (String s) {
            //     INPROCESSMASTERvar.DOCUMENTS_ITEMS_ACTION = s;
            //   },
            // ),
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
              sValue: INPROCESSMASTERvar.masterID_ITEMS_ACTION,
              returnfunc: (String s) {
                INPROCESSMASTERvar.masterID_ITEMS_ACTION = s;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                ITEMStable_IPContext.read<INPROCESSMASTERmsg_Bloc>()
                    .add(INPROCESSMASTERmsg_ITEMS_EDIT());
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
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//               height: 64,
//               width: 400,
//               child: AdvanceDropDown(
//                 sLabel: "DESIMAL",
//                 imgpath: 'assets/icons/icon-down_4@3x.png',
//                 listdropdown: const [
//                   MapEntry("0", "0"),
//                   MapEntry("1", "1"),
//                   MapEntry("2", "2"),
//                   MapEntry("3", "3"),
//                   MapEntry("4", "4"),
//                   MapEntry("5", "5"),
//                 ],
//                 onChangeinside: (d, k) {
//                   setState(() {
//                     INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = d;
//                   });
//                 },
//                 value: INPROCESSMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
//                 height: 40,
//                 width: 400,
//               ),
//             ),


