import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/03-1-INPROCESSMASTERget.dart';
import '../../bloc/BlocEvent/03-3-INPROCESSMASTERdropdown.dart';
import 'INPROCESSMASTERvar.dart';
import 'subINPROCESSMASTER/01TYPES.dart';
import 'subINPROCESSMASTER/02UNIT.dart';
import 'subINPROCESSMASTER/03ITEMs.dart';
import 'subINPROCESSMASTER/04MACHINENAME.dart';
import 'subINPROCESSMASTER/05METHODE.dart';
import 'subINPROCESSMASTER/06SPECIALSPEC.dart';
import 'subINPROCESSMASTER/07CALCULATE.dart';
import 'subINPROCESSMASTER/08COMMENT.dart';
import 'subINPROCESSMASTER/09DESIMAL.dart';
import 'subINPROCESSMASTER/10CALCULATECON.dart';

late BuildContext INPROCESSMASTERmainCONTEXT;

class INPROCESSMASTERmain extends StatefulWidget {
  INPROCESSMASTERmain({
    super.key,
    this.data,
    this.msg,
    this.DD,
  });
  DatasetWithSatatus? data;
  String? msg;
  DROPDOWNset? DD;

  @override
  State<INPROCESSMASTERmain> createState() => _INPROCESSMASTERmainState();
}

class _INPROCESSMASTERmainState extends State<INPROCESSMASTERmain> {
  StepperType stepperType = StepperType.horizontal;
  @override
  void initState() {
    super.initState();
    INPROCESSMASTERvar.UNITsBUFF = [MapEntry("", "-")];
    INPROCESSMASTERvar.currentStep = 0;
    context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_TYPEget());
    context
        .read<INPROCESSMASTERdropdown_Bloc>()
        .add(INPROCESSMASTERdropdown_MASTER());
  }

  @override
  Widget build(BuildContext context) {
    INPROCESSMASTERmainCONTEXT = context;
    DatasetWithSatatus _data = widget.data ?? DatasetWithSatatus(data: []);

    if (_data.position == 'TYPEget') {
      INPROCESSMASTERvar.TYPEget = _data.data;
    }
    if (_data.position == 'UNITget') {
      INPROCESSMASTERvar.UNITget = _data.data;
    }
    if (_data.position == 'ITEMSget') {
      INPROCESSMASTERvar.ITEMSget = _data.data;
    }
    if (_data.position == 'MACHINENAMEget') {
      INPROCESSMASTERvar.MACHINENAMEget = _data.data;
    }
    if (_data.position == 'METHODEget') {
      INPROCESSMASTERvar.METHODEget = _data.data;
    }
    if (_data.position == 'SPECIALSPECget') {
      INPROCESSMASTERvar.SPECIALSPECget = _data.data;
    }
    if (_data.position == 'CALCULATEget') {
      INPROCESSMASTERvar.CALCULATEget = _data.data;
    }
    if (_data.position == 'COMMENTget') {
      INPROCESSMASTERvar.COMMENTget = _data.data;
    }
    if (_data.position == 'DESIMALget') {
      INPROCESSMASTERvar.DESIMALget = _data.data;
    }
    if (_data.position == 'CALCULATECONget') {
      INPROCESSMASTERvar.CALCULATECONget = _data.data;
    }

    INPROCESSMASTERvar.TYPEddBUFF = widget.DD!.TYPEdd;
    INPROCESSMASTERvar.ITEMSddBUFF = widget.DD!.ITEMSdd;
    INPROCESSMASTERvar.METHODddBUFF = widget.DD!.METHODdd;
    INPROCESSMASTERvar.RESULTFORMATBUFF = widget.DD!.RESULTFORMAT;
    INPROCESSMASTERvar.GRAPHTYPEBUFF = widget.DD!.GRAPHTYPE;
    INPROCESSMASTERvar.INSTRUMENTSBUFF = widget.DD!.INSTRUMENTS;
    INPROCESSMASTERvar.CALCULATEBUFF = widget.DD!.CALCULATE;
    INPROCESSMASTERvar.UNITBUFF = widget.DD!.UNIT;

//CALCULATE
    return Column(
      children: [
        Expanded(
          child: Stepper(
            controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
              // bool hide = false;
              return const SizedBox();
            },
            type: stepperType,
            physics: const ScrollPhysics(),
            currentStep: INPROCESSMASTERvar.currentStep,
            onStepTapped: (step) => tapped(step),
            // onStepContinue: continued,
            // onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: const Text(
                  'TYPE',
                ),
                content: TYPEStable(
                  data: INPROCESSMASTERvar.TYPEget,
                ),
                // content: Container(),
                isActive: INPROCESSMASTERvar.currentStep == 0,
                state: INPROCESSMASTERvar.currentStep == 0
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('UNIT'),
                content: UNITStable(
                  data: INPROCESSMASTERvar.UNITget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 1,
                state: INPROCESSMASTERvar.currentStep == 1
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('ITEMs'),
                content: ITEMStable(
                  data: INPROCESSMASTERvar.ITEMSget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 2,
                state: INPROCESSMASTERvar.currentStep == 2
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('MACHINE NAME'),
                content: MACHINENAMEtable(
                  data: INPROCESSMASTERvar.MACHINENAMEget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 3,
                state: INPROCESSMASTERvar.currentStep == 3
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('METHODE'),
                content: METHODtable(
                  data: INPROCESSMASTERvar.METHODEget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 4,
                state: INPROCESSMASTERvar.currentStep == 4
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('SPECIALSPEC'),
                content: SPECIALSPECtable(
                  data: INPROCESSMASTERvar.SPECIALSPECget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 5,
                state: INPROCESSMASTERvar.currentStep == 5
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'CALCULATE',
                ),
                content: CALCULATEtable(
                  data: INPROCESSMASTERvar.CALCULATEget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 6,
                state: INPROCESSMASTERvar.currentStep == 6
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'COMMENT',
                ),
                content: COMMENTtable(
                  data: INPROCESSMASTERvar.COMMENTget,
                ),
                isActive: INPROCESSMASTERvar.currentStep == 7,
                state: INPROCESSMASTERvar.currentStep == 7
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              // Step(
              //   title: const Text(
              //     'DESIMAL',
              //   ),
              //   content: DESIMALtable(
              //     data: INPROCESSMASTERvar.DESIMALget,
              //   ),
              //   isActive: INPROCESSMASTERvar.currentStep == 8,
              //   state: INPROCESSMASTERvar.currentStep == 8
              //       ? StepState.indexed
              //       : StepState.indexed,
              // ),
              // Step(
              //   title: const Text(
              //     'CAL2',
              //   ),
              //   content: CALCULATECONtable(
              //     data: INPROCESSMASTERvar.CALCULATECONget,
              //   ),
              //   isActive: INPROCESSMASTERvar.currentStep == 9,
              //   state: INPROCESSMASTERvar.currentStep == 9
              //       ? StepState.indexed
              //       : StepState.indexed,
              // ),
            ],
          ),
        ),
      ],
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() {
      // print(step);
      if (step == 0) {
        context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_TYPEget());
      } else if (step == 1) {
        context
            .read<INPROCESSMASTERdropdown_Bloc>()
            .add(INPROCESSMASTERdropdown_MASTER());
        context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_UNITget());
      } else if (step == 2) {
        context
            .read<INPROCESSMASTERdropdown_Bloc>()
            .add(INPROCESSMASTERdropdown_MASTER());
        context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_ITEMSget());
      } else if (step == 3) {
        context
            .read<INPROCESSMASTER_Bloc>()
            .add(INPROCESSMASTER_MACHINENAMEget());
      } else if (step == 4) {
        context
            .read<INPROCESSMASTERdropdown_Bloc>()
            .add(INPROCESSMASTERdropdown_MASTER());
        context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_METHODEget());
      } else if (step == 5) {
        context
            .read<INPROCESSMASTER_Bloc>()
            .add(INPROCESSMASTER_SPECIALSPECget());
      } else if (step == 6) {
        context
            .read<INPROCESSMASTER_Bloc>()
            .add(INPROCESSMASTER_CALCULATEget());
      } else if (step == 7) {
        context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_COMMENTget());
      } else if (step == 8) {
        // context.read<INPROCESSMASTER_Bloc>().add(INPROCESSMASTER_UNITget());
      } else if (step == 9) {
        context
            .read<INPROCESSMASTER_Bloc>()
            .add(INPROCESSMASTER_CALCULATECONget());
      }

      INPROCESSMASTERvar.currentStep = step;
    });
  }

  continued() {
    INPROCESSMASTERvar.currentStep < 2
        ? setState(() => INPROCESSMASTERvar.currentStep += 1)
        : null;
  }

  cancel() {
    INPROCESSMASTERvar.currentStep > 0
        ? setState(() => INPROCESSMASTERvar.currentStep -= 1)
        : null;
  }
}
