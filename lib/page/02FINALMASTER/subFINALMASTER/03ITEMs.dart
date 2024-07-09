import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/03ITEMStable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

late BuildContext ITEMStablecontext;

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
    ITEMStablecontext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.ITEMS_SORT_ST == 0) {
    } else if (FINALMASTERvar.ITEMS_SORT_ST == 1) {
      if (FINALMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      } else if (FINALMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((a, b) => a.f03.compareTo(b.f03));
      }
    } else if (FINALMASTERvar.ITEMS_SORT_ST == 2) {
      if (FINALMASTERvar.ITEMS_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.ITEMS_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      } else if (FINALMASTERvar.ITEMS_SORT_F == 2) {
        _data.sort((b, a) => a.f03.compareTo(b.f03));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.TYPEid_ITEMS_ACTION = '';
              FINALMASTERvar.ITEMS_ITEMS_ACTION = '';
              FINALMASTERvar.RESULTFORMAT_ITEMS_ACTION = '';
              FINALMASTERvar.GRAPHTYPE_ITEMS_ACTION = '';
              FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = '';
              FINALMASTERvar.DOCUMENTS_ITEMS_ACTION = '';
              FINALMASTERvar.CALCULATE_ITEMS_ACTION = '';
              FINALMASTERvar.masterID_ITEMS_ACTION = '';
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
              FINALMASTERvar.ITEMS_SORT_F = 0;
              if (FINALMASTERvar.ITEMS_SORT_ST == 0) {
                FINALMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 1) {
                FINALMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 2) {
                FINALMASTERvar.ITEMS_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
              }
            },
            F02: (v) {
              FINALMASTERvar.ITEMS_SORT_F = 1;
              if (FINALMASTERvar.ITEMS_SORT_ST == 0) {
                FINALMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 1) {
                FINALMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 2) {
                FINALMASTERvar.ITEMS_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
              }
            },
            F03: (v) {
              FINALMASTERvar.ITEMS_SORT_F = 2;
              if (FINALMASTERvar.ITEMS_SORT_ST == 0) {
                FINALMASTERvar.ITEMS_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 1) {
                FINALMASTERvar.ITEMS_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.ITEMS_SORT_ST == 2) {
                FINALMASTERvar.ITEMS_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
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
                FINALMASTERvar.masterID_ITEMS = _data[i].f21;
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_ITEMS_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_ITEMS_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.TYPEid_ITEMS_ACTION = _data[i].f01;
                FINALMASTERvar.ITEMS_ITEMS_ACTION = _data[i].f02;
                FINALMASTERvar.RESULTFORMAT_ITEMS_ACTION = _data[i].f03;
                FINALMASTERvar.GRAPHTYPE_ITEMS_ACTION = _data[i].f04;
                FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = _data[i].f05;
                FINALMASTERvar.DOCUMENTS_ITEMS_ACTION = _data[i].f06;
                FINALMASTERvar.CALCULATE_ITEMS_ACTION = _data[i].f07;
                FINALMASTERvar.masterID_ITEMS_ACTION = _data[i].f21;
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
                listdropdown: FINALMASTERvar.TYPEddBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    FINALMASTERvar.TYPEid_ITEMS_ACTION = d;
                  });
                },
                value: FINALMASTERvar.TYPEid_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "ITEMS",
              height: 40,
              width: 400,
              isContr: FINALMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  FINALMASTERvar.iscontrol = input;
                });
              },
              sValue: FINALMASTERvar.ITEMS_ITEMS_ACTION,
              returnfunc: (String s) {
                FINALMASTERvar.ITEMS_ITEMS_ACTION = s;
              },
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "RESULTFORMAT",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: FINALMASTERvar.RESULTFORMATBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    FINALMASTERvar.RESULTFORMAT_ITEMS_ACTION = d;
                  });
                },
                value: FINALMASTERvar.RESULTFORMAT_ITEMS_ACTION,
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
                listdropdown: FINALMASTERvar.GRAPHTYPEBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    FINALMASTERvar.GRAPHTYPE_ITEMS_ACTION = d;
                  });
                },
                value: FINALMASTERvar.GRAPHTYPE_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "GRAPH INTERSECTION",
              height: 40,
              width: 400,
              isContr: FINALMASTERvar.iscontrol,
              fnContr: (input) {
                setState(() {
                  FINALMASTERvar.iscontrol = input;
                });
              },
              sValue: FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
              returnfunc: (String s) {
                FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = s;
              },
            ),
            SizedBox(
              height: 64,
              width: 400,
              child: AdvanceDropDown(
                sLabel: "CALCULATE",
                imgpath: 'assets/icons/icon-down_4@3x.png',
                listdropdown: FINALMASTERvar.CALCULATEBUFF,
                onChangeinside: (d, k) {
                  setState(() {
                    FINALMASTERvar.CALCULATE_ITEMS_ACTION = d;
                  });
                },
                value: FINALMASTERvar.CALCULATE_ITEMS_ACTION,
                height: 40,
                width: 400,
              ),
            ),
            // ComInputText(nLimitedChar: 100,
            //   sLabel: "DOCUMENTS",
            //   height: 40,
            //   width: 400,
            //   isContr: FINALMASTERvar.iscontrol,
            //   fnContr: (input) {
            //     setState(() {
            //       FINALMASTERvar.iscontrol = input;
            //     });
            //   },
            //   sValue: FINALMASTERvar.DOCUMENTS_ITEMS_ACTION,
            //   returnfunc: (String s) {
            //     FINALMASTERvar.DOCUMENTS_ITEMS_ACTION = s;
            //   },
            // ),
            ComInputText(
              nLimitedChar: 100,
              sLabel: "masterID",
              height: 40,
              width: 400,
              isContr: FINALMASTERvar.iscontrol,
              // isEnabled: FINALMASTERvar.masterID_ACTION_isEnabled,
              fnContr: (input) {
                setState(() {
                  FINALMASTERvar.iscontrol = input;
                });
              },
              sValue: FINALMASTERvar.masterID_ITEMS_ACTION,
              returnfunc: (String s) {
                FINALMASTERvar.masterID_ITEMS_ACTION = s;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                ITEMStablecontext.read<FINALMASTERmsg_Bloc>()
                    .add(FINALMASTERmsg_ITEMS_EDIT());
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
//                     FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION = d;
//                   });
//                 },
//                 value: FINALMASTERvar.GRAPHINTERSECTION_ITEMS_ACTION,
//                 height: 40,
//                 width: 400,
//               ),
//             ),


