import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/04MATCPlist/04MATCPlistMAINvar.dart';
import '../../page/06INSPECTIONstdN/P6INSPECTIONstdNmain.dart';
import '../../page/06INSPECTIONstdN/P6INSPECTIONstdNvar.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

// String serverGB = serverGB;

abstract class P6FINSPECTIONget_Event {}

class P6FINSPECTIONget_MATCP extends P6FINSPECTIONget_Event {}

class P6FINSPECTIONget_FLUSH extends P6FINSPECTIONget_Event {}

class P6FINSPECTIONget_Bloc
    extends Bloc<P6FINSPECTIONget_Event, P6InspectionSTD> {
  P6FINSPECTIONget_Bloc()
      : super(P6InspectionSTD(
          INCOMMING: [],
          INPROCESS: [],
          FINAL: [],
        )) {
    on<P6FINSPECTIONget_MATCP>((event, emit) {
      return _P6FINSPECTIONget_MATCP(
          P6InspectionSTD(
            INCOMMING: [],
            INPROCESS: [],
            FINAL: [],
          ),
          emit);
    });
    on<P6FINSPECTIONget_FLUSH>((event, emit) {
      return _P6FINSPECTIONget_FLUSH(
          P6InspectionSTD(
            INCOMMING: [],
            INPROCESS: [],
            FINAL: [],
          ),
          emit);
    });
  }
  Future<void> _P6FINSPECTIONget_MATCP(
      P6InspectionSTD toAdd, Emitter<P6InspectionSTD> emit) async {
    FreeLoading(P6P6InspectionSTDNmaincontext);
    P6InspectionSTD output = P6InspectionSTD(
      INCOMMING: [],
      INPROCESS: [],
      FINAL: [],
    );
    // P6INSPECTIONstdNvar_BASIC.CP = MATCPlistMAINvar.CP;
    // P6INSPECTIONstdNvar_BASIC.FG = MATCPlistMAINvar.FG;
    // P6INSPECTIONstdNvar_BASIC.CUSTOMER = MATCPlistMAINvar.CUSTOMER;
    // P6INSPECTIONstdNvar_BASIC.PART = MATCPlistMAINvar.PART;
    // P6INSPECTIONstdNvar_BASIC.PARTNAME = MATCPlistMAINvar.PARTNAME;
    // P6INSPECTIONstdNvar_BASIC.MATERIAL = MATCPlistMAINvar.MATERIAL;
    // P6INSPECTIONstdNvar_BASIC.CUST_FULLNM = MATCPlistMAINvar.CUST_FULLNM;
    // P6INSPECTIONstdNvar_BASIC.CP = "24010177";
    // P6INSPECTIONstdNvar_BASIC.CP = "24000002";
    final response = await Dio().post(
      serverGB + "GET_MATCP_DATA",
      data: {
        "MATCP": P6INSPECTIONstdNvar_BASIC.CP,
        // "MATCP": "24010177",
      },
    );
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff[0]['INPROCESS']);

      output.status = 'GET_ALL';

      // print(databuff[0]['findTYPE_FN']);
      List<BasicBodyData> findTYPE_FN = [];
      if (databuff[0]['findTYPE_FN'] != null) {
        for (int i = 0; i < databuff[0]['findTYPE_FN'].length; i++) {
          findTYPE_FN.add(BasicBodyData(
            NAME: databuff[0]['findTYPE_FN'][i]['TYPE'] != null
                ? databuff[0]['findTYPE_FN'][i]['TYPE'].toString()
                : "",
            masterID: databuff[0]['findTYPE_FN'][i]['masterID'] != null
                ? databuff[0]['findTYPE_FN'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findTYPE_IC = [];
      if (databuff[0]['findTYPE_IC'] != null) {
        for (int i = 0; i < databuff[0]['findTYPE_IC'].length; i++) {
          findTYPE_IC.add(BasicBodyData(
            NAME: databuff[0]['findTYPE_IC'][i]['TYPE'] != null
                ? databuff[0]['findTYPE_IC'][i]['TYPE'].toString()
                : "",
            masterID: databuff[0]['findTYPE_IC'][i]['masterID'] != null
                ? databuff[0]['findTYPE_IC'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findTYPE_IP = [];
      if (databuff[0]['findTYPE_IP'] != null) {
        for (int i = 0; i < databuff[0]['findTYPE_IP'].length; i++) {
          findTYPE_IC.add(BasicBodyData(
            NAME: databuff[0]['findTYPE_IP'][i]['TYPE'] != null
                ? databuff[0]['findTYPE_IP'][i]['TYPE'].toString()
                : "",
            masterID: databuff[0]['findTYPE_IP'][i]['masterID'] != null
                ? databuff[0]['findTYPE_IP'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findTYPE_FNconv(String input) {
        String output = "";

        for (int i = 0; i < findTYPE_FN.length; i++) {
          if (input == findTYPE_FN[i].masterID) {
            output = findTYPE_FN[i].NAME;
            break;
          }
        }

        return output;
      }

      String findTYPE_ICconv(String input) {
        String output = "";

        for (int i = 0; i < findTYPE_IC.length; i++) {
          if (input == findTYPE_IC[i].masterID) {
            output = findTYPE_IC[i].NAME;
            break;
          }
        }

        return output;
      }

      String findTYPE_IPconv(String input) {
        String output = "";

        for (int i = 0; i < findTYPE_IP.length; i++) {
          if (input == findTYPE_IP[i].masterID) {
            output = findTYPE_IP[i].NAME;
            break;
          }
        }

        return output;
      }

      List<BasicBodyData> findITEMs_FN = [];

      if (databuff[0]['findITEMs_FN'] != null) {
        for (int i = 0; i < databuff[0]['findITEMs_FN'].length; i++) {
          findITEMs_FN.add(BasicBodyData(
            NAME: databuff[0]['findITEMs_FN'][i]['ITEMs'] != null
                ? databuff[0]['findITEMs_FN'][i]['ITEMs'].toString()
                : "",
            masterID: databuff[0]['findITEMs_FN'][i]['masterID'] != null
                ? databuff[0]['findITEMs_FN'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findITEMs_IC = [];

      if (databuff[0]['findITEMs_IC'] != null) {
        for (int i = 0; i < databuff[0]['findITEMs_IC'].length; i++) {
          // print('----->${databuff[0]['findITEMs_IC'][i]['masterID']}');
          findITEMs_IC.add(BasicBodyData(
            NAME: databuff[0]['findITEMs_IC'][i]['ITEMs'] != null
                ? databuff[0]['findITEMs_IC'][i]['ITEMs'].toString()
                : "",
            masterID: databuff[0]['findITEMs_IC'][i]['masterID'] != null
                ? databuff[0]['findITEMs_IC'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findITEMs_IP = [];
      // print("databuff[0]['findITEMs_IP']");
      // print(databuff[0]['findITEMs_IP']);

      if (databuff[0]['findITEMs_IP'] != null) {
        for (int i = 0; i < databuff[0]['findITEMs_IP'].length; i++) {
          // print('----->${databuff[0]['findITEMs_IP'][i]['masterID']}');
          findITEMs_IP.add(BasicBodyData(
            NAME: databuff[0]['findITEMs_IP'][i]['ITEMs'] != null
                ? databuff[0]['findITEMs_IP'][i]['ITEMs'].toString()
                : "",
            masterID: databuff[0]['findITEMs_IP'][i]['masterID'] != null
                ? databuff[0]['findITEMs_IP'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findITEMs_FNconv(String input) {
        String output = "";

        for (int i = 0; i < findITEMs_FN.length; i++) {
          if (input == findITEMs_FN[i].masterID) {
            output = findITEMs_FN[i].NAME;
            break;
          }
        }

        return output;
      }

      String findITEMs_ICconv(String input) {
        // print('*----->${input}');
        String output = "";

        for (int i = 0; i < findITEMs_IC.length; i++) {
          if (input == findITEMs_IC[i].masterID) {
            output = findITEMs_IC[i].NAME;
            break;
          }
        }

        return output;
      }

      String findITEMs_IPconv(String input) {
        // print('*----->${input}');
        String output = "";

        for (int i = 0; i < findITEMs_IP.length; i++) {
          if (input == findITEMs_IP[i].masterID) {
            output = findITEMs_IP[i].NAME;
            break;
          }
        }

        return output;
      }

      //findMACHINE_FN
      // print(databuff[0]['findMACHINE_FN']);
      List<BasicBodyData> findMACHINE_FN = [];
      if (databuff[0]['findMACHINE_FN'] != null) {
        for (int i = 0; i < databuff[0]['findMACHINE_FN'].length; i++) {
          findMACHINE_FN.add(BasicBodyData(
            NAME: databuff[0]['findMACHINE_FN'][i]['METHOD'] != null
                ? databuff[0]['findMACHINE_FN'][i]['METHOD'].toString()
                : "",
            masterID: databuff[0]['findMACHINE_FN'][i]['masterID'] != null
                ? databuff[0]['findMACHINE_FN'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findMACHINE_IC = [];
      if (databuff[0]['findMACHINE_IC'] != null) {
        for (int i = 0; i < databuff[0]['findMACHINE_IC'].length; i++) {
          // print('----->${databuff[0]['findMACHINE_IC'][i]['masterID']}');
          findMACHINE_IC.add(BasicBodyData(
            NAME: databuff[0]['findMACHINE_IC'][i]['METHOD'] != null
                ? databuff[0]['findMACHINE_IC'][i]['METHOD'].toString()
                : "",
            masterID: databuff[0]['findMACHINE_IC'][i]['masterID'] != null
                ? databuff[0]['findMACHINE_IC'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findMACHINE_IP = [];
      if (databuff[0]['findMACHINE_IP'] != null) {
        for (int i = 0; i < databuff[0]['findMACHINE_IP'].length; i++) {
          // print('----->${databuff[0]['findMACHINE_IP'][i]['masterID']}');
          findMACHINE_IP.add(BasicBodyData(
            NAME: databuff[0]['findMACHINE_IP'][i]['METHOD'] != null
                ? databuff[0]['findMACHINE_IP'][i]['METHOD'].toString()
                : "",
            masterID: databuff[0]['findMACHINE_IP'][i]['masterID'] != null
                ? databuff[0]['findMACHINE_IP'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findMACHINE_FNconv(String input) {
        String output = "";

        for (int i = 0; i < findMACHINE_FN.length; i++) {
          if (input == findMACHINE_FN[i].masterID) {
            output = findMACHINE_FN[i].NAME;
            break;
          }
        }

        return output;
      }

      String findMACHINE_ICconv(String input) {
        String output = "";
        // print('----->${input}');
        for (int i = 0; i < findMACHINE_IC.length; i++) {
          if (input == findMACHINE_IC[i].masterID) {
            output = findMACHINE_IC[i].NAME;
            break;
          }
        }

        return output;
      }

      String findMACHINE_IPconv(String input) {
        String output = "";
        // print('----->${input}');
        for (int i = 0; i < findMACHINE_IP.length; i++) {
          if (input == findMACHINE_IP[i].masterID) {
            output = findMACHINE_IP[i].NAME;
            break;
          }
        }

        return output;
      }

      //findUNIT_FN
      List<BasicBodyData> findUNIT_FN = [];
      if (databuff[0]['findUNIT_FN'] != null) {
        for (int i = 0; i < databuff[0]['findUNIT_FN'].length; i++) {
          findUNIT_FN.add(BasicBodyData(
            NAME: databuff[0]['findUNIT_FN'][i]['UNIT'] != null
                ? databuff[0]['findUNIT_FN'][i]['UNIT'].toString()
                : "",
            masterID: databuff[0]['findUNIT_FN'][i]['masterID'] != null
                ? databuff[0]['findUNIT_FN'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findUNIT_IC = [];
      if (databuff[0]['findUNIT_IC'] != null) {
        for (int i = 0; i < databuff[0]['findUNIT_IC'].length; i++) {
          findUNIT_IC.add(BasicBodyData(
            NAME: databuff[0]['findUNIT_IC'][i]['UNIT'] != null
                ? databuff[0]['findUNIT_IC'][i]['UNIT'].toString()
                : "",
            masterID: databuff[0]['findUNIT_IC'][i]['masterID'] != null
                ? databuff[0]['findUNIT_IC'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findUNIT_IP = [];
      if (databuff[0]['findUNIT_IP'] != null) {
        for (int i = 0; i < databuff[0]['findUNIT_IP'].length; i++) {
          findUNIT_IP.add(BasicBodyData(
            NAME: databuff[0]['findUNIT_IP'][i]['UNIT'] != null
                ? databuff[0]['findUNIT_IP'][i]['UNIT'].toString()
                : "",
            masterID: databuff[0]['findUNIT_IP'][i]['masterID'] != null
                ? databuff[0]['findUNIT_IP'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findUNIT_FNconv(String input) {
        String output = "";

        for (int i = 0; i < findUNIT_FN.length; i++) {
          if (input == findUNIT_FN[i].masterID) {
            output = findUNIT_FN[i].NAME;
            break;
          }
        }

        return output;
      }

      String findUNIT_ICconv(String input) {
        String output = "";

        for (int i = 0; i < findUNIT_IC.length; i++) {
          if (input == findUNIT_IC[i].masterID) {
            output = findUNIT_IC[i].NAME;
            break;
          }
        }

        return output;
      }

      String findUNIT_IPconv(String input) {
        String output = "";

        for (int i = 0; i < findUNIT_IP.length; i++) {
          if (input == findUNIT_IP[i].masterID) {
            output = findUNIT_IP[i].NAME;
            break;
          }
        }

        return output;
      }

      //findSPECIFICATION_FN
      // print(databuff[0]['findSPECIFICATION_FN']);
      List<BasicBodyData> findSPECIFICATION_FN = [];
      if (databuff[0]['findSPECIFICATION_FN'] != null) {
        for (int i = 0; i < databuff[0]['findSPECIFICATION_FN'].length; i++) {
          findSPECIFICATION_FN.add(BasicBodyData(
            NAME:
                databuff[0]['findSPECIFICATION_FN'][i]['SPECIFICATION'] != null
                    ? databuff[0]['findSPECIFICATION_FN'][i]['SPECIFICATION']
                        .toString()
                    : "",
            masterID: databuff[0]['findSPECIFICATION_FN'][i]['masterID'] != null
                ? databuff[0]['findSPECIFICATION_FN'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findSPECIFICATION_IC = [];
      if (databuff[0]['findSPECIFICATION_IC'] != null) {
        for (int i = 0; i < databuff[0]['findSPECIFICATION_IC'].length; i++) {
          findSPECIFICATION_IC.add(BasicBodyData(
            NAME:
                databuff[0]['findSPECIFICATION_IC'][i]['SPECIFICATION'] != null
                    ? databuff[0]['findSPECIFICATION_IC'][i]['SPECIFICATION']
                        .toString()
                    : "",
            masterID: databuff[0]['findSPECIFICATION_IC'][i]['masterID'] != null
                ? databuff[0]['findSPECIFICATION_IC'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      List<BasicBodyData> findSPECIFICATION_IP = [];
      if (databuff[0]['findSPECIFICATION_IP'] != null) {
        for (int i = 0; i < databuff[0]['findSPECIFICATION_IP'].length; i++) {
          findSPECIFICATION_IP.add(BasicBodyData(
            NAME:
                databuff[0]['findSPECIFICATION_IP'][i]['SPECIFICATION'] != null
                    ? databuff[0]['findSPECIFICATION_IP'][i]['SPECIFICATION']
                        .toString()
                    : "",
            masterID: databuff[0]['findSPECIFICATION_IP'][i]['masterID'] != null
                ? databuff[0]['findSPECIFICATION_IP'][i]['masterID'].toString()
                : "",
          ));
        }
      }

      String findSPECIFICATION_FNconv(String input) {
        String output = "";

        if (input.contains("SPECIFICATION-")) {
          for (int i = 0; i < findSPECIFICATION_FN.length; i++) {
            if (input == findSPECIFICATION_FN[i].masterID) {
              output = findSPECIFICATION_FN[i].NAME;
              break;
            }
          }
        } else {
          if (input.contains("{") && input.contains("}")) {
            Map<String, dynamic> data = jsonStringToMap(input);
            // print(input);
            output = "";
            if (data['condition'] != null && data['condition'] == "BTW") {
              output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
            } else if (data['condition'] != null &&
                data['condition'] == "Actual") {
              output = 'Actual';
            } else if (data['condition'] != null &&
                data['condition'] == "LOL(<)") {
              output = ' ≤ ${data['LOL_H']}';
            } else if (data['condition'] != null &&
                data['condition'] == "HIM(>)") {
              output = ' ≥ ${data['HIM_L']}';
            }
          } else {
            output = input;
          }
        }
        return output;
      }

      String findSPECIFICATION_ICconv(String input) {
        String output = "";

        if (input.contains("SPECIFICATION-")) {
          for (int i = 0; i < findSPECIFICATION_IC.length; i++) {
            if (input == findSPECIFICATION_IC[i].masterID) {
              output = findSPECIFICATION_IC[i].NAME;
              break;
            }
          }
        } else {
          if (input.contains("{") && input.contains("}")) {
            Map<String, dynamic> data = jsonStringToMap(input);
            // print(input);
            output = "";
            if (data['condition'] != null && data['condition'] == "BTW") {
              output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
            } else if (data['condition'] != null &&
                data['condition'] == "Actual") {
              output = 'Actual';
            } else if (data['condition'] != null &&
                data['condition'] == "LOL(<)") {
              output = ' ≤ ${data['LOL_H']}';
            } else if (data['condition'] != null &&
                data['condition'] == "HIM(>)") {
              output = ' ≥ ${data['HIM_L']}';
            }
          } else {
            output = input;
          }
        }
        return output;
      }

      String findSPECIFICATION_IPconv(String input) {
        String output = "";

        if (input.contains("SPECIFICATION-")) {
          for (int i = 0; i < findSPECIFICATION_IP.length; i++) {
            if (input == findSPECIFICATION_IP[i].masterID) {
              output = findSPECIFICATION_IP[i].NAME;
              break;
            }
          }
        } else {
          if (input.contains("{") && input.contains("}")) {
            Map<String, dynamic> data = jsonStringToMap(input);
            // print(input);
            output = "";
            if (data['condition'] != null && data['condition'] == "BTW") {
              output = '${data['BTW_LOW']} - ${data['BTW_HI']} ';
            } else if (data['condition'] != null &&
                data['condition'] == "Actual") {
              output = 'Actual';
            } else if (data['condition'] != null &&
                data['condition'] == "LOL(<)") {
              output = ' ≤ ${data['LOL_H']}';
            } else if (data['condition'] != null &&
                data['condition'] == "HIM(>)") {
              output = ' ≥ ${data['HIM_L']}';
            }
          } else {
            output = input;
          }
        }
        return output;
      }

      if (databuff[0]['FINAL'] != null) {
        for (var i = 0; i < databuff[0]['FINAL'].length; i++) {
          //
          final rest = await Dio().post(
            serverGB + "GET_FINAL_DOCUMENT",
            data: {
              "METHODid": databuff[0]['FINAL'][i]['METHOD'] != null
                  ? databuff[0]['FINAL'][i]['METHOD'].toString()
                  : '',
              "ITEMs": databuff[0]['FINAL'][i]['ITEMs'] != null
                  ? databuff[0]['FINAL'][i]['ITEMs'].toString()
                  : '',
            },
          );

          String DOCUMENT = '';
          if (rest.statusCode == 200) {
            var databuff = rest.data;
            // print(databuff);
            DOCUMENT = databuff['DOCUMENT'] != null
                ? databuff['DOCUMENT'].toString()
                : "";
          }

          final rest2 = await Dio().post(
            serverGB + "GET_FINAL_COMMENT",
            data: {
              "masterID": databuff[0]['FINAL'][i]['REMARK'] != null
                  ? databuff[0]['FINAL'][i]['REMARK'].toString()
                  : '',
            },
          );
          String COMMENT = '';

          if (rest2.statusCode == 200) {
            var databuff = rest2.data;

            COMMENT = databuff['COMMENT'] != null
                ? databuff['COMMENT'].toString()
                : "";
          }
          print(databuff[0]['FINAL'][i]['VARI']);
          output.FINAL.add(
            speckSTD(
              seq: databuff[0]['FINAL'][i]['SEQ'] != null
                  ? databuff[0]['FINAL'][i]['SEQ'].toString()
                  : '0',
              TYPE: databuff[0]['FINAL'][i]['TYPE'] != null
                  ? databuff[0]['FINAL'][i]['TYPE'].toString()
                  : '',
              TYPEname: findTYPE_FNconv(databuff[0]['FINAL'][i]['TYPE'] != null
                  ? databuff[0]['FINAL'][i]['TYPE'].toString()
                  : ''),
              ITEMs: databuff[0]['FINAL'][i]['ITEMs'] != null
                  ? databuff[0]['FINAL'][i]['ITEMs'].toString()
                  : '',
              ITEMsname: findITEMs_FNconv(
                  databuff[0]['FINAL'][i]['ITEMs'] != null
                      ? databuff[0]['FINAL'][i]['ITEMs'].toString()
                      : ''),
              RESULTFORMAT: databuff[0]['FINAL'][i]['RESULTFORMAT'] != null
                  ? databuff[0]['FINAL'][i]['RESULTFORMAT'].toString()
                  : '',
              GRAPHTYPE: databuff[0]['FINAL'][i]['GRAPHTYPE'] != null
                  ? databuff[0]['FINAL'][i]['GRAPHTYPE'].toString()
                  : '',
              INTERSECTION: databuff[0]['FINAL'][i]['INTERSECTION'] != null
                  ? databuff[0]['FINAL'][i]['INTERSECTION'].toString()
                  : '',
              // DOCUMENT: databuff[0]['FINAL'][i]['DOCUMENT'] != null
              //     ? databuff[0]['FINAL'][i]['DOCUMENT'].toString()
              //     : '',

              DOCUMENT: DOCUMENT,
              SCMARK: databuff[0]['FINAL'][i]['SCMARK'] != null
                  ? databuff[0]['FINAL'][i]['SCMARK'].toString()
                  : '',
              METHOD: databuff[0]['FINAL'][i]['METHOD'] != null
                  ? databuff[0]['FINAL'][i]['METHOD'].toString()
                  : '',
              METHODname: findMACHINE_FNconv(
                  databuff[0]['FINAL'][i]['METHOD'] != null
                      ? databuff[0]['FINAL'][i]['METHOD'].toString()
                      : ''),
              INSTRUMENTS: databuff[0]['FINAL'][i]['INSTRUMENTS'] != null
                  ? databuff[0]['FINAL'][i]['INSTRUMENTS'].toString()
                  : '',
              SPECIFICATION: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
                  ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['value']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONstr: databuff[0]['FINAL'][i]['SPECIFICATION'] != null
                  ? (databuff[0]['FINAL'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATION'][0]['name']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONve:
                  databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : '',
              SPECIFICATIONcondition: databuff[0]['FINAL'][i]
                          ['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['condition'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['condition']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONBTW_HI: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_HI']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONBTW_LOW: databuff[0]['FINAL'][i]
                          ['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['BTW_LOW'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']
                                  ['BTW_LOW']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONHIM_L: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['HIM_L']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONLOL_H: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['LOL_H']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONTARGET: databuff[0]['FINAL'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].runtimeType ==
                          String
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET'] !=
                              null
                          ? databuff[0]['FINAL'][i]['SPECIFICATIONve']['TARGET']
                              .toString()
                          : '-'
                  : '-',
              SPECIFICATIONvename: findSPECIFICATION_FNconv(
                  databuff[0]['FINAL'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['FINAL'][i]['SPECIFICATIONve'].toString()
                      : ''),
              UNIT: databuff[0]['FINAL'][i]['UNIT'] != null
                  ? databuff[0]['FINAL'][i]['UNIT'].toString()
                  : '',
              UNITname: findUNIT_FNconv(databuff[0]['FINAL'][i]['UNIT'] != null
                  ? databuff[0]['FINAL'][i]['UNIT'].toString()
                  : ''),
              CONVERSE: databuff[0]['FINAL'][i]['CONVERSE'] != null
                  ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
                  : '',
              CONVERSEname: findUNIT_FNconv(
                  databuff[0]['FINAL'][i]['CONVERSE'] != null
                      ? databuff[0]['FINAL'][i]['CONVERSE'].toString()
                      : ''),
              // POINTPCS: databuff[0]['FINAL'][i]['POINTPCS'] != null
              //     ? databuff[0]['FINAL'][i]['POINTPCS'].toString()
              //     : '',
              // POSITION: databuff[0]['FINAL'][i]['POSITION'] != null
              //     ? databuff[0]['FINAL'][i]['POSITION'].toString()
              //     : '',
              POINT: databuff[0]['FINAL'][i]['POINT'] != null
                  ? databuff[0]['FINAL'][i]['POINT'].toString()
                  : '',
              PCS: databuff[0]['FINAL'][i]['PCS'] != null
                  ? databuff[0]['FINAL'][i]['PCS'].toString()
                  : '',
              FREQUENCY: databuff[0]['FINAL'][i]['FREQUENCY'] != null
                  ? databuff[0]['FINAL'][i]['FREQUENCY'].toString()
                  : '',
              MODE: databuff[0]['FINAL'][i]['MODE'] != null
                  ? databuff[0]['FINAL'][i]['MODE'].toString()
                  : '',
              // REMARK: databuff[0]['FINAL'][i]['REMARK'] != null
              //     ? databuff[0]['FINAL'][i]['REMARK'].toString()
              //     : '',
              REMARK: COMMENT,
              LOAD: databuff[0]['FINAL'][i]['LOAD'] != null
                  ? databuff[0]['FINAL'][i]['LOAD'].toString()
                  : '',

              SWreport: databuff[0]['FINAL'][i]['SWreport'] != null
                  ? databuff[0]['FINAL'][i]['SWreport'].toString()
                  : '',
              K1b: databuff[0]['FINAL'][i]['K1b'] != null
                  ? databuff[0]['FINAL'][i]['K1b'].toString()
                  : '',
              K1v: databuff[0]['FINAL'][i]['K1v'] != null
                  ? databuff[0]['FINAL'][i]['K1v'].toString()
                  : '',

              CONVERSEDATA: databuff[0]['FINAL'][i]['CONVERSEDATA'] != null
                  ? databuff[0]['FINAL'][i]['CONVERSEDATA'].toString()
                  : '',
              SUMdata: databuff[0]['FINAL'][i]['SUMDATA'] != null
                  ? databuff[0]['FINAL'][i]['SUMDATA'].toString()
                  : '',

              SUMdataTable: databuff[0]['FINAL'][i]['SUMdataTable'] != null
                  ? databuff[0]['FINAL'][i]['SUMdataTable'].toString()
                  : '',
              SUMdataResult: databuff[0]['FINAL'][i]['SUMdataResult'] != null
                  ? databuff[0]['FINAL'][i]['SUMdataResult'].toString()
                  : '',
              SUMdataDetail: databuff[0]['FINAL'][i]['SUMdataDetail'] != null
                  ? databuff[0]['FINAL'][i]['SUMdataDetail'].toString()
                  : '',

              SRAWDATA: databuff[0]['FINAL'][i]['SRAWDATA'] != null
                  ? databuff[0]['FINAL'][i]['SRAWDATA'].toString()
                  : '',

              AQL: databuff[0]['FINAL'][i]['AQL'] != null
                  ? databuff[0]['FINAL'][i]['AQL'].toString()
                  : '',
              AQLV: databuff[0]['FINAL'][i]['AQLV'] != null
                  ? databuff[0]['FINAL'][i]['AQLV'].toString()
                  : '',

              VARX: databuff[0]['FINAL'][i]['VARX'] != null
                  ? databuff[0]['FINAL'][i]['VARX'].toString()
                  : '',

              VARY: databuff[0]['FINAL'][i]['VARY'] != null
                  ? databuff[0]['FINAL'][i]['VARY'].toString()
                  : '',

              VARZ: databuff[0]['FINAL'][i]['VARZ'] != null
                  ? databuff[0]['FINAL'][i]['VARZ'].toString()
                  : '',

              VARI: databuff[0]['FINAL'][i]['VARI'] != null
                  ? databuff[0]['FINAL'][i]['VARI'].toString()
                  : '',
              shape: databuff[0]['FINAL'][i]['shape'] != null
                  ? databuff[0]['FINAL'][i]['shape'].toString()
                  : '',
            ),
          );
        }
      }

      if (databuff[0]['INCOMMING'] != null) {
        // print(databuff[0]['INCOMMING']);
        for (var i = 0; i < databuff[0]['INCOMMING'].length; i++) {
          final rest3 = await Dio().post(
            serverGB + "GET_INCOMMING_DOCUMENT",
            data: {
              "METHODid": databuff[0]['INCOMMING'][i]['METHOD'] != null
                  ? databuff[0]['INCOMMING'][i]['METHOD'].toString()
                  : '',
              "ITEMs": databuff[0]['INCOMMING'][i]['ITEMs'] != null
                  ? databuff[0]['INCOMMING'][i]['ITEMs'].toString()
                  : '',
            },
          );

          String DOCUMENT = '';
          if (rest3.statusCode == 200) {
            var databuff = rest3.data;
            // print(databuff);
            DOCUMENT = databuff['DOCUMENT'] != null
                ? databuff['DOCUMENT'].toString()
                : "";
          }

          final rest4 = await Dio().post(
            serverGB + "GET_INCOMMING_COMMENT",
            data: {
              "masterID": databuff[0]['INCOMMING'][i]['REMARK'] != null
                  ? databuff[0]['INCOMMING'][i]['REMARK'].toString()
                  : '',
            },
          );
          String COMMENT = '';

          if (rest4.statusCode == 200) {
            var databuff = rest4.data;

            COMMENT = databuff['COMMENT'] != null
                ? databuff['COMMENT'].toString()
                : "";
          }
          //
          output.INCOMMING.add(
            speckSTD(
              seq: databuff[0]['INCOMMING'][i]['SEQ'] != null
                  ? databuff[0]['INCOMMING'][i]['SEQ'].toString()
                  : '0',
              TYPE: databuff[0]['INCOMMING'][i]['TYPE'] != null
                  ? databuff[0]['INCOMMING'][i]['TYPE'].toString()
                  : '',
              TYPEname: findTYPE_ICconv(
                  databuff[0]['INCOMMING'][i]['TYPE'] != null
                      ? databuff[0]['INCOMMING'][i]['TYPE'].toString()
                      : ''),
              ITEMs: databuff[0]['INCOMMING'][i]['ITEMs'] != null
                  ? databuff[0]['INCOMMING'][i]['ITEMs'].toString()
                  : '',
              ITEMsname: findITEMs_ICconv(
                  databuff[0]['INCOMMING'][i]['ITEMs'] != null
                      ? databuff[0]['INCOMMING'][i]['ITEMs'].toString()
                      : ''),
              RESULTFORMAT: databuff[0]['INCOMMING'][i]['RESULTFORMAT'] != null
                  ? databuff[0]['INCOMMING'][i]['RESULTFORMAT'].toString()
                  : '',
              GRAPHTYPE: databuff[0]['INCOMMING'][i]['GRAPHTYPE'] != null
                  ? databuff[0]['INCOMMING'][i]['GRAPHTYPE'].toString()
                  : '',
              INTERSECTION: databuff[0]['INCOMMING'][i]['INTERSECTION'] != null
                  ? databuff[0]['INCOMMING'][i]['INTERSECTION'].toString()
                  : '',
              // DOCUMENT: databuff[0]['INCOMMING'][i]['DOCUMENT'] != null
              //     ? databuff[0]['INCOMMING'][i]['DOCUMENT'].toString()
              //     : '',

              DOCUMENT: DOCUMENT,
              SCMARK: databuff[0]['INCOMMING'][i]['SCMARK'] != null
                  ? databuff[0]['INCOMMING'][i]['SCMARK'].toString()
                  : '',
              METHOD: databuff[0]['INCOMMING'][i]['METHOD'] != null
                  ? databuff[0]['INCOMMING'][i]['METHOD'].toString()
                  : '',
              METHODname: findMACHINE_ICconv(
                  databuff[0]['INCOMMING'][i]['METHOD'] != null
                      ? databuff[0]['INCOMMING'][i]['METHOD'].toString()
                      : ''),
              INSTRUMENTS: databuff[0]['INCOMMING'][i]['INSTRUMENTS'] != null
                  ? databuff[0]['INCOMMING'][i]['INSTRUMENTS'].toString()
                  : '',
              SPECIFICATION: databuff[0]['INCOMMING'][i]['SPECIFICATION'] !=
                      null
                  ? (databuff[0]['INCOMMING'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
                                  ['value'] !=
                              null
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
                                  ['value']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONstr: databuff[0]['INCOMMING'][i]['SPECIFICATION'] !=
                      null
                  ? (databuff[0]['INCOMMING'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
                                  ['name'] !=
                              null
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATION'][0]
                                  ['name']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONve: databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve'].toString()
                  : '',
              SPECIFICATIONcondition:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['condition'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['condition']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONBTW_HI:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['BTW_HI'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['BTW_HI']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONBTW_LOW:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['BTW_LOW'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['BTW_LOW']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONHIM_L:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]
                                  ['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['HIM_L'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['HIM_L']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONLOL_H:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]
                                  ['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['LOL_H'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['LOL_H']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONTARGET:
                  databuff[0]['INCOMMING'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['TARGET'] !=
                                  null
                              ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve']
                                      ['TARGET']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONvename: findSPECIFICATION_ICconv(databuff[0]
                          ['INCOMMING'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['INCOMMING'][i]['SPECIFICATIONve'].toString()
                  : ''),
              UNIT: databuff[0]['INCOMMING'][i]['UNIT'] != null
                  ? databuff[0]['INCOMMING'][i]['UNIT'].toString()
                  : '',
              UNITname: findUNIT_ICconv(
                  databuff[0]['INCOMMING'][i]['UNIT'] != null
                      ? databuff[0]['INCOMMING'][i]['UNIT'].toString()
                      : ''),
              CONVERSE: databuff[0]['INCOMMING'][i]['CONVERSE'] != null
                  ? databuff[0]['INCOMMING'][i]['CONVERSE'].toString()
                  : '',
              CONVERSEname: findUNIT_ICconv(
                  databuff[0]['INCOMMING'][i]['CONVERSE'] != null
                      ? databuff[0]['INCOMMING'][i]['CONVERSE'].toString()
                      : ''),
              // POINTPCS: databuff[0]['INCOMMING'][i]['POINTPCS'] != null
              //     ? databuff[0]['INCOMMING'][i]['POINTPCS'].toString()
              //     : '',
              // POSITION: databuff[0]['INCOMMING'][i]['POSITION'] != null
              //     ? databuff[0]['INCOMMING'][i]['POSITION'].toString()
              //     : '',
              POINT: databuff[0]['INCOMMING'][i]['POINT'] != null
                  ? databuff[0]['INCOMMING'][i]['POINT'].toString()
                  : '',
              PCS: databuff[0]['INCOMMING'][i]['PCS'] != null
                  ? databuff[0]['INCOMMING'][i]['PCS'].toString()
                  : '',
              FREQUENCY: databuff[0]['INCOMMING'][i]['FREQUENCY'] != null
                  ? databuff[0]['INCOMMING'][i]['FREQUENCY'].toString()
                  : '',
              MODE: databuff[0]['INCOMMING'][i]['MODE'] != null
                  ? databuff[0]['INCOMMING'][i]['MODE'].toString()
                  : '',
              // REMARK: databuff[0]['INCOMMING'][i]['REMARK'] != null
              //     ? databuff[0]['INCOMMING'][i]['REMARK'].toString()
              //     : '',
              REMARK: COMMENT,
              LOAD: databuff[0]['INCOMMING'][i]['LOAD'] != null
                  ? databuff[0]['INCOMMING'][i]['LOAD'].toString()
                  : '',

              SWreport: databuff[0]['INCOMMING'][i]['SWreport'] != null
                  ? databuff[0]['INCOMMING'][i]['SWreport'].toString()
                  : '',
              K1b: databuff[0]['INCOMMING'][i]['K1b'] != null
                  ? databuff[0]['INCOMMING'][i]['K1b'].toString()
                  : '',
              K1v: databuff[0]['INCOMMING'][i]['K1v'] != null
                  ? databuff[0]['INCOMMING'][i]['K1v'].toString()
                  : '',

              CONVERSEDATA: databuff[0]['INCOMMING'][i]['CONVERSEDATA'] != null
                  ? databuff[0]['INCOMMING'][i]['CONVERSEDATA'].toString()
                  : '',
              SUMdata: databuff[0]['INCOMMING'][i]['SUMDATA'] != null
                  ? databuff[0]['INCOMMING'][i]['SUMDATA'].toString()
                  : '',

              SUMdataTable: databuff[0]['INCOMMING'][i]['SUMdataTable'] != null
                  ? databuff[0]['INCOMMING'][i]['SUMdataTable'].toString()
                  : '',
              SUMdataResult:
                  databuff[0]['INCOMMING'][i]['SUMdataResult'] != null
                      ? databuff[0]['INCOMMING'][i]['SUMdataResult'].toString()
                      : '',
              SUMdataDetail:
                  databuff[0]['INCOMMING'][i]['SUMdataDetail'] != null
                      ? databuff[0]['INCOMMING'][i]['SUMdataDetail'].toString()
                      : '',

              SRAWDATA: databuff[0]['INCOMMING'][i]['SRAWDATA'] != null
                  ? databuff[0]['INCOMMING'][i]['SRAWDATA'].toString()
                  : '',

              AQL: databuff[0]['INCOMMING'][i]['AQL'] != null
                  ? databuff[0]['INCOMMING'][i]['AQL'].toString()
                  : '',
              AQLV: databuff[0]['INCOMMING'][i]['AQLV'] != null
                  ? databuff[0]['INCOMMING'][i]['AQLV'].toString()
                  : '',
            ),
          );
        }
      }
      if (databuff[0]['INPROCESS'] != null) {
        // print(databuff[0]['INPROCESS']);
        for (var i = 0; i < databuff[0]['INPROCESS'].length; i++) {
          final rest3 = await Dio().post(
            serverGB + "GET_INCOMMING_DOCUMENT",
            data: {
              "METHODid": databuff[0]['INPROCESS'][i]['METHOD'] != null
                  ? databuff[0]['INPROCESS'][i]['METHOD'].toString()
                  : '',
              "ITEMs": databuff[0]['INPROCESS'][i]['ITEMs'] != null
                  ? databuff[0]['INPROCESS'][i]['ITEMs'].toString()
                  : '',
            },
          );

          String DOCUMENT = '';
          if (rest3.statusCode == 200) {
            var databuff = rest3.data;
            // print(databuff);
            DOCUMENT = databuff['DOCUMENT'] != null
                ? databuff['DOCUMENT'].toString()
                : "";
          }

          final rest4 = await Dio().post(
            serverGB + "GET_INCOMMING_COMMENT",
            data: {
              "masterID": databuff[0]['INPROCESS'][i]['REMARK'] != null
                  ? databuff[0]['INPROCESS'][i]['REMARK'].toString()
                  : '',
            },
          );
          String COMMENT = '';

          if (rest4.statusCode == 200) {
            var databuff = rest4.data;

            COMMENT = databuff['COMMENT'] != null
                ? databuff['COMMENT'].toString()
                : "";
          }
          //
          output.INPROCESS.add(
            speckSTD(
              seq: databuff[0]['INPROCESS'][i]['SEQ'] != null
                  ? databuff[0]['INPROCESS'][i]['SEQ'].toString()
                  : '0',
              TYPE: databuff[0]['INPROCESS'][i]['TYPE'] != null
                  ? databuff[0]['INPROCESS'][i]['TYPE'].toString()
                  : '',
              TYPEname: findTYPE_IPconv(
                  databuff[0]['INPROCESS'][i]['TYPE'] != null
                      ? databuff[0]['INPROCESS'][i]['TYPE'].toString()
                      : ''),
              ITEMs: databuff[0]['INPROCESS'][i]['ITEMs'] != null
                  ? databuff[0]['INPROCESS'][i]['ITEMs'].toString()
                  : '',
              ITEMsname: findITEMs_IPconv(
                  databuff[0]['INPROCESS'][i]['ITEMs'] != null
                      ? databuff[0]['INPROCESS'][i]['ITEMs'].toString()
                      : ''),
              RESULTFORMAT: databuff[0]['INPROCESS'][i]['RESULTFORMAT'] != null
                  ? databuff[0]['INPROCESS'][i]['RESULTFORMAT'].toString()
                  : '',
              GRAPHTYPE: databuff[0]['INPROCESS'][i]['GRAPHTYPE'] != null
                  ? databuff[0]['INPROCESS'][i]['GRAPHTYPE'].toString()
                  : '',
              INTERSECTION: databuff[0]['INPROCESS'][i]['INTERSECTION'] != null
                  ? databuff[0]['INPROCESS'][i]['INTERSECTION'].toString()
                  : '',
              // DOCUMENT: databuff[0]['INPROCESS'][i]['DOCUMENT'] != null
              //     ? databuff[0]['INPROCESS'][i]['DOCUMENT'].toString()
              //     : '',

              DOCUMENT: DOCUMENT,
              SCMARK: databuff[0]['INPROCESS'][i]['SCMARK'] != null
                  ? databuff[0]['INPROCESS'][i]['SCMARK'].toString()
                  : '',
              METHOD: databuff[0]['INPROCESS'][i]['METHOD'] != null
                  ? databuff[0]['INPROCESS'][i]['METHOD'].toString()
                  : '',
              METHODname: findMACHINE_IPconv(
                  databuff[0]['INPROCESS'][i]['METHOD'] != null
                      ? databuff[0]['INPROCESS'][i]['METHOD'].toString()
                      : ''),
              INSTRUMENTS: databuff[0]['INPROCESS'][i]['INSTRUMENTS'] != null
                  ? databuff[0]['INPROCESS'][i]['INSTRUMENTS'].toString()
                  : '',
              SPECIFICATION: databuff[0]['INPROCESS'][i]['SPECIFICATION'] !=
                      null
                  ? (databuff[0]['INPROCESS'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATION'][0]
                                  ['value'] !=
                              null
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATION'][0]
                                  ['value']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONstr: databuff[0]['INPROCESS'][i]['SPECIFICATION'] !=
                      null
                  ? (databuff[0]['INPROCESS'][i]['SPECIFICATION']).length > 0
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATION'][0]
                                  ['name'] !=
                              null
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATION'][0]
                                  ['name']
                              .toString()
                          : ''
                      : ''
                  : '',
              SPECIFICATIONve: databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve'].toString()
                  : '',
              SPECIFICATIONcondition:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['condition'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['condition']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONBTW_HI:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['BTW_HI'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['BTW_HI']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONBTW_LOW:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['BTW_LOW'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['BTW_LOW']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONHIM_L:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]
                                  ['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['HIM_L'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['HIM_L']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONLOL_H:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]
                                  ['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['LOL_H'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['LOL_H']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONTARGET:
                  databuff[0]['INPROCESS'][i]['SPECIFICATIONve'] != null
                      ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                  .runtimeType ==
                              String
                          ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                              .toString()
                          : databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['TARGET'] !=
                                  null
                              ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve']
                                      ['TARGET']
                                  .toString()
                              : '-'
                      : '-',
              SPECIFICATIONvename: findSPECIFICATION_IPconv(databuff[0]
                          ['INPROCESS'][i]['SPECIFICATIONve'] !=
                      null
                  ? databuff[0]['INPROCESS'][i]['SPECIFICATIONve'].toString()
                  : ''),
              UNIT: databuff[0]['INPROCESS'][i]['UNIT'] != null
                  ? databuff[0]['INPROCESS'][i]['UNIT'].toString()
                  : '',
              UNITname: findUNIT_IPconv(
                  databuff[0]['INPROCESS'][i]['UNIT'] != null
                      ? databuff[0]['INPROCESS'][i]['UNIT'].toString()
                      : ''),
              CONVERSE: databuff[0]['INPROCESS'][i]['CONVERSE'] != null
                  ? databuff[0]['INPROCESS'][i]['CONVERSE'].toString()
                  : '',
              CONVERSEname: findUNIT_IPconv(
                  databuff[0]['INPROCESS'][i]['CONVERSE'] != null
                      ? databuff[0]['INPROCESS'][i]['CONVERSE'].toString()
                      : ''),
              // POINTPCS: databuff[0]['INPROCESS'][i]['POINTPCS'] != null
              //     ? databuff[0]['INPROCESS'][i]['POINTPCS'].toString()
              //     : '',
              // POSITION: databuff[0]['INPROCESS'][i]['POSITION'] != null
              //     ? databuff[0]['INPROCESS'][i]['POSITION'].toString()
              //     : '',
              POINT: databuff[0]['INPROCESS'][i]['POINT'] != null
                  ? databuff[0]['INPROCESS'][i]['POINT'].toString()
                  : '',
              PCS: databuff[0]['INPROCESS'][i]['PCS'] != null
                  ? databuff[0]['INPROCESS'][i]['PCS'].toString()
                  : '',
              FREQUENCY: databuff[0]['INPROCESS'][i]['FREQUENCY'] != null
                  ? databuff[0]['INPROCESS'][i]['FREQUENCY'].toString()
                  : '',
              MODE: databuff[0]['INPROCESS'][i]['MODE'] != null
                  ? databuff[0]['INPROCESS'][i]['MODE'].toString()
                  : '',
              // REMARK: databuff[0]['INPROCESS'][i]['REMARK'] != null
              //     ? databuff[0]['INPROCESS'][i]['REMARK'].toString()
              //     : '',
              REMARK: COMMENT,
              LOAD: databuff[0]['INPROCESS'][i]['LOAD'] != null
                  ? databuff[0]['INPROCESS'][i]['LOAD'].toString()
                  : '',

              SWreport: databuff[0]['INPROCESS'][i]['SWreport'] != null
                  ? databuff[0]['INPROCESS'][i]['SWreport'].toString()
                  : '',
              K1b: databuff[0]['INPROCESS'][i]['K1b'] != null
                  ? databuff[0]['INPROCESS'][i]['K1b'].toString()
                  : '',
              K1v: databuff[0]['INPROCESS'][i]['K1v'] != null
                  ? databuff[0]['INPROCESS'][i]['K1v'].toString()
                  : '',

              CONVERSEDATA: databuff[0]['INPROCESS'][i]['CONVERSEDATA'] != null
                  ? databuff[0]['INPROCESS'][i]['CONVERSEDATA'].toString()
                  : '',
              SUMdata: databuff[0]['INPROCESS'][i]['SUMDATA'] != null
                  ? databuff[0]['INPROCESS'][i]['SUMDATA'].toString()
                  : '',

              SUMdataTable: databuff[0]['INPROCESS'][i]['SUMdataTable'] != null
                  ? databuff[0]['INPROCESS'][i]['SUMdataTable'].toString()
                  : '',
              SUMdataResult:
                  databuff[0]['INPROCESS'][i]['SUMdataResult'] != null
                      ? databuff[0]['INPROCESS'][i]['SUMdataResult'].toString()
                      : '',
              SUMdataDetail:
                  databuff[0]['INPROCESS'][i]['SUMdataDetail'] != null
                      ? databuff[0]['INPROCESS'][i]['SUMdataDetail'].toString()
                      : '',

              SRAWDATA: databuff[0]['INPROCESS'][i]['SRAWDATA'] != null
                  ? databuff[0]['INPROCESS'][i]['SRAWDATA'].toString()
                  : '',

              AQL: databuff[0]['INPROCESS'][i]['AQL'] != null
                  ? databuff[0]['INPROCESS'][i]['AQL'].toString()
                  : '',
              AQLV: databuff[0]['INPROCESS'][i]['AQLV'] != null
                  ? databuff[0]['INPROCESS'][i]['AQLV'].toString()
                  : '',

              CONIP: databuff[0]['INPROCESS'][i]['CONIP'] != null
                  ? databuff[0]['INPROCESS'][i]['CONIP'].toString()
                  : '',
              CONIPITEMNAME: findITEMs_FNconv(
                  databuff[0]['INPROCESS'][i]['CONIPITEM'] != null
                      ? databuff[0]['INPROCESS'][i]['CONIPITEM'].toString()
                      : ''),
              CONIPITEM: databuff[0]['INPROCESS'][i]['CONIPITEM'] != null
                  ? databuff[0]['INPROCESS'][i]['CONIPITEM'].toString()
                  : '',

              CONIPITEMVAR: databuff[0]['INPROCESS'][i]['CONIPITEMVAR'] != null
                  ? databuff[0]['INPROCESS'][i]['CONIPITEMVAR'].toString()
                  : '',
            ),
          );
        }
      }
      //
      String picHold = databuff[0]['Pimg'] != null
          ? databuff[0]['Pimg']['P1'] != null
              ? databuff[0]['Pimg']['P1'].toString()
              : ''
          : '';
      List<String> picHoldList = picHold.split(",");
      if (picHoldList.length > 1) {
        output.Pimg = picHoldList[1];
      }
    }

    Navigator.pop(P6P6InspectionSTDNmaincontext);
    emit(output);
  }

  Future<void> _P6FINSPECTIONget_FLUSH(
      P6InspectionSTD toAdd, Emitter<P6InspectionSTD> emit) async {
    P6InspectionSTD output = P6InspectionSTD(
      INCOMMING: [],
      INPROCESS: [],
      FINAL: [],
    );
    emit(output);
  }
}

class P6InspectionSTD {
  P6InspectionSTD({
    this.status = '',
    this.MATCP = '',
    this.FG = '',
    this.CUSTOMER = '',
    this.PART = '',
    this.PARTNAME = '',
    this.MATERIAL = '',
    //-------------------------------
    required this.INCOMMING,
    required this.INPROCESS,
    required this.FINAL,
    //-------------------------------
    this.Pimg = '',
    this.CUST_FULLNM = '',
  });
  String status;
  String MATCP;
  String FG;
  String CUSTOMER;
  String PART;
  String PARTNAME;
  String MATERIAL;
  //-------------------------------
  List<speckSTD> INCOMMING;
  List<speckSTD> INPROCESS;
  List<speckSTD> FINAL;
  //-------------------------------
  String Pimg;
  String CUST_FULLNM;
}

class speckSTD {
  speckSTD({
    this.seq = '',
    this.TYPE = '',
    this.TYPEname = '',
    this.ITEMs = '',
    this.ITEMsname = '',
    this.RESULTFORMAT = '',
    this.GRAPHTYPE = '',
    this.INTERSECTION = '',
    this.DOCUMENT = '',
    this.SCMARK = '',
    this.METHOD = '',
    this.METHODname = '',
    this.INSTRUMENTS = '',
    this.SPECIFICATION = '',
    this.SPECIFICATIONstr = '',
    this.SPECIFICATIONve = '',
    this.SPECIFICATIONcondition = '',
    this.SPECIFICATIONBTW_LOW = '',
    this.SPECIFICATIONBTW_HI = '',
    this.SPECIFICATIONHIM_L = '',
    this.SPECIFICATIONLOL_H = '',
    this.SPECIFICATIONTARGET = '',
    this.SPECIFICATIONvename = '',
    this.UNIT = '-',
    this.UNITname = '-',
    this.CONVERSE = '-',
    this.CONVERSEname = '-',
    // this.POINTPCS = '',
    // this.POSITION = '',
    this.POINT = '',
    this.PCS = '',
    this.FREQUENCY = '',
    this.FREQUENCYname = '',
    this.MODE = '',
    this.REMARK = '',
    this.LOAD = '',
    this.SWreport = '',
    this.K1b = '',
    this.K1v = '',
    this.CONVERSEDATA = '',
    this.SUMdata = '',
    this.SUMdataTable = '',
    this.SUMdataResult = '',
    this.SUMdataDetail = '',
    this.SRAWDATA = '',
    this.AQL = '',
    this.AQLV = '',
    this.CONIP = '',
    this.CONIPITEMNAME = '',
    this.CONIPITEM = '',
    this.CONIPITEMVAR = '',
    this.VARX = '',
    this.VARY = '',
    this.VARZ = '',
    this.VARI = '',
    this.shape = '',
  });

  String seq;
  String TYPE;
  String TYPEname;
  String ITEMs;
  String ITEMsname;
  String RESULTFORMAT;
  String GRAPHTYPE;
  String INTERSECTION;
  String DOCUMENT;
  String SCMARK;
  String METHOD;
  String METHODname;
  String INSTRUMENTS;
  String SPECIFICATION;
  String SPECIFICATIONstr;
  String SPECIFICATIONve;
  String SPECIFICATIONcondition;
  String SPECIFICATIONBTW_LOW;
  String SPECIFICATIONBTW_HI;
  String SPECIFICATIONHIM_L;
  String SPECIFICATIONLOL_H;
  String SPECIFICATIONTARGET;
  String SPECIFICATIONvename;
  String UNIT;
  String UNITname;
  String CONVERSE;
  String CONVERSEname;
  // String POINTPCS;
  // String POSITION;
  String POINT;
  String PCS;
  String FREQUENCY;
  String FREQUENCYname;
  String MODE;
  String REMARK;
  String LOAD;

  String SWreport;
  String K1b;
  String K1v;

  String CONVERSEDATA;
  String SUMdata;
  String SUMdataTable;
  String SUMdataResult;
  String SUMdataDetail;
  String SRAWDATA;

  String AQL;
  String AQLV;

  String CONIP;
  String CONIPITEMNAME;
  String CONIPITEM;
  String CONIPITEMVAR;

  String VARX;
  String VARY;
  String VARZ;
  String VARI;
  String shape;
}

class BasicBodyData {
  BasicBodyData({
    this.NAME = '',
    this.masterID = '',
  });
  String NAME;
  String masterID;
}

jsonStringToMap(String data) {
  List<String> str = data
      .replaceAll("{", "")
      .replaceAll("}", "")
      .replaceAll("\"", "")
      .replaceAll("'", "")
      .split(",");
  Map<String, dynamic> result = {};
  for (int i = 0; i < str.length; i++) {
    List<String> s = str[i].split(":");
    result.putIfAbsent(s[0].trim(), () => s[1].trim());
  }
  return result;
}
