import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image/image.dart' as IMG;

import '../../bloc/BlocEvent/07-1-GRAPHlistGET.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/TABLE/17GRAPHtable.dart';
import '../../widget/common/IMGviewWID.dart';
import '../../widget/common/Loading.dart';
import '../page4.dart';
import 'P07GRAPHvar.dart';

class P07GRAPHmain extends StatefulWidget {
  P07GRAPHmain({
    super.key,
    this.data,
  });
  List<GRAPHlistClass>? data;

  @override
  State<P07GRAPHmain> createState() => _P07GRAPHmainState();
}

class _P07GRAPHmainState extends State<P07GRAPHmain> {
  @override
  void initState() {
    // TODO: implement initState
    //data
    context.read<GRAPHlistGET_Bloc>().add(GRAPHlistGET_MATCP());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<GRAPHlistClass> _data = widget.data ?? [];
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 24),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                height: 40,
                color: Colors.blue,
                child: Center(
                  child: Text("NEW"),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                // color: Colors.blue,
                child: Column(
                  children: [
                    GRAPHtabletableWidget(
                      BGColorMain: Colors.grey,
                      NAME: "NAME",
                    ),
                    for (int i = 0; i < _data.length; i++) ...[
                      // for (int i = 0; i < 10; i++) ...[
                      GRAPHtabletableWidget(
                        NAME: _data[i].NAME,
                        isACTION: true,
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
