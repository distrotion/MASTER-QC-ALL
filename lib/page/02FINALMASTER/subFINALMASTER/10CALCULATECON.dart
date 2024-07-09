import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../../bloc/BlocEvent/02-2-FINALMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/10CALCULATECONtable.dart';
import '../../../widget/common/CheckboxC.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../FINALMASTERvar.dart';

late BuildContext CALCULATECONtablecontext;

class CALCULATECONtable extends StatelessWidget {
  CALCULATECONtable({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    CALCULATECONtablecontext = context;
    List<dataset> _data = data ?? [];
    if (FINALMASTERvar.CALCULATECON_SORT_ST == 0) {
    } else if (FINALMASTERvar.CALCULATECON_SORT_ST == 1) {
      if (FINALMASTERvar.CALCULATECON_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (FINALMASTERvar.CALCULATECON_SORT_ST == 2) {
      if (FINALMASTERvar.CALCULATECON_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              FINALMASTERvar.CALCULATECON_CALCULATECON_ACTION = '';
              FINALMASTERvar.FORMULA_CALCULATECON_ACTION_01 = '';
              FINALMASTERvar.FORMULA_CALCULATECON_ACTION_02 = '';
              FINALMASTERvar.FORMULA_CALCULATECON_ACTION_03 = '';
              FINALMASTERvar.FORMULA_CALCULATECON_ACTION_04 = '';
              FINALMASTERvar.FORMULA_CALCULATECON_ACTION_05 = '';
              FINALMASTERvar.X_CALCULATECON_ACTION = '';
              FINALMASTERvar.Xb_CALCULATECON_ACTION = false;
              FINALMASTERvar.Y_CALCULATECON_ACTION = '';
              FINALMASTERvar.Yb_CALCULATECON_ACTION = false;
              FINALMASTERvar.Z_CALCULATECON_ACTION = '';
              FINALMASTERvar.Zb_CALCULATECON_ACTION = false;
              FINALMASTERvar.I_CALCULATECON_ACTION = '';
              FINALMASTERvar.Ib_CALCULATECON_ACTION = false;
              FINALMASTERvar.K1_CALCULATECON_ACTION = '';
              FINALMASTERvar.K1b_CALCULATECON_ACTION = false;
              FINALMASTERvar.K2_CALCULATECON_ACTION = '';
              FINALMASTERvar.K2b_CALCULATECON_ACTION = false;
              FINALMASTERvar.K3_CALCULATECON_ACTION = '';
              FINALMASTERvar.K3b_CALCULATECON_ACTION = false;
              FINALMASTERvar.masterID_CALCULATECON_ACTION = '';
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
              FINALMASTERvar.CALCULATECON_SORT_F = 0;
              if (FINALMASTERvar.CALCULATECON_SORT_ST == 0) {
                FINALMASTERvar.CALCULATECON_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.CALCULATECON_SORT_ST == 1) {
                FINALMASTERvar.CALCULATECON_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (FINALMASTERvar.CALCULATECON_SORT_ST == 2) {
                FINALMASTERvar.CALCULATECON_SORT_ST = 0;
                context
                    .read<FINALMASTER_Bloc>()
                    .add(FINALMASTER_CALCULATECONget());
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
                FINALMASTERvar.masterID_CALCULATECON = _data[i].f21;
                POPUPyn(context, (v) {
                  context
                      .read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_CALCULATECON_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                FINALMASTERvar.CALCULATECON_CALCULATECON_ACTION = _data[i].f01;
                FINALMASTERvar.FORMULA_CALCULATECON_ACTION_01 = _data[i].f81;
                FINALMASTERvar.FORMULA_CALCULATECON_ACTION_02 = _data[i].f82;
                FINALMASTERvar.FORMULA_CALCULATECON_ACTION_03 = _data[i].f83;
                FINALMASTERvar.FORMULA_CALCULATECON_ACTION_04 = _data[i].f84;
                FINALMASTERvar.FORMULA_CALCULATECON_ACTION_05 = _data[i].f85;
                FINALMASTERvar.X_CALCULATECON_ACTION = _data[i].f41;
                FINALMASTERvar.Xb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f51);
                FINALMASTERvar.Y_CALCULATECON_ACTION = _data[i].f42;
                FINALMASTERvar.Yb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f52);
                FINALMASTERvar.Z_CALCULATECON_ACTION = _data[i].f43;
                FINALMASTERvar.Zb_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f53);
                FINALMASTERvar.I_CALCULATECON_ACTION = _data[i].f44;
                FINALMASTERvar.Ib_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f54);
                FINALMASTERvar.K1_CALCULATECON_ACTION = _data[i].f45;
                FINALMASTERvar.K1b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f55);
                FINALMASTERvar.K2_CALCULATECON_ACTION = _data[i].f46;
                FINALMASTERvar.K2b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f56);
                FINALMASTERvar.K3_CALCULATECON_ACTION = _data[i].f47;
                FINALMASTERvar.K3b_CALCULATECON_ACTION =
                    ConvToBool(_data[i].f57);
                FINALMASTERvar.masterID_CALCULATECON_ACTION = _data[i].f21;
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
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.CALCULATECON_CALCULATECON_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.CALCULATECON_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.Xb_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Xb_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.X_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.X_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.Yb_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Yb_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.Y_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Y_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.Zb_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Zb_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.Z_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.Z_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.Ib_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.Ib_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.I_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.I_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.K1b_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K1b_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.K1_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K1_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.K2b_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K2b_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.K2_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K2_CALCULATECON_ACTION = s;
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
                                    FINALMASTERvar.K3b_CALCULATECON_ACTION = v;
                                  });
                                },
                                value: FINALMASTERvar.K3b_CALCULATECON_ACTION,
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
                          sValue: FINALMASTERvar.K3_CALCULATECON_ACTION,
                          returnfunc: (String s) {
                            FINALMASTERvar.K3_CALCULATECON_ACTION = s;
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
                sLabel: "FORMULA 01",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATECON_ACTION_01,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATECON_ACTION_01 = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "FORMULA 02",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATECON_ACTION_02,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATECON_ACTION_02 = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "FORMULA 03",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATECON_ACTION_03,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATECON_ACTION_03 = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "FORMULA 04",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATECON_ACTION_04,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATECON_ACTION_04 = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "FORMULA 05",
                height: 40,
                width: 400,
                isContr: FINALMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    FINALMASTERvar.iscontrol = input;
                  });
                },
                sValue: FINALMASTERvar.FORMULA_CALCULATECON_ACTION_05,
                returnfunc: (String s) {
                  FINALMASTERvar.FORMULA_CALCULATECON_ACTION_05 = s;
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
                // sValue: FINALMASTERvar.masterID_CALCULATECON_ACTION,
                returnfunc: (String s) {
                  FINALMASTERvar.masterID_CALCULATECON_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  CALCULATECONtablecontext.read<FINALMASTERmsg_Bloc>()
                      .add(FINALMASTERmsg_CALCULATECON_EDIT());
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
