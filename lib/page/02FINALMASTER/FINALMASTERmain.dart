import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-1-FINALMASTERget.dart';
import '../../bloc/BlocEvent/02-3-FINALMASTERdropdown.dart';
import 'FINALMASTERvar.dart';
import 'subFINALMASTER/01TYPES.dart';
import 'subFINALMASTER/02UNIT.dart';
import 'subFINALMASTER/03ITEMs.dart';
import 'subFINALMASTER/04MACHINENAME.dart';
import 'subFINALMASTER/05METHODE.dart';
import 'subFINALMASTER/06SPECIALSPEC.dart';
import 'subFINALMASTER/07CALCULATE.dart';
import 'subFINALMASTER/08COMMENT.dart';
import 'subFINALMASTER/09DESIMAL.dart';
import 'subFINALMASTER/10CALCULATECON.dart';

late BuildContext FINALMASTERmainCONTEXT;

class FINALMASTERmain extends StatefulWidget {
  FINALMASTERmain({
    super.key,
    this.data,
    this.msg,
    this.DD,
  });
  DatasetWithSatatus? data;
  String? msg;
  DROPDOWNset? DD;

  @override
  State<FINALMASTERmain> createState() => _FINALMASTERmainState();
}

class _FINALMASTERmainState extends State<FINALMASTERmain> {
  StepperType stepperType = StepperType.horizontal;
  @override
  void initState() {
    super.initState();
    FINALMASTERvar.UNITsBUFF = [MapEntry("", "-")];
    FINALMASTERvar.currentStep = 0;
    context.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
    context.read<FINALMASTERdropdown_Bloc>().add(FINALMASTERdropdown_MASTER());
  }

  @override
  Widget build(BuildContext context) {
    FINALMASTERmainCONTEXT = context;
    DatasetWithSatatus _data = widget.data ?? DatasetWithSatatus(data: []);

    if (_data.position == 'TYPEget') {
      FINALMASTERvar.TYPEget = _data.data;
    }
    if (_data.position == 'UNITget') {
      FINALMASTERvar.UNITget = _data.data;
    }
    if (_data.position == 'ITEMSget') {
      FINALMASTERvar.ITEMSget = _data.data;
    }
    if (_data.position == 'MACHINENAMEget') {
      FINALMASTERvar.MACHINENAMEget = _data.data;
    }
    if (_data.position == 'METHODEget') {
      FINALMASTERvar.METHODEget = _data.data;
    }
    if (_data.position == 'SPECIALSPECget') {
      FINALMASTERvar.SPECIALSPECget = _data.data;
    }
    if (_data.position == 'CALCULATEget') {
      FINALMASTERvar.CALCULATEget = _data.data;
    }
    if (_data.position == 'COMMENTget') {
      FINALMASTERvar.COMMENTget = _data.data;
    }
    if (_data.position == 'DESIMALget') {
      FINALMASTERvar.DESIMALget = _data.data;
    }
    if (_data.position == 'CALCULATECONget') {
      FINALMASTERvar.CALCULATECONget = _data.data;
    }

    FINALMASTERvar.TYPEddBUFF = widget.DD!.TYPEdd;
    FINALMASTERvar.ITEMSddBUFF = widget.DD!.ITEMSdd;
    FINALMASTERvar.METHODddBUFF = widget.DD!.METHODdd;
    FINALMASTERvar.RESULTFORMATBUFF = widget.DD!.RESULTFORMAT;
    FINALMASTERvar.GRAPHTYPEBUFF = widget.DD!.GRAPHTYPE;
    FINALMASTERvar.INSTRUMENTSBUFF = widget.DD!.INSTRUMENTS;
    FINALMASTERvar.CALCULATEBUFF = widget.DD!.CALCULATE;
    FINALMASTERvar.UNITBUFF = widget.DD!.UNIT;

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
            currentStep: FINALMASTERvar.currentStep,
            onStepTapped: (step) => tapped(step),
            // onStepContinue: continued,
            // onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: const Text(
                  'TYPE',
                ),
                content: TYPEStable(
                  data: FINALMASTERvar.TYPEget,
                ),
                // content: Container(),
                isActive: FINALMASTERvar.currentStep == 0,
                state: FINALMASTERvar.currentStep == 0
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('UNIT'),
                content: UNITStable(
                  data: FINALMASTERvar.UNITget,
                ),
                isActive: FINALMASTERvar.currentStep == 1,
                state: FINALMASTERvar.currentStep == 1
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('ITEMs'),
                content: ITEMStable(
                  data: FINALMASTERvar.ITEMSget,
                ),
                isActive: FINALMASTERvar.currentStep == 2,
                state: FINALMASTERvar.currentStep == 2
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('MACHINE NAME'),
                content: MACHINENAMEtable(
                  data: FINALMASTERvar.MACHINENAMEget,
                ),
                isActive: FINALMASTERvar.currentStep == 3,
                state: FINALMASTERvar.currentStep == 3
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('METHODE'),
                content: METHODtable(
                  data: FINALMASTERvar.METHODEget,
                ),
                isActive: FINALMASTERvar.currentStep == 4,
                state: FINALMASTERvar.currentStep == 4
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text('SPECIALSPEC'),
                content: SPECIALSPECtable(
                  data: FINALMASTERvar.SPECIALSPECget,
                ),
                isActive: FINALMASTERvar.currentStep == 5,
                state: FINALMASTERvar.currentStep == 5
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'CALCULATE',
                ),
                content: CALCULATEtable(
                  data: FINALMASTERvar.CALCULATEget,
                ),
                isActive: FINALMASTERvar.currentStep == 6,
                state: FINALMASTERvar.currentStep == 6
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'COMMENT',
                ),
                content: COMMENTtable(
                  data: FINALMASTERvar.COMMENTget,
                ),
                isActive: FINALMASTERvar.currentStep == 7,
                state: FINALMASTERvar.currentStep == 7
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'DESIMAL',
                ),
                content: DESIMALtable(
                  data: FINALMASTERvar.DESIMALget,
                ),
                isActive: FINALMASTERvar.currentStep == 8,
                state: FINALMASTERvar.currentStep == 8
                    ? StepState.indexed
                    : StepState.indexed,
              ),
              Step(
                title: const Text(
                  'CAL2',
                ),
                content: CALCULATECONtable(
                  data: FINALMASTERvar.CALCULATECONget,
                ),
                isActive: FINALMASTERvar.currentStep == 9,
                state: FINALMASTERvar.currentStep == 9
                    ? StepState.indexed
                    : StepState.indexed,
              ),
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
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_TYPEget());
      } else if (step == 1) {
        context
            .read<FINALMASTERdropdown_Bloc>()
            .add(FINALMASTERdropdown_MASTER());
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());
      } else if (step == 2) {
        context
            .read<FINALMASTERdropdown_Bloc>()
            .add(FINALMASTERdropdown_MASTER());
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_ITEMSget());
      } else if (step == 3) {
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_MACHINENAMEget());
      } else if (step == 4) {
        context
            .read<FINALMASTERdropdown_Bloc>()
            .add(FINALMASTERdropdown_MASTER());
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_METHODEget());
      } else if (step == 5) {
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_SPECIALSPECget());
      } else if (step == 6) {
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_CALCULATEget());
      } else if (step == 7) {
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_COMMENTget());
      } else if (step == 8) {
        // context.read<FINALMASTER_Bloc>().add(FINALMASTER_UNITget());
      } else if (step == 9) {
        context.read<FINALMASTER_Bloc>().add(FINALMASTER_CALCULATECONget());
      }

      FINALMASTERvar.currentStep = step;
    });
  }

  continued() {
    FINALMASTERvar.currentStep < 2
        ? setState(() => FINALMASTERvar.currentStep += 1)
        : null;
  }

  cancel() {
    FINALMASTERvar.currentStep > 0
        ? setState(() => FINALMASTERvar.currentStep -= 1)
        : null;
  }
}
