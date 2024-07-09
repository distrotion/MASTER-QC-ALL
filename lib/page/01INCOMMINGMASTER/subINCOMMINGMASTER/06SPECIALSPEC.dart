import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/06SPECIALSPECtable.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

late BuildContext SPECIALSPECtable_INCcontext;

class SPECIALSPECtable_INC extends StatelessWidget {
  SPECIALSPECtable_INC({
    super.key,
    this.data,
  });
  final List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    SPECIALSPECtable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 0) {
        _data.sort((a, b) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 1) {
        _data.sort((a, b) => a.f02.compareTo(b.f02));
      }
    } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 0) {
        _data.sort((b, a) => a.f11.compareTo(b.f11));
      } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_F == 1) {
        _data.sort((b, a) => a.f02.compareTo(b.f02));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION = '';
              INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = '';
              SPECIALSPECPOPUP(context);
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
          child: SPECIALSPECtableWidget(
            BGColorMain: Colors.grey.shade400,
            ITEMstext: "ITEMs",
            SPECIFICATIONtext: "SPECIFICATION",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.SPECIALSPEC_SORT_F = 0;
              if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 0) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 1) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 2) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_SPECIALSPECget());
              }
            },
            F02: (v) {
              INCOMMINGMASTERvar.SPECIALSPEC_SORT_F = 1;
              if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 0) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 1) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST == 2) {
                INCOMMINGMASTERvar.SPECIALSPEC_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_SPECIALSPECget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: SPECIALSPECtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              ITEMstext: _data[i].f11,
              SPECIFICATIONtext: _data[i].f02,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_SPECIALSPEC = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_SPECIFICATION_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_SPECIFICATION_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION =
                    _data[i].f02;
                INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = _data[i].f21;
                SPECIALSPECPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void SPECIALSPECPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: SPECIALSPECACTION(),
      );
    },
  );
}

class SPECIALSPECACTION extends StatefulWidget {
  const SPECIALSPECACTION({super.key});

  @override
  State<SPECIALSPECACTION> createState() => _SPECIALSPECACTIONState();
}

class _SPECIALSPECACTIONState extends State<SPECIALSPECACTION> {
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
              child: Text("SPECIALSPEC"),
            ),
          ),
          SizedBox(
            height: 64,
            width: 400,
            child: AdvanceDropDown(
              sLabel: "ITEM",
              imgpath: 'assets/icons/icon-down_4@3x.png',
              listdropdown: INCOMMINGMASTERvar.ITEMSddBUFF,
              onChangeinside: (d, k) {
                setState(() {
                  INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION = d;
                });
              },
              value: INCOMMINGMASTERvar.ITEM_SPECIALSPEC_ACTION,
              height: 40,
              width: 400,
            ),
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "SPECIALSPEC",
            height: 40,
            width: 400,
            isContr: INCOMMINGMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                INCOMMINGMASTERvar.iscontrol = input;
              });
            },
            sValue: INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.SPECIALSPEC_SPECIALSPEC_ACTION = s;
            },
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "masterID",
            height: 40,
            width: 400,
            isContr: INCOMMINGMASTERvar.iscontrol,
            // isEnabled: INCOMMINGMASTERvar.masterID_ACTION_isEnabled,
            fnContr: (input) {
              setState(() {
                INCOMMINGMASTERvar.iscontrol = input;
              });
            },
            sValue: INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.masterID_SPECIALSPEC_ACTION = s;
            },
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              SPECIALSPECtable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                  .add(INCOMMINGMASTERmsg_SPECIFICATION_EDIT());
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
      )),
    );
  }
}
