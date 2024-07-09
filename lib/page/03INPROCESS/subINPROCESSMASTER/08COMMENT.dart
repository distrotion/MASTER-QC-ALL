import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../../../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/01TYPEtable.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INPROCESSMASTERvar.dart';

//context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_COMMENTget());

//INPROCESSMASTERmsg_FULSH

late BuildContext COMMENTtable_IPContext;

class COMMENTtable extends StatelessWidget {
  COMMENTtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    COMMENTtable_IPContext = context;
    List<dataset> _data = data ?? [];
    if (INPROCESSMASTERvar.COMMENT_SORT_ST == 0) {
    } else if (INPROCESSMASTERvar.COMMENT_SORT_ST == 1) {
      if (INPROCESSMASTERvar.COMMENT_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (INPROCESSMASTERvar.COMMENT_SORT_ST == 2) {
      if (INPROCESSMASTERvar.COMMENT_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INPROCESSMASTERvar.iscontrol = true;
              INPROCESSMASTERvar.COMMENT_COMMENT_ACTION = "";
              INPROCESSMASTERvar.masterID_COMMENT_ACTION = "";
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
                INPROCESSMASTERvar.ischeck_COMMENT = true;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'true';
                }
              } else {
                INPROCESSMASTERvar.ischeck_COMMENT = false;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'false';
                }
              }
              context.read<BlocPageRebuild>().rebuildPage();
            },
            //---------------------------------  muti check
            isCHECK: INPROCESSMASTERvar.ischeck_COMMENT,
            BGColorMain: Colors.grey.shade400,
            TYPEtext: "COMMENT",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INPROCESSMASTERvar.COMMENT_SORT_F = 0;
              if (INPROCESSMASTERvar.COMMENT_SORT_ST == 0) {
                INPROCESSMASTERvar.COMMENT_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.COMMENT_SORT_ST == 1) {
                INPROCESSMASTERvar.COMMENT_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.COMMENT_SORT_ST == 2) {
                INPROCESSMASTERvar.COMMENT_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_COMMENTget());
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
                INPROCESSMASTERvar.masterID_COMMENT = _data[i].f21;
                // context
                //     .read<INPROCESSMASTERmsg_Bloc>()
                //     .add(INPROCESSMASTERmsg_COMMENT_DROP());
                POPUPyn(context, (v) {
                  context
                      .read<INPROCESSMASTERmsg_Bloc>()
                      .add(INPROCESSMASTERmsg_COMMENT_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INPROCESSMASTERvar.iscontrol = true;
                INPROCESSMASTERvar.COMMENT_COMMENT_ACTION = _data[i].f01;
                INPROCESSMASTERvar.masterID_COMMENT_ACTION = _data[i].f21;
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
            isContr: INPROCESSMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                INPROCESSMASTERvar.iscontrol = input;
              });
            },
            sValue: INPROCESSMASTERvar.COMMENT_COMMENT_ACTION,
            returnfunc: (String s) {
              INPROCESSMASTERvar.COMMENT_COMMENT_ACTION = s;
            },
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
            sValue: INPROCESSMASTERvar.masterID_COMMENT_ACTION,
            returnfunc: (String s) {
              INPROCESSMASTERvar.masterID_COMMENT_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              COMMENTtable_IPContext.read<INPROCESSMASTERmsg_Bloc>()
                  .add(INPROCESSMASTERmsg_COMMENT_EDIT());
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
