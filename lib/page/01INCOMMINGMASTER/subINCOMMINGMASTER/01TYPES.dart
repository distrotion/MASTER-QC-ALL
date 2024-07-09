import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/01TYPEtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

//context.read<INCOMMINGMASTER_Bloc>().add(INCOMMINGMASTER_TYPEget());

//INCOMMINGMASTERmsg_FULSH

late BuildContext TYPEStable_INCContext;

class TYPEStable_INC extends StatelessWidget {
  TYPEStable_INC({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    TYPEStable_INCContext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.TYPE_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.TYPE_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.TYPE_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (INCOMMINGMASTERvar.TYPE_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.TYPE_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.iscontrol = true;
              INCOMMINGMASTERvar.TYPE_TYPE_ACTION = "";
              INCOMMINGMASTERvar.masterID_TYPE_ACTION = "";
              TYPEPOPUP(context);
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
          child: TYPEtableWidget(
            //---------------------------------  muti check
            FUCHECK: (v) {
              if (v == 'true') {
                INCOMMINGMASTERvar.ischeck_TYPE = true;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'true';
                }
              } else {
                INCOMMINGMASTERvar.ischeck_TYPE = false;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'false';
                }
              }
              context.read<BlocPageRebuild>().rebuildPage();
            },
            //---------------------------------  muti check
            isCHECK: INCOMMINGMASTERvar.ischeck_TYPE,
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "TYPE",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INCOMMINGMASTERvar.TYPE_SORT_F = 0;
              if (INCOMMINGMASTERvar.TYPE_SORT_ST == 0) {
                INCOMMINGMASTERvar.TYPE_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.TYPE_SORT_ST == 1) {
                INCOMMINGMASTERvar.TYPE_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.TYPE_SORT_ST == 2) {
                INCOMMINGMASTERvar.TYPE_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_TYPEget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: TYPEtableWidget(
              //----------------------------------  single check
              FUCHECK: (v) {
                if (v == 'true') {
                  _data[i].f100 = 'true';
                } else {
                  _data[i].f100 = 'false';
                }
                context.read<BlocPageRebuild>().rebuildPage();
              },
              isCHECK: _data[i].f100 != '' && _data[i].f100 != 'false',
              //----------------------------------  single check
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              TYPEtext: _data[i].f01,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INCOMMINGMASTERvar.masterID_TYPE = _data[i].f21;
                // context
                //     .read<INCOMMINGMASTERmsg_Bloc>()
                //     .add(INCOMMINGMASTERmsg_TYPE_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_TYPE_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.iscontrol = true;
                INCOMMINGMASTERvar.TYPE_TYPE_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.masterID_TYPE_ACTION = _data[i].f21;
                TYPEPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void TYPEPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: TYPEACTION(),
      );
    },
  );
}

class TYPEACTION extends StatefulWidget {
  const TYPEACTION({super.key});

  @override
  State<TYPEACTION> createState() => _TYPEACTIONState();
}

class _TYPEACTIONState extends State<TYPEACTION> {
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
              child: Text("TYPE"),
            ),
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "TYPE",
            height: 40,
            width: 400,
            isContr: INCOMMINGMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                INCOMMINGMASTERvar.iscontrol = input;
              });
            },
            sValue: INCOMMINGMASTERvar.TYPE_TYPE_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.TYPE_TYPE_ACTION = s;
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
            sValue: INCOMMINGMASTERvar.masterID_TYPE_ACTION,
            returnfunc: (String s) {
              INCOMMINGMASTERvar.masterID_TYPE_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              TYPEStable_INCContext.read<INCOMMINGMASTERmsg_Bloc>()
                  .add(INCOMMINGMASTERmsg_TYPE_EDIT());
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
      )),
    );
  }
}
