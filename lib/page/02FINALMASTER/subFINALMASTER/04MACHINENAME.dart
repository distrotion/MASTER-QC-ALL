import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/04MACHINENAMEtable.dart';
import '../../../widget/TABLE/08MINITABLE.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

late BuildContext MACHINENAMEtablecontext;

class MACHINENAMEtable extends StatelessWidget {
  MACHINENAMEtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    MACHINENAMEtablecontext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.MACHINENAME_SORT_ST == 0) {
    } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 1) {
      if (FINALMASTERvar.MACHINENAME_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.MACHINENAME_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      }
    } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 2) {
      if (FINALMASTERvar.MACHINENAME_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.MACHINENAME_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.METHOD_MACHINENAME_ACTION = '';
              FINALMASTERvar.MACHINE_MACHINENAME_ACTION = '';
              FINALMASTERvar.DESIMAL_MACHINENAME_ACTION = '';
              FINALMASTERvar.masterID_MACHINENAME_ACTION = '';
              FINALMASTERvar.MACHINElist_MACHINENAME_ACTION = [];
              MACHINENAMEPOPUP(context);
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
          child: MACHINEtableWidget(
            BGColorMain: Colors.grey.shade400,
            METHODtext: "METHOD",
            MACHINEtext: "MACHINE",
            DESIMALtext: "DESIMAL",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              FINALMASTERvar.MACHINENAME_SORT_F = 0;
              if (FINALMASTERvar.MACHINENAME_SORT_ST == 0) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 1) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 2) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 0;
                context
                    .read<FINALMASTER_Bloc>()
                    .add(FINALMASTER_MACHINENAMEget());
              }
            },
            F02: (v) {
              FINALMASTERvar.MACHINENAME_SORT_F = 1;
              if (FINALMASTERvar.MACHINENAME_SORT_ST == 0) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 1) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.MACHINENAME_SORT_ST == 2) {
                FINALMASTERvar.MACHINENAME_SORT_ST = 0;
                context
                    .read<FINALMASTER_Bloc>()
                    .add(FINALMASTER_MACHINENAMEget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: MACHINEtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              METHODtext: _data[i].f01,
              MACHINEtext: _data[i].f02,
              DESIMALtext: _data[i].f03,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                FINALMASTERvar.masterID_MACHINENAME = _data[i].f21;
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_MACHINENAME_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_MACHINENAME_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.METHOD_MACHINENAME_ACTION = _data[i].f01;
                FINALMASTERvar.MACHINE_MACHINENAME_ACTION = '';
                FINALMASTERvar.DESIMAL_MACHINENAME_ACTION = _data[i].f03;
                FINALMASTERvar.masterID_MACHINENAME_ACTION = _data[i].f21;
                FINALMASTERvar.MACHINElist_MACHINENAME_ACTION =
                    _data[i].f02.split(',');

                print(FINALMASTERvar.MACHINElist_MACHINENAME_ACTION);

                MACHINENAMEPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void MACHINENAMEPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: MACHINENAMEACTION(),
      );
    },
  );
}

class MACHINENAMEACTION extends StatefulWidget {
  const MACHINENAMEACTION({super.key});

  @override
  State<MACHINENAMEACTION> createState() => _MACHINENAMEACTIONState();
}

class _MACHINENAMEACTIONState extends State<MACHINENAMEACTION> {
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
                  child: Text("MACHINE NAME"),
                ),
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "METHOD",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.METHOD_MACHINENAME_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.METHOD_MACHINENAME_ACTION = s;
                },
              ),
              SizedBox(
                height: 64,
                width: 400,
                child: AdvanceDropDown(
                  sLabel: "GRAPH TYPE",
                  imgpath: 'assets/icons/icon-down_4@3x.png',
                  listdropdown: FINALMASTERvar.INSTRUMENTSBUFF,
                  onChangeinside: (d, k) {
                    setState(() {
                      FINALMASTERvar.MACHINE_MACHINENAME_ACTION = d;
                      FINALMASTERvar.MACHINElist_MACHINENAME_ACTION.add(
                          FINALMASTERvar.MACHINE_MACHINENAME_ACTION);
                    });
                  },
                  value: FINALMASTERvar.MACHINE_MACHINENAME_ACTION,
                  height: 40,
                  width: 400,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  children: [
                    for (int i = 0;
                        i <
                            FINALMASTERvar
                                .MACHINElist_MACHINENAME_ACTION.length;
                        i++) ...[
                      SINGLETABLE(
                        MCtext:
                            FINALMASTERvar.MACHINElist_MACHINENAME_ACTION[i],
                        DeleteFN: (v) {
                          setState(() {
                            FINALMASTERvar.MACHINElist_MACHINENAME_ACTION
                                .removeWhere((item) =>
                                    item ==
                                    FINALMASTERvar
                                        .MACHINElist_MACHINENAME_ACTION[i]);
                          });
                        },
                      )
                    ],
                  ],
                ),
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
                      FINALMASTERvar.DESIMAL_MACHINENAME_ACTION = d;
                    });
                  },
                  value: FINALMASTERvar.DESIMAL_MACHINENAME_ACTION,
                  height: 40,
                  width: 400,
                ),
              ),
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
                sValue: FINALMASTERvar.masterID_MACHINENAME_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.masterID_MACHINENAME_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  MACHINENAMEtablecontext.read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_MACHINENAME_EDIT());
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
        ));
  }
}
