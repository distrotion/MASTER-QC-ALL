import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../../../bloc/BlocEvent/03-2-INPROCESSMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/10CALCULATECONtable.dart';
import '../../../widget/common/CheckboxC.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INPROCESSMASTERvar.dart';

late BuildContext CALCULATECONtable_IPContext;

class CALCULATECONtable extends StatelessWidget {
  CALCULATECONtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    CALCULATECONtable_IPContext = context;
    List<dataset> _data = data ?? [];
    if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 0) {
    } else if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 1) {
      if (INPROCESSMASTERvar.CALCULATECON_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 2) {
      if (INPROCESSMASTERvar.CALCULATECON_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INPROCESSMASTERvar.CALCULATECON_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.FORMULA_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.X_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.Xb_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.Y_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.Yb_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.Z_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.Zb_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.I_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.Ib_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.K1_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.K1b_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.K2_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.K2b_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.K3_CALCULATECON_ACTION = '';
              INPROCESSMASTERvar.K3b_CALCULATECON_ACTION = false;
              INPROCESSMASTERvar.masterID_CALCULATECON_ACTION = '';
              CALCULATECONPOPUP(context);
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
          child: CALCULATECONtableWidget(
            BGColorMain: Colors.grey.shade400,
            CALCULATECONtext: "CAL NAME",
            FORMULAtext: " FORMULA",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              INPROCESSMASTERvar.CALCULATECON_SORT_F = 0;
              if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 0) {
                INPROCESSMASTERvar.CALCULATECON_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 1) {
                INPROCESSMASTERvar.CALCULATECON_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INPROCESSMASTERvar.CALCULATECON_SORT_ST == 2) {
                INPROCESSMASTERvar.CALCULATECON_SORT_ST = 0;
                context
                    .read<INPROCESSMASTER_Bloc>()
                    .add(INPROCESSMASTER_CALCULATECONget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++)
          SizedBox(
            height: 40,
            child: CALCULATECONtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              CALCULATECONtext: _data[i].f01,
              FORMULAtext: _data[i].f02,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                INPROCESSMASTERvar.masterID_CALCULATECON = _data[i].f21;
                POPUPyn(context, (v) {
                  context
                      .read<INPROCESSMASTERmsg_Bloc>()
                      .add(INPROCESSMASTERmsg_CALCULATECON_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INPROCESSMASTERvar.CALCULATECON_CALCULATECON_ACTION =
                    _data[i].f01;
                INPROCESSMASTERvar.FORMULA_CALCULATECON_ACTION = _data[i].f02;
                INPROCESSMASTERvar.X_CALCULATECON_ACTION = _data[i].f41;
                INPROCESSMASTERvar.Xb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f51);
                INPROCESSMASTERvar.Y_CALCULATECON_ACTION = _data[i].f42;
                INPROCESSMASTERvar.Yb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f52);
                INPROCESSMASTERvar.Z_CALCULATECON_ACTION = _data[i].f43;
                INPROCESSMASTERvar.Zb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f53);
                INPROCESSMASTERvar.I_CALCULATECON_ACTION = _data[i].f44;
                INPROCESSMASTERvar.Ib_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f54);
                INPROCESSMASTERvar.K1_CALCULATECON_ACTION = _data[i].f45;
                INPROCESSMASTERvar.K1b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f55);
                INPROCESSMASTERvar.K2_CALCULATECON_ACTION = _data[i].f46;
                INPROCESSMASTERvar.K2b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f56);
                INPROCESSMASTERvar.K3_CALCULATECON_ACTION = _data[i].f47;
                INPROCESSMASTERvar.K3b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f57);
                INPROCESSMASTERvar.masterID_CALCULATECON_ACTION = _data[i].f21;
                CALCULATECONPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          )
      ],
    );
  }
}

void CALCULATECONPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: CALCULATECONACTION(),
      );
    },
  );
}

class CALCULATECONACTION extends StatefulWidget {
  const CALCULATECONACTION({super.key});

  @override
  State<CALCULATECONACTION> createState() => _CALCULATECONACTIONState();
}

class _CALCULATECONACTIONState extends State<CALCULATECONACTION> {
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
                  child: Text("CALCULATECON"),
                ),
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "CAL NAME",
                height: 40,
                width: 400,
                isContr: INPROCESSMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    INPROCESSMASTERvar.iscontrol = input;
                  });
                },
                sValue: INPROCESSMASTERvar.CALCULATECON_CALCULATECON_ACTION,
                returnfunc: (String s) {
                  INPROCESSMASTERvar.CALCULATECON_CALCULATECON_ACTION = s;
                },
              ),
              Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.Xb_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.Xb_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "X NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.X_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.X_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.Yb_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.Yb_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Y NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.Y_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.Y_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.Zb_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.Zb_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Z NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.Z_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.Z_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.Ib_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.Ib_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "I NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.I_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.I_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.K1b_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.K1b_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K1 NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.K1_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.K1_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.K2b_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.K2b_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K2 NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.K2_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.K2_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 64,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 40,
                              child: CheckBoxC(
                                getChbox: (v) {
                                  setState(() {
                                    INPROCESSMASTERvar.K3b_CALCULATECON_ACTION =
                                        v;
                                  });
                                },
                                value:
                                    INPROCESSMASTERvar.K3b_CALCULATECON_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K3 NAME",
                          height: 40,
                          width: 300,
                          isContr: INPROCESSMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INPROCESSMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INPROCESSMASTERvar.K3_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            INPROCESSMASTERvar.K3_CALCULATECON_ACTION = s;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    )
                  ],
                ),
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "FORMULA",
                height: 40,
                width: 400,
                isContr: INPROCESSMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    INPROCESSMASTERvar.iscontrol = input;
                  });
                },
                sValue: INPROCESSMASTERvar.FORMULA_CALCULATECON_ACTION,
                returnfunc: (String s) {
                  INPROCESSMASTERvar.FORMULA_CALCULATECON_ACTION = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "masterID",
                height: 40,
                width: 400,
                isContr: INPROCESSMASTERvar.iscontrol,
                isEnabled: INPROCESSMASTERvar.masterID_ACTION_isEnabled,
                fnContr: (input) {
                  setState(() {
                    INPROCESSMASTERvar.iscontrol = input;
                  });
                },
                // sValue: INPROCESSMASTERvar.masterID_CALCULATECON_ACTION,
                returnfunc: (String s) {
                  INPROCESSMASTERvar.masterID_CALCULATECON_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  CALCULATECONtable_IPContext.read<INPROCESSMASTERmsg_Bloc>()
                      .add(INPROCESSMASTERmsg_CALCULATECON_EDIT());
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

bool ConvToBool(String data) {
  bool output = false;
  if (data == 'true' || data == 'True') {
    output = true;
  }
  return output;
}
