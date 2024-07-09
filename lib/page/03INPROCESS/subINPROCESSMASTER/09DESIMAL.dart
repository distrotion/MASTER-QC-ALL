import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../data/global.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/09DESIMALtable copy.dart';
import '../../../widget/common/Advancedropdown.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INPROCESSMASTERvar.dart';

//context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_DESIMALget());

//INPROCESSMASTERmsg_FULSH

late BuildContext DESIMALtable_IPContext;

class DESIMALtable extends StatelessWidget {
  DESIMALtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    DESIMALtable_IPContext = context;
    List<dataset> _data = data ?? [];
    if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 0) {
    } else if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 1) {
      if (INPROCESSMASTERvar.DESIMAL_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 2) {
      if (INPROCESSMASTERvar.DESIMAL_SORT_F == 0) {
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
              INPROCESSMASTERvar.DESIMAL_DESIMAL_ACTION = "";
              INPROCESSMASTERvar.masterID_DESIMAL_ACTION = "";
              DESIMALPOPUP(context);
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
          child: DESIMALtableWidget(
            //---------------------------------  muti check
            FUCHECK: (v) {
              if (v == 'true') {
                INPROCESSMASTERvar.ischeck_DESIMAL = true;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'true';
                }
              } else {
                INPROCESSMASTERvar.ischeck_DESIMAL = false;
                for (int i = 0; i < _data.length; i++) {
                  _data[i].f100 = 'false';
                }
              }
              context.read<BlocPageRebuild>().rebuildPage();
            },
            //---------------------------------  muti check
            isCHECK: INPROCESSMASTERvar.ischeck_DESIMAL,
            BGColorMain: Colors.grey.shade400,

            UNITtext: "UNIT",
            ITEMsext: "ITEMs",
            DESIMAL_SE01_text: "DESIMAL",

            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INPROCESSMASTERvar.DESIMAL_SORT_F = 0;
              // if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 0) {
              //   INPROCESSMASTERvar.DESIMAL_SORT_ST = 1;
              //   context.read<BlocPageRebuild>().rebuildPage();
              // } else if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 1) {
              //   INPROCESSMASTERvar.DESIMAL_SORT_ST = 2;
              //   context.read<BlocPageRebuild>().rebuildPage();
              // } else if (INPROCESSMASTERvar.DESIMAL_SORT_ST == 2) {
              //   INPROCESSMASTERvar.DESIMAL_SORT_ST = 0;
              //   context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_DESIMALget());
              // }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++) ...[
          SizedBox(
            height: 40,
            child: DESIMALtableWidget(
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
              UNITtext: _data[i].f01,
              ITEMsext: _data[i].f02,

              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INPROCESSMASTERvar.masterID_DESIMAL = _data[i].f21;
                // context
                //     .read<INPROCESSMASTERmsg_Bloc>()
                //     .add(INPROCESSMASTERmsg_DESIMAL_DROP());
                // POPUPyn(context, (v) {
                //   context
                //       .read<INPROCESSMASTERmsg_Bloc>()
                //       .add(INPROCESSMASTERmsg_DESIMAL_DROP());
                // }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INPROCESSMASTERvar.iscontrol = true;
                INPROCESSMASTERvar.DESIMAL_DESIMAL_ACTION = _data[i].f01;
                INPROCESSMASTERvar.masterID_DESIMAL_ACTION = _data[i].f21;
                DESIMALPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          ),
        ]
      ],
    );
  }
}

void DESIMALPOPUP(BuildContext contextin) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: DESIMALACTION(),
      );
    },
  );
}

class DESIMALACTION extends StatefulWidget {
  const DESIMALACTION({super.key});

  @override
  State<DESIMALACTION> createState() => _DESIMALACTIONState();
}

class _DESIMALACTIONState extends State<DESIMALACTION> {
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
              child: Text("DESIMAL"),
            ),
          ),
          SizedBox(
            height: 64,
            width: 400,
            child: AdvanceDropDown(
              sLabel: "METHOD",
              imgpath: 'assets/icons/icon-down_4@3x.png',
              listdropdown: INPROCESSMASTERvar.ITEMSddBUFF,
              onChangeinside: (d, k) async {
                INPROCESSMASTERvar.UNITsBUFF = [MapEntry("-", "-")];
                INPROCESSMASTERvar.DESIMAL_ITEMs_ACTION = d;
                final response = await Dio().post(
                  serverGB + "GET_UNIT_ITEM",
                  data: {
                    "ITEMs": INPROCESSMASTERvar.DESIMAL_ITEMs_ACTION,
                  },
                ).then((value) {
                  if (value.statusCode == 200) {
                    var databuff = value.data;

                    if (databuff.length > 0) {
                      for (var i = 0; i < databuff.length; i++) {
                        print(databuff[i]['UNIT']);
                        print(databuff[i]['masterID']);
                        INPROCESSMASTERvar.UNITsBUFF.add(MapEntry(
                            databuff[i]['UNIT'].toString(),
                            databuff[i]['masterID'].toString()));
                      }
                    }
                    setState(() {});
                  }
                });
              },
              value: INPROCESSMASTERvar.DESIMAL_ITEMs_ACTION,
              height: 40,
              width: 400,
            ),
          ),
          SizedBox(
            height: 64,
            width: 400,
            child: AdvanceDropDown(
              sLabel: "UNIT",
              imgpath: 'assets/icons/icon-down_4@3x.png',
              listdropdown: INPROCESSMASTERvar.UNITsBUFF,
              onChangeinside: (d, k) {
                setState(() {
                  INPROCESSMASTERvar.DESIMAL_UNITs_ACTION = d;
                });
              },
              value: INPROCESSMASTERvar.DESIMAL_UNITs_ACTION,
              height: 40,
              width: 400,
            ),
          ),
          ComInputText(
            nLimitedChar: 100,
            isNumberOnly: true,
            sLabel: "DESIMAL",
            height: 40,
            width: 400,
            isContr: INPROCESSMASTERvar.iscontrol,
            fnContr: (input) {
              setState(() {
                INPROCESSMASTERvar.iscontrol = input;
              });
            },
            sValue: INPROCESSMASTERvar.DESIMAL_NORMAL_ACTION,
            returnfunc: (String s) {
              INPROCESSMASTERvar.DESIMAL_NORMAL_ACTION = s;
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
            sValue: INPROCESSMASTERvar.masterID_DESIMAL_ACTION,
            returnfunc: (String s) {
              INPROCESSMASTERvar.masterID_DESIMAL_ACTION = s;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              // DESIMALtable_IPContext.read<INPROCESSMASTERmsg_Bloc>()
              //     .add(INPROCESSMASTERmsg_DESIMAL_EDIT());
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
