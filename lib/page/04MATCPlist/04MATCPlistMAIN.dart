import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-1-MATCPlistGET.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLE/12-SEARCHMATCP.dart';
import '../../widget/common/ComInputText.dart';
import '../05INSPECTIONstd/INSPECTIONstdVAR.dart';
import '../06INSPECTIONstdN/P6INSPECTIONstdNvar.dart';
import '../page5.dart';
import '../page6.dart';
import '04MATCPlistMAINvar.dart';

class MATCPlistMAIN extends StatefulWidget {
  MATCPlistMAIN({
    super.key,
    this.data,
  });
  List<MATCPlistClass>? data;
  @override
  State<MATCPlistMAIN> createState() => _MATCPlistMAINState();
}

class _MATCPlistMAINState extends State<MATCPlistMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MATCPlistGET_Bloc>().add(MATCPlistGET_MATCP());
  }

  // int pagelist = 0;
  // int pageselect = 0;

  // int FPint = 0;
  // int LPint = 0;

  @override
  Widget build(BuildContext context) {
    List<MATCPlistClass> _datainput = widget.data ?? [];
    List<MATCPlistClass> _data = [];
    if (MATCPlistMAINvar.Search != '') {
      for (var i = 0; i < _datainput.length; i++) {
        String CP_S = _datainput[i].CP.toUpperCase();
        String FG_S = _datainput[i].FG.toUpperCase();
        String CUS_S = _datainput[i].CUSTOMER.toUpperCase();
        String PAT_S = _datainput[i].PART.toUpperCase();
        String PATN_S = _datainput[i].PARTNAME.toUpperCase();
        String MAT_S = _datainput[i].MATERIAL.toUpperCase();
        String ST_S = _datainput[i].STATUS.toUpperCase();

        if (CP_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            FG_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            CUS_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            PAT_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            PATN_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            MAT_S.contains(MATCPlistMAINvar.Search.toUpperCase()) ||
            ST_S.contains(MATCPlistMAINvar.Search.toUpperCase())) {
          _data.add(_datainput[i]);
        }
      }
    } else {
      _data = _datainput;
    }

    if (_data.length != 0) {
      if (_data.length <= 20) {
        MATCPlistMAINvar.FPint = 0;
        MATCPlistMAINvar.LPint = _data.length;
      } else {
        if (_data.length > 0) {
          MATCPlistMAINvar.pagelist = (_data.length ~/ 20);

          if (20 * MATCPlistMAINvar.pagelist > _data.length) {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist - 1;
          } else {
            MATCPlistMAINvar.pagelist = MATCPlistMAINvar.pagelist;
          }
          MATCPlistMAINvar.FPint = 20 * MATCPlistMAINvar.pageselect;
          if (MATCPlistMAINvar.pageselect == MATCPlistMAINvar.pagelist) {
            // LPint = FPint + (_data.length - 20 * pagelist);
            MATCPlistMAINvar.LPint = _data.length;
          } else {
            MATCPlistMAINvar.LPint = 20 * MATCPlistMAINvar.pageselect + 19;
            // LPint = _data.length;
          }
        }
      }
    }

    // print("----------------");
    // print(FPint);
    // print(LPint);
    // print("----------------");

    return SingleChildScrollView(
      child: SizedBox(
        height: 1200,
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 400,
                      child: ComInputText(
                        height: 40,
                        width: 400,
                        isContr: MATCPlistMAINvar.iscontrol,
                        fnContr: (input) {
                          setState(() {
                            MATCPlistMAINvar.iscontrol = input;
                          });
                        },
                        sValue: MATCPlistMAINvar.Search,
                        returnfunc: (String s) {
                          setState(() {
                            MATCPlistMAINvar.pageselect = 0;
                            MATCPlistMAINvar.Search = s;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          MATCPlistMAINvar.iscontrol = true;
                          MATCPlistMAINvar.Search = '';

                          MATCPlistMAINvar.FPint = 0;
                          MATCPlistMAINvar.LPint = 0;
                          MATCPlistMAINvar.pagelist = 0;
                          MATCPlistMAINvar.pageselect = 0;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        color: Colors.red,
                        child: Center(child: Text("CLEAR")),
                      ),
                    ),
                  )
                ],
              ),
            ),
            _data.length > 0
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 2500,

                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            // color: Colors.orange,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          // height: 1000,
                          // width: 1000,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                                child: MATCPlistTABLE(
                                  CP: "CP",
                                  FG: "FG",
                                  CUSTOMMER: "CUSTOMMER",
                                  PART: "PART",
                                  PARTNAME: "PARTNAME",
                                  MATERIAL: "MATERIAL",
                                  STATUS: "STATUS",
                                  BGColorMain: Colors.grey.shade600,
                                ),
                              ),
                              for (int i = MATCPlistMAINvar.FPint;
                                  i < MATCPlistMAINvar.LPint;
                                  i++) ...[
                                // for (int i = 0; i < _data.length; i++) ...[
                                SizedBox(
                                  height: 40,
                                  child: MATCPlistTABLE(
                                    CP: _data[i].CP,
                                    FG: _data[i].FG,
                                    CUSTOMMER: _data[i].CUSTOMER,
                                    PART: _data[i].PART,
                                    PARTNAME: _data[i].PARTNAME,
                                    MATERIAL: _data[i].MATERIAL,
                                    STATUS: _data[i].STATUS,
                                    BGColorMain: i.isEven
                                        ? Colors.grey.shade50
                                        : Colors.grey.shade200,
                                    isACTION: true,
                                    EditFN: (v) {
                                      // MATCPlistMAINvar.Search = _data[i].CP;

                                      // INSPECTIONstdVAR.CP = _data[i].CP;
                                      // INSPECTIONstdVAR.FG = _data[i].FG;
                                      // INSPECTIONstdVAR.CUSTOMER =
                                      //     _data[i].CUSTOMER;
                                      // INSPECTIONstdVAR.PART = _data[i].PART;
                                      // INSPECTIONstdVAR.PARTNAME =
                                      //     _data[i].PARTNAME;
                                      // INSPECTIONstdVAR.MATERIAL =
                                      //     _data[i].MATERIAL;
                                      // INSPECTIONstdVAR.CUST_FULLNM =
                                      //     _data[i].CUST_FULLNM;

                                      // INSPECTIONstdVAR.FPint =
                                      //     MATCPlistMAINvar.FPint;
                                      // INSPECTIONstdVAR.LPint =
                                      //     MATCPlistMAINvar.LPint;

                                      // CuPage = Page5();
                                      // MainBodyContext.read<ChangePage_Bloc>()
                                      //     .add(ChangePage_nodrower());
                                      //-----------------------------------------------------------------------------------
                                      P6INSPECTIONstdNvar_BASIC.CP =
                                          _data[i].CP;
                                      P6INSPECTIONstdNvar_BASIC.FG =
                                          _data[i].FG;
                                      P6INSPECTIONstdNvar_BASIC.CUSTOMER =
                                          _data[i].CUSTOMER;
                                      P6INSPECTIONstdNvar_BASIC.PART =
                                          _data[i].PART;
                                      P6INSPECTIONstdNvar_BASIC.PARTNAME =
                                          _data[i].PARTNAME;
                                      P6INSPECTIONstdNvar_BASIC.MATERIAL =
                                          _data[i].MATERIAL;
                                      P6INSPECTIONstdNvar_BASIC.CUST_FULLNM =
                                          _data[i].CUST_FULLNM;

                                      P6INSPECTIONstdNvar_BASIC.FPint =
                                          MATCPlistMAINvar.FPint;
                                      P6INSPECTIONstdNvar_BASIC.LPint =
                                          MATCPlistMAINvar.LPint;

                                      CuPage = Page6();

                                      MainBodyContext.read<ChangePage_Bloc>()
                                          .add(ChangePage_nodrower());
                                    },
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: InkWell(
                                  onTap: () {
                                    //
                                    if (MATCPlistMAINvar.pageselect > 0) {
                                      setState(() {
                                        MATCPlistMAINvar.pageselect--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/icon-L@3x.png'))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text(
                                    MATCPlistMAINvar.pageselect.toString() +
                                        " / " +
                                        MATCPlistMAINvar.pagelist.toString()),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: InkWell(
                                  onTap: () {
                                    //
                                    if (MATCPlistMAINvar.pageselect <
                                        MATCPlistMAINvar.pagelist) {
                                      setState(() {
                                        MATCPlistMAINvar.pageselect++;
                                      });
                                    }
                                  },
                                  child: Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/icon-R@3x.png'))),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: SizedBox(
                      height: 1000,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              SizedBox(width: 30),
                              CircularProgressIndicator(),
                              SizedBox(width: 20),
                              Text("Loading"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
