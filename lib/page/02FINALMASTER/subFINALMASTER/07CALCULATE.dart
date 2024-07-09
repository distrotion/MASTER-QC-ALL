import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';
import '../../../widget/TABLE/07CALCULATEtable.dart';
import '../../../widget/common/CheckboxC.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

late BuildContext CALCULATEtablecontext;

class CALCULATEtable extends StatelessWidget {
  CALCULATEtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    CALCULATEtablecontext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.CALCULATE_SORT_ST == 0) {
    } else if (FINALMASTERvar.CALCULATE_SORT_ST == 1) {
      if (FINALMASTERvar.CALCULATE_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (FINALMASTERvar.CALCULATE_SORT_ST == 2) {
      if (FINALMASTERvar.CALCULATE_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.CALCULATE_CALCULATE_ACTION = '';
              FINALMASTERvar.FORMULA_CALCULATE_ACTION = '';
              FINALMASTERvar.X_CALCULATE_ACTION = '';
              FINALMASTERvar.Xb_CALCULATE_ACTION = false;
              FINALMASTERvar.Y_CALCULATE_ACTION = '';
              FINALMASTERvar.Yb_CALCULATE_ACTION = false;
              FINALMASTERvar.Z_CALCULATE_ACTION = '';
              FINALMASTERvar.Zb_CALCULATE_ACTION = false;
              FINALMASTERvar.I_CALCULATE_ACTION = '';
              FINALMASTERvar.Ib_CALCULATE_ACTION = false;
              FINALMASTERvar.K1_CALCULATE_ACTION = '';
              FINALMASTERvar.K1b_CALCULATE_ACTION = false;
              FINALMASTERvar.K2_CALCULATE_ACTION = '';
              FINALMASTERvar.K2b_CALCULATE_ACTION = false;
              FINALMASTERvar.K3_CALCULATE_ACTION = '';
              FINALMASTERvar.K3b_CALCULATE_ACTION = false;
              FINALMASTERvar.masterID_CALCULATE_ACTION = '';
              CALCULATEPOPUP(context);
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
          child: CALCULATEtableWidget(
            BGColorMain: Colors.grey.shade400,
            CALCULATEtext: "CAL NAME",
            FORMULAtext: " FORMULA",
            ACTIONtext: "ACTION",
            masterIDtext: "masterID",
            F01: (v) {
              FINALMASTERvar.CALCULATE_SORT_F = 0;
              if (FINALMASTERvar.CALCULATE_SORT_ST == 0) {
                FINALMASTERvar.CALCULATE_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.CALCULATE_SORT_ST == 1) {
                FINALMASTERvar.CALCULATE_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.CALCULATE_SORT_ST == 2) {
                FINALMASTERvar.CALCULATE_SORT_ST = 0;
                context
                    .read<FINALMASTER_Bloc>()
                    .add(FINALMASTER_CALCULATEget());
              }
            },
          ),
        ),
        for (int i = 0; i < _data.length; i++)
          SizedBox(
            height: 40,
            child: CALCULATEtableWidget(
              BGColorMain:
                  i.isEven ? Colors.grey.shade50 : Colors.grey.shade200,
              CALCULATEtext: _data[i].f01,
              FORMULAtext: _data[i].f02,
              ACTIONtext: "ACTION",
              isACTION: true,
              DeleteFN: (v) {
                FINALMASTERvar.masterID_CALCULATE = _data[i].f21;
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_CALCULATE_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.CALCULATE_CALCULATE_ACTION = _data[i].f01;
                FINALMASTERvar.FORMULA_CALCULATE_ACTION = _data[i].f02;
                FINALMASTERvar.X_CALCULATE_ACTION = _data[i].f41;
                FINALMASTERvar.Xb_CALCULATE_ACTION = ConvToBool(_data[i].f51);
                FINALMASTERvar.Y_CALCULATE_ACTION = _data[i].f42;
                FINALMASTERvar.Yb_CALCULATE_ACTION = ConvToBool(_data[i].f52);
                FINALMASTERvar.Z_CALCULATE_ACTION = _data[i].f43;
                FINALMASTERvar.Zb_CALCULATE_ACTION = ConvToBool(_data[i].f53);
                FINALMASTERvar.I_CALCULATE_ACTION = _data[i].f44;
                FINALMASTERvar.Ib_CALCULATE_ACTION = ConvToBool(_data[i].f54);
                FINALMASTERvar.K1_CALCULATE_ACTION = _data[i].f45;
                FINALMASTERvar.K1b_CALCULATE_ACTION = ConvToBool(_data[i].f55);
                FINALMASTERvar.K2_CALCULATE_ACTION = _data[i].f46;
                FINALMASTERvar.K2b_CALCULATE_ACTION = ConvToBool(_data[i].f56);
                FINALMASTERvar.K3_CALCULATE_ACTION = _data[i].f47;
                FINALMASTERvar.K3b_CALCULATE_ACTION = ConvToBool(_data[i].f57);
                FINALMASTERvar.masterID_CALCULATE_ACTION = _data[i].f21;
                CALCULATEPOPUP(context);
              },
              masterIDtext: _data[i].f21,
            ),
          )
      ],
    );
  }
}

void CALCULATEPOPUP(
  BuildContext contextin,
) {
  showDialog(
    context: contextin,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        child: CALCULATEACTION(),
      );
    },
  );
}

class CALCULATEACTION extends StatefulWidget {
  const CALCULATEACTION({super.key});

  @override
  State<CALCULATEACTION> createState() => _CALCULATEACTIONState();
}

class _CALCULATEACTIONState extends State<CALCULATEACTION> {
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
                  child: Text("CALCULATE"),
                ),
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "CAL NAME",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.CALCULATE_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.CALCULATE_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.Xb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Xb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "X NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.X_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.X_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.Yb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Yb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Y NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.Y_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Y_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.Zb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Zb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Z NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.Z_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Z_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.Ib_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Ib_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "I NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.I_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.I_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.K1b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K1b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K1 NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.K1_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K1_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.K2b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K2b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K2 NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.K2_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K2_CALCULATE_ACTION = s;
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
                                    FINALMASTERvar.K3b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K3b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K3 NAME",
                          height: 40,
                          width: 300,
                          isContr: FINALMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              FINALMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: FINALMASTERvar.K3_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K3_CALCULATE_ACTION = s;
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
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATE_ACTION = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "masterID",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                isEnabled: FINALMASTERvar.masterID_ACTION_isEnabled,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                // sValue: FINALMASTERvar.masterID_CALCULATE_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.masterID_CALCULATE_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  CALCULATEtablecontext.read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_CALCULATE_EDIT());
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
