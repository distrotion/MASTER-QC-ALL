import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/01-1-INCOMMINGMASTERget.dart';
import '../../../bloc/BlocEvent/01-2-INCOMMINGMASTERmsg.dart';
import '../../../bloc/cubit/Rebuild.dart';
import '../../../model/model.dart';

import '../../../widget/TABLE/07CALCULATEtable.dart';
import '../../../widget/common/CheckboxC.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/popup.dart';
import '../INCOMMINGMASTERvar.dart';

late BuildContext CALCULATEtable_INCcontext;

class CALCULATEtable_INC extends StatelessWidget {
  CALCULATEtable_INC({
    super.key,
    this.data,
  });
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    CALCULATEtable_INCcontext = context;
    List<dataset> _data = data ?? [];
    if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 0) {
    } else if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 1) {
      if (INCOMMINGMASTERvar.CALCULATE_SORT_F == 0) {
        _data.sort((a, b) => a.f01.compareTo(b.f01));
      }
    } else if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 2) {
      if (INCOMMINGMASTERvar.CALCULATE_SORT_F == 0) {
        _data.sort((b, a) => a.f01.compareTo(b.f01));
      }
    }

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () {
              INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.X_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.Xb_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.Y_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.Yb_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.Z_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.Zb_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.I_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.Ib_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.K1_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.K1b_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.K2_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.K2b_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.K3_CALCULATE_ACTION = '';
              INCOMMINGMASTERvar.K3b_CALCULATE_ACTION = false;
              INCOMMINGMASTERvar.masterID_CALCULATE_ACTION = '';
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
              INCOMMINGMASTERvar.CALCULATE_SORT_F = 0;
              if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 0) {
                INCOMMINGMASTERvar.CALCULATE_SORT_ST = 1;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 1) {
                INCOMMINGMASTERvar.CALCULATE_SORT_ST = 2;
                context.read<BlocPageRebuild>().rebuildPage();
              } else if (INCOMMINGMASTERvar.CALCULATE_SORT_ST == 2) {
                INCOMMINGMASTERvar.CALCULATE_SORT_ST = 0;
                context
                    .read<INCOMMINGMASTER_Bloc>()
                    .add(INCOMMINGMASTER_CALCULATEget());
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
                INCOMMINGMASTERvar.masterID_CALCULATE = _data[i].f21;
                POPUPyn(context, (v) {
                  context
                      .read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_CALCULATE_DROP());
                }, "DELETE DATA", 120, 90);
              },
              EditFN: (v) {
                INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION = _data[i].f01;
                INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION = _data[i].f02;
                INCOMMINGMASTERvar.X_CALCULATE_ACTION = _data[i].f41;
                INCOMMINGMASTERvar.Xb_CALCULATE_ACTION =
                    ConvToBool(_data[i].f51);
                INCOMMINGMASTERvar.Y_CALCULATE_ACTION = _data[i].f42;
                INCOMMINGMASTERvar.Yb_CALCULATE_ACTION =
                    ConvToBool(_data[i].f52);
                INCOMMINGMASTERvar.Z_CALCULATE_ACTION = _data[i].f43;
                INCOMMINGMASTERvar.Zb_CALCULATE_ACTION =
                    ConvToBool(_data[i].f53);
                INCOMMINGMASTERvar.I_CALCULATE_ACTION = _data[i].f44;
                INCOMMINGMASTERvar.Ib_CALCULATE_ACTION =
                    ConvToBool(_data[i].f54);
                INCOMMINGMASTERvar.K1_CALCULATE_ACTION = _data[i].f45;
                INCOMMINGMASTERvar.K1b_CALCULATE_ACTION =
                    ConvToBool(_data[i].f55);
                INCOMMINGMASTERvar.K2_CALCULATE_ACTION = _data[i].f46;
                INCOMMINGMASTERvar.K2b_CALCULATE_ACTION =
                    ConvToBool(_data[i].f56);
                INCOMMINGMASTERvar.K3_CALCULATE_ACTION = _data[i].f47;
                INCOMMINGMASTERvar.K3b_CALCULATE_ACTION =
                    ConvToBool(_data[i].f57);
                INCOMMINGMASTERvar.masterID_CALCULATE_ACTION = _data[i].f21;
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
                isContr: INCOMMINGMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    INCOMMINGMASTERvar.iscontrol = input;
                  });
                },
                sValue: INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION,
                returnfunc: (String s) {
                  INCOMMINGMASTERvar.CALCULATE_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.Xb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.Xb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "X NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.X_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.X_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.Yb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.Yb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Y NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.Y_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.Y_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.Zb_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.Zb_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "Z NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.Z_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.Z_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.Ib_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.Ib_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "I NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.I_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.I_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.K1b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.K1b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K1 NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.K1_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.K1_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.K2b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.K2b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K2 NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.K2_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.K2_CALCULATE_ACTION = s;
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
                                    INCOMMINGMASTERvar.K3b_CALCULATE_ACTION = v;
                                  });
                                },
                                value: INCOMMINGMASTERvar.K3b_CALCULATE_ACTION,
                              ),
                            ),
                          ),
                        ),
                        ComInputText(
                          nLimitedChar: 100,
                          sLabel: "K3 NAME",
                          height: 40,
                          width: 300,
                          isContr: INCOMMINGMASTERvar.iscontrol,
                          fnContr: (input) {
                            setState(() {
                              INCOMMINGMASTERvar.iscontrol = input;
                            });
                          },
                          sValue: INCOMMINGMASTERvar.K3_CALCULATE_ACTION,
                          returnfunc: (String s) {
                            INCOMMINGMASTERvar.K3_CALCULATE_ACTION = s;
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
                isContr: INCOMMINGMASTERvar.iscontrol,
                fnContr: (input) {
                  setState(() {
                    INCOMMINGMASTERvar.iscontrol = input;
                  });
                },
                sValue: INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION,
                returnfunc: (String s) {
                  INCOMMINGMASTERvar.FORMULA_CALCULATE_ACTION = s;
                },
              ),
              ComInputText(
                nLimitedChar: 100,
                sLabel: "masterID",
                height: 40,
                width: 400,
                isContr: INCOMMINGMASTERvar.iscontrol,
                isEnabled: INCOMMINGMASTERvar.masterID_ACTION_isEnabled,
                fnContr: (input) {
                  setState(() {
                    INCOMMINGMASTERvar.iscontrol = input;
                  });
                },
                // sValue: INCOMMINGMASTERvar.masterID_CALCULATE_ACTION,
                returnfunc: (String s) {
                  INCOMMINGMASTERvar.masterID_CALCULATE_ACTION = s;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  CALCULATEtable_INCcontext.read<INCOMMINGMASTERmsg_Bloc>()
                      .add(INCOMMINGMASTERmsg_CALCULATE_EDIT());
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
