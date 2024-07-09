import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/05METHODEtable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

late BuildContext METHODtablecontext;

class METHODtable extends StatelessWidget {
  METHODtable({
    super.key,
    this.data,
    this.ITEMSdd,
    this.METHODdd,
  });
  List<dataset>? data;
  List<MapEntry<String, String>>? ITEMSdd;
  List<MapEntry<String, String>>? METHODdd;

  @override
  Widget build(BuildContext context) {
    METHODtablecontext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.METHOD_SORT_ST == 0) {
    } else if (FINALMASTERvar.METHOD_SORT_ST == 1) {
      if (FINALMASTERvar.METHOD_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.METHOD_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      } else if (FINALMASTERvar.METHOD_SORT_F == 2) {
        _data.sort((a, b) => a.f03.compareTo(b.f03));
      }
    } else if (FINALMASTERvar.METHOD_SORT_ST == 2) {
      if (FINALMASTERvar.METHOD_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (FINALMASTERvar.METHOD_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      } else if (FINALMASTERvar.METHOD_SORT_F == 2) {
        _data.sort((b, a) => a.f03.compareTo(b.f03));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.ITEM_METHOD_ACTION = '';
              FINALMASTERvar.METHOD_METHOD_ACTION = '';
              FINALMASTERvar.DOCUMENT_METHOD_ACTION = '';
              FINALMASTERvar.masterID_METHOD_ACTION = '';
              METHODPOPUP(context);
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
          child: METHODtableWidget(
            BGColorMain: Colors.grey.shade400,
            ITEMstext: "ITEMs",
            METHODtext: "METHOD",
            DOCUMENTtext: "DOCUMENT",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              FINALMASTERvar.METHOD_SORT_F = 0;
              if (FINALMASTERvar.METHOD_SORT_ST == 0) {
                FINALMASTERvar.METHOD_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 1) {
                FINALMASTERvar.METHOD_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 2) {
                FINALMASTERvar.METHOD_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_METHODEget());
              }
            },
            F02: (v) {
              FINALMASTERvar.METHOD_SORT_F = 1;
              if (FINALMASTERvar.METHOD_SORT_ST == 0) {
                FINALMASTERvar.METHOD_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 1) {
                FINALMASTERvar.METHOD_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 2) {
                FINALMASTERvar.METHOD_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_METHODEget());
              }
            },
            F03: (v) {
              FINALMASTERvar.METHOD_SORT_F = 2;
              if (FINALMASTERvar.METHOD_SORT_ST == 0) {
                FINALMASTERvar.METHOD_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 1) {
                FINALMASTERvar.METHOD_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.METHOD_SORT_ST == 2) {
                FINALMASTERvar.METHOD_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_METHODEget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: METHODtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              ITEMstext: _data[i].f11,
              METHODtext: _data[i].f12,
              DOCUMENTtext: _data[i].f03,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                FINALMASTERvar.masterID_METHODE = _data[i].f21;
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_METHODE_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_METHODE_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.ITEM_METHOD_ACTION = _data[i].f01;
                FINALMASTERvar.METHOD_METHOD_ACTION = _data[i].f02;
                FINALMASTERvar.DOCUMENT_METHOD_ACTION = _data[i].f03;
                FINALMASTERvar.masterID_METHOD_ACTION = _data[i].f21;
                METHODPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void METHODPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: METHODACTION(),
      );
    },
  );
}

class METHODACTION extends StatefulWidget {
  const METHODACTION({super.key});

  @override
  State<METHODACTION> createState() => _METHODACTIONState();
}

class _METHODACTIONState extends State<METHODACTION> {
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
                  child: Text("METHOD"),
                ),
              ),
              SizedBox(
                height: 64,
                width: 400,
                child: AdvanceDropDown(
                  sLabel: "ITEM",
                  imgpath: 'assets/icons/icon-down_4@3x.png',
                  listdropdown: FINALMASTERvar.ITEMSddBUFF,
                  onChangeinside: (d, k) {
                    setState(() {
                      FINALMASTERvar.ITEM_METHOD_ACTION = d;
                    });
                  },
                  value: FINALMASTERvar.ITEM_METHOD_ACTION,
                  height: 40,
                  width: 400,
                ),
              ),
              SizedBox(
                height: 64,
                width: 400,
                child: AdvanceDropDown(
                  sLabel: "METHOD",
                  imgpath: 'assets/icons/icon-down_4@3x.png',
                  listdropdown: FINALMASTERvar.METHODddBUFF,
                  onChangeinside: (d, k) {
                    setState(() {
                      FINALMASTERvar.METHOD_METHOD_ACTION = d;
                    });
                  },
                  value: FINALMASTERvar.METHOD_METHOD_ACTION,
                  height: 40,
                  width: 400,
                ),
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "DOCUMENT",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.DOCUMENT_METHOD_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.DOCUMENT_METHOD_ACTION = s;
                },
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
                sValue: FINALMASTERvar.masterID_METHOD_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.masterID_METHOD_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  METHODtablecontext.read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_METHODE_EDIT());
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
