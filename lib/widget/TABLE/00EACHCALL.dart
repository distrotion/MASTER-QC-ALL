import 'package:flutter/material.dart';

class EACHCELL extends StatelessWidget {
  EACHCELL({
    super.key,
    this.data,
    this.Alingn,
    this.textSty,
    this.BGcolor,
    this.Txtover,
    required this.tapCell,
  });
  String? data;

  AlignmentGeometry? Alingn;
  TextStyle? textSty;
  Color? BGcolor;
  TextOverflow? Txtover;
  Function(String)? tapCell;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tapCell!("tapCell");
      },
      child: Container(
        color: BGcolor ?? Colors.transparent,
        child: Align(
          alignment: Alingn ?? Alignment.center,
          child: SelectableText(
            data ?? "",
            style: textSty ??
                const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
            // overflow: Txtover ?? TextOverflow.clip,
          ),
        ),
      ),
    );
  }
}

class ACTIONCELL extends StatelessWidget {
  ACTIONCELL({
    super.key,
    this.BGcolor,
    this.isdelete,
    this.isEdit,
    required this.EditFN,
    required this.DeleteFN,
  });
  Color? BGcolor;
  bool? isdelete;
  bool? isEdit;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGcolor ?? Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isEdit ?? true) ...[
            InkWell(
              onTap: () {
                EditFN!("EditFN");
              },
              child: Icon(Icons.edit),
            ),
          ],
          if (isdelete ?? true) ...[
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                DeleteFN!("DeleteFN");
              },
              child: Icon(Icons.delete),
            ),
          ],
        ],
      ),
    );
  }
}

class ACTIONCELLs extends StatelessWidget {
  ACTIONCELLs({
    super.key,
    this.BGcolor,
    required this.SaveFN,
  });
  Color? BGcolor;
  Function(String)? SaveFN;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGcolor ?? Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              SaveFN!("SaveFN");
            },
            child: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}

class ACTIONCELLsingle extends StatelessWidget {
  ACTIONCELLsingle({
    super.key,
    this.BGcolor,
    required this.DeleteFN,
  });
  Color? BGcolor;
  Function(String)? EditFN;
  Function(String)? DeleteFN;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BGcolor ?? Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              DeleteFN!("DeleteFN");
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
