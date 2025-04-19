import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as IMG;

import '../../bloc/BlocEvent/11-1-SIGNATURESget.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/IMGviewWID.dart';
import '../../widget/common/Loading.dart';
import '../page4.dart';
import '11SIGNATURESvar.dart';

class P11SIGNATURESmain extends StatefulWidget {
  P11SIGNATURESmain({
    super.key,
    this.data,
  });
  SIGNATURESClass? data;

  @override
  State<P11SIGNATURESmain> createState() => _P11SIGNATURESmainState();
}

class _P11SIGNATURESmainState extends State<P11SIGNATURESmain> {
  @override
  void initState() {
    // TODO: implement initState
    //data
    context.read<SIGNATURESGET_Bloc>().add(SIGNATURESGET_MATCP());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SIGNATURESClass _data = widget.data ?? SIGNATURESClass();
    P11SIGNATURESvar.Pimg = _data.SIGNATURE;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 400,
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 40,
                    // )
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 400,
                        child: InkWell(
                          onTap: () async {
                            var picked = await FilePicker.platform.pickFiles();
                            Uint8List? imageByte;
                            Uint8List? resizedData;

                            if (picked != null) {
                              imageByte = picked.files.first.bytes;
                              IMG.Image? img = IMG.decodeImage(imageByte!);
                              // IMG.Image? img2 = IMG.copyResize(img!, width: 500);
                              resizedData = IMG.encodeJpg(img!) as Uint8List?;
                              //      "data:image/jpeg;base64," +
                              P11SIGNATURESvar.Pimg =
                                  base64.encode(resizedData!);
                              Dio().post(
                                serverGB + "SIGNATURE_UPLOAD",
                                data: {
                                  "ID": USERDATA.ID,
                                  "SIGNATURE": P11SIGNATURESvar.Pimg,
                                },
                              ).then((v) {
                                //
                                // var databuff = v.data;
                                context
                                    .read<SIGNATURESGET_Bloc>()
                                    .add(SIGNATURESGET_MATCP());

                                setState(() {});
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 100,
                            color: Colors.green,
                            child: Center(
                              child: Text("UPLOAD SIGNATURE"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        // if ((widget.Mdata?.Pimg ?? '') != '') ...[
                        if ((P11SIGNATURESvar.Pimg) != '') ...[
                          PicShowW(
                            base64: P11SIGNATURESvar.Pimg,
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
                              // children: const [
                              //   SizedBox(width: 30),
                              //   CircularProgressIndicator(),
                              //   SizedBox(width: 20),
                              //   Text("Loading"),
                              // ],
                            ),
                          )
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
