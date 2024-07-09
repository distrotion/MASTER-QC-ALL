import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/01TYPEtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

//context.read<FINALMASTER_Bloc>().add(FINALMASTER_COMMENTget());

//FINALMASTERmsg_FULSH

late BuildContext COMMENTtableContext;

class COMMENTtable extends StatelessWidget {
  COMMENTtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    COMMENTtableContext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.COMMENT_SORT_ST == 0) {
    } else if (FINALMASTERvar.COMMENT_SORT_ST == 1) {
      if (FINALMASTERvar.COMMENT_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (FINALMASTERvar.COMMENT_SORT_ST == 2) {
      if (FINALMASTERvar.COMMENT_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.iscontrol = true;
              FINALMASTERvar.COMMENT_COMMENT_ACTION = "";
              FINALMASTERvar.masterID_COMMENT_ACTION = "";
              COMMENTPOPUP(context);
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
                FINALMASTERvar.ischeck_COMMENT = true;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'true';
                }
              } else {
                FINALMASTERvar.ischeck_COMMENT = false;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'false';
                }
              }
              context.read<BlocPageRebuild>().rebuildPage();
            },
            //---------------------------------  muti check
            isCHECK: FINALMASTERvar.ischeck_COMMENT,
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "COMMENT",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              FINALMASTERvar.COMMENT_SORT_F = 0;
              if (FINALMASTERvar.COMMENT_SORT_ST == 0) {
                FINALMASTERvar.COMMENT_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.COMMENT_SORT_ST == 1) {
                FINALMASTERvar.COMMENT_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.COMMENT_SORT_ST == 2) {
                FINALMASTERvar.COMMENT_SORT_ST = 0;
                context.read<FINALMASTER_Bloc>().add(FINALMASTER_COMMENTget());
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
                FINALMASTERvar.masterID_COMMENT = _data[i].f21;
                // context
                //     .read<FINALMASTERmsg_Bloc>()
                //     .add(FINALMASTERmsg_COMMENT_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_COMMENT_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.iscontrol = true;
                FINALMASTERvar.COMMENT_COMMENT_ACTION = _data[i].f01;
                FINALMASTERvar.masterID_COMMENT_ACTION = _data[i].f21;
                COMMENTPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void COMMENTPOPUP(BuildContext contextin) {
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
  State<TYPEACTION> createState() => _COMMENTACTIONState();
}

class _COMMENTACTIONState extends State<TYPEACTION> {
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
              child: Text("COMMENT"),
            ),
          ),
          ComInputText(
            nLimitedChar: 100,
            sLabel: "COMMENT",
            height: 40,
            width: 400,
            isContr: FINALMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                FINALMASTERvar.iscontrol = input;
              });
            },
            sValue: FINALMASTERvar.COMMENT_COMMENT_ACTION,
            returnfunc: (String s) {
              FINALMASTERvar.COMMENT_COMMENT_ACTION = s;
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
            sValue: FINALMASTERvar.masterID_COMMENT_ACTION,
            returnfunc: (String s) {
              FINALMASTERvar.masterID_COMMENT_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              COMMENTtableContext.read<FINALMASTERmsg_Bloc>()
                  .add(FINALMASTERmsg_COMMENT_EDIT());
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
