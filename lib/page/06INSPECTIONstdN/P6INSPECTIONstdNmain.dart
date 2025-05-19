import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/BlocEvent/06-1-P6FINSPECTIONget.dart';
import '../../bloc/BlocEvent/06-4-P6UPLOADSPEC.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/Rebuild.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../model/model.dart';
import '../../widget/TABLE/11-PATTRENtable.dart';
import '../../widget/common/Advancedropdown.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/IMGviewWID.dart';
import '../page4.dart';
import 'P6_1_INCOMMING.dart';
import 'P6_2_INPROCESS.dart';
import 'P6_3_FINALINS.dart';
import 'P6INSPECTIONstdFunction_FN.dart';
import 'P6INSPECTIONstdNvar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as IMG;

late BuildContext P6P6InspectionSTDNmaincontext;

class P6P6InspectionSTDNmain extends StatefulWidget {
  P6P6InspectionSTDNmain({
    super.key,
    this.Mdata,
  });

  P6InspectionSTD? Mdata;

  @override
  State<P6P6InspectionSTDNmain> createState() => _P6P6InspectionSTDNmainState();
}

class _P6P6InspectionSTDNmainState extends State<P6P6InspectionSTDNmain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    P6ClearFINAL();
    //24000004
    // P6INSPECTIONstdNvar_BASIC.CP = "24000004";
    P6INSPECTIONstdNvar_BASIC.reportset = '-';
    P6INSPECTIONstdNvar_BASIC.logoset = '-';
    context.read<P6FINSPECTIONget_Bloc>().add(P6FINSPECTIONget_MATCP());
  }

  @override
  Widget build(BuildContext context) {
    P6InspectionSTD _Mdata = widget.Mdata ??
        P6InspectionSTD(
          INCOMMING: [],
          INPROCESS: [],
          FINAL: [],
        );
    P6P6InspectionSTDNmaincontext = context;
    // ScrollController controllerIN01 = ScrollController();
    // ScrollController controllerIN02 = ScrollController();

    if (_Mdata.status == 'GET_ALL') {}

    // int millis = 978296400000;
    // DateTime dt = DateTime.fromMillisecondsSinceEpoch(millis);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: () {
                      //

                      CuPage = Page4();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/icon-L@3x.png'))),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 2750,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                // color: Colors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              height: 210,
              // width: 1000,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(
                        //   height: 28,
                        //   child: Text("CUSTOMER :"),
                        // ),
                        SizedBox(
                          height: 28,
                          child: Text("CUST :"),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text("PART NO :"),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text("PARTNAME :"),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text("MAT.CP :"),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text("MAT.FG :"),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text("MATERIAL :"),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // SizedBox(
                        //   height: 28,
                        //   child: Text(P6INSPECTIONstdNvar_BASIC.CUST_FULLNM),
                        // ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.CUSTOMER),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.PART),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.PARTNAME),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.CP),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.FG),
                        ),
                        SizedBox(
                          height: 28,
                          child: Text(P6INSPECTIONstdNvar_BASIC.MATERIAL),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  ComInputText(
                    nLimitedChar: 100,
                    isNumberOnly: true,
                    height: 40,
                    width: 200,
                    isContr: P6INSPECTIONstdNvar_BASIC.iscontrol,
                    // isEnabled: P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled,
                    fnContr: (input) {
                      setState(() {
                        P6INSPECTIONstdNvar_BASIC.iscontrol = input;
                      });
                    },
                    sValue: P6INSPECTIONstdNvar_BASIC.copypo,
                    returnfunc: (String s) {
                      P6INSPECTIONstdNvar_BASIC.copypo = s;
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () async {
                      //
                      P6COPYDATA(P6INSPECTIONstdNvar_BASIC.CP,
                          P6INSPECTIONstdNvar_BASIC.copypo);
                    },
                    child: Container(
                      height: 40,
                      width: 125,
                      color: Colors.blue,
                      child: Center(
                        child: Text("COPY"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            INSINCOMMING(
              Mdata: _Mdata,
            ),
            SizedBox(
              height: 15,
            ),
            INPROCESS(
              Mdata: _Mdata,
            ),
            SizedBox(
              height: 15,
            ),
            INSFINAL(
              Mdata: _Mdata,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                // color: Colors.orange,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              height: 300,
              width: 2750,
              // width: 1000,
              child: Row(
                children: [
                  Column(
                    children: [
                      // SizedBox(
                      //   height: 40,
                      // )
                      SizedBox(
                        width: 400,
                        child: InkWell(
                          onTap: () async {
                            if (P6INSPECTIONstdNvar_BASIC.CP != "") {
                              var picked =
                                  await FilePicker.platform.pickFiles();
                              Uint8List? imageByte;
                              Uint8List? resizedData;

                              if (picked != null) {
                                imageByte = picked.files.first.bytes;
                                IMG.Image? img = IMG.decodeImage(imageByte!);
                                // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
                                resizedData = IMG.encodeJpg(img!) as Uint8List?;
                                setState(() {
                                  P6INSPECTIONstdNvar_BASIC.PICUPLOAD =
                                      "data:image/jpeg;base64," +
                                          base64.encode(resizedData!);
                                  // print(P6INSPECTIONstdNvar_BASIC.PICUPLOAD);
                                  if (P6INSPECTIONstdNvar_BASIC.PICUPLOAD !=
                                      "") {
                                    context
                                        .read<P6UPLOADSPEC_Bloc>()
                                        .add(UPLOAD_PIC());
                                  }
                                });
                              }
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            color: Colors.green,
                            child: Center(
                              child: Text("UPLOAD PIC"),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          if ((widget.Mdata?.Pimg ?? '') != '') ...[
                            PicShowW(
                              base64: widget.Mdata?.Pimg ?? '',
                              height: 200,
                              width: 400,
                            )
                          ] else ...[
                            Container(
                              height: 200,
                              width: 400,
                              color: Colors.grey.shade400,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  SizedBox(width: 30),
                                  CircularProgressIndicator(),
                                  SizedBox(width: 20),
                                  Text("Loading"),
                                ],
                              ),
                            )
                          ],
                        ],
                      ),
                    ],
                  ),
                  //reportset
                  Column(
                    children: [
                      SizedBox(
                        height: 68,
                        width: 200,
                        child: AdvanceDropDown(
                          sLabel: "Report set",
                          imgpath: 'assets/icons/icon-down_4@3x.png',
                          listdropdown: P6INSPECTIONstdNvar_BASIC.reportlist,
                          onChangeinside: (d, v) {
                            // print(d);
                            setState(() {
                              P6INSPECTIONstdNvar_BASIC.reportset = d;
                            });
                          },
                          value: P6INSPECTIONstdNvar_BASIC.reportset,
                          height: 40,
                          width: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //P6INSPECTIONstdNvar_BASIC.CP

                          Dio().post(
                            options: Options(
                              // contentType: "application/json",

                              headers: {
                                "server": USERDATA.MASTER,
                              },
                            ),
                            serverGB + "reportset_UPLOAD",
                            data: {
                              "CP": P6INSPECTIONstdNvar_BASIC.CP,
                              "reportset": P6INSPECTIONstdNvar_BASIC.reportset,
                            },
                          ).then((v) {
                            var databuff = v.data;
                            context
                                .read<P6FINSPECTIONget_Bloc>()
                                .add(P6FINSPECTIONget_MATCP());
                            // setState(() {});
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 200,
                            height: 40,
                            color: Colors.blue,
                            child: Center(
                              child: Text("SAVE"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 150,
                        // color: Colors.red,
                        child: Center(
                          child: Text(_Mdata.reportset),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 68,
                        width: 200,
                        child: AdvanceDropDown(
                          sLabel: "Logo set",
                          imgpath: 'assets/icons/icon-down_4@3x.png',
                          listdropdown: P6INSPECTIONstdNvar_BASIC.logolist,
                          onChangeinside: (d, v) {
                            // print(d);
                            setState(() {
                              P6INSPECTIONstdNvar_BASIC.logoset = d;
                            });
                          },
                          value: P6INSPECTIONstdNvar_BASIC.logoset,
                          height: 40,
                          width: 100,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //P6INSPECTIONstdNvar_BASIC.CP

                          Dio().post(
                            options: Options(
                              // contentType: "application/json",

                              headers: {
                                "server": USERDATA.MASTER,
                              },
                            ),
                            serverGB + "logoset_UPLOAD",
                            data: {
                              "CP": P6INSPECTIONstdNvar_BASIC.CP,
                              "logoset": P6INSPECTIONstdNvar_BASIC.logoset,
                            },
                          ).then((v) {
                            var databuff = v.data;
                            context
                                .read<P6FINSPECTIONget_Bloc>()
                                .add(P6FINSPECTIONget_MATCP());
                            // setState(() {});
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: 200,
                            height: 40,
                            color: Colors.blue,
                            child: Center(
                              child: Text("SAVE"),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        height: 150,
                        // color: Colors.red,
                        child: Center(
                          child: Text(_Mdata.logoset),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
