class P6INSPECTIONstdNvar_BASIC {
  static bool iscontrol = false;
  static bool ACTION_isEnabled = false;
  //----------------------------
  static String CP = "-";
  static String FG = "-";
  static String CUSTOMER = "-";
  static String PART = "-";
  static String PARTNAME = "-";
  static String MATERIAL = "-";
  static String CUST_FULLNM = "-";

  static String copypo = "-";

  static int FPint = 0;
  static int LPint = 0;
  static String PICUPLOAD = "";
}

// class P6INSPECTIONstdNvar_INPROCESS {
//   static bool iscontrol = false;
//   static bool ACTION_isEnabled = false;
//   //----------------------------
// }

class P6INSPECTIONstdNvar_FINAL {
  static bool iscontrol = false;
  static bool ACTION_isEnabled = false;
  //----------------------------
  static String seq = "-";
  static String ITEMs = "-";
  static String K1b = "-";
  static String K1v = "-";
  static String TYPE = "";
  static String RESULTFORMAT = "";
  static String GRAPHTYPE = "";
  static String INTERSECTION = "";
  static String COREtype = "-";
  static String FORMULA = "-";
  static String SCMARK = "-";
  static String SCMARKTYPE = "-";
  static String DOCUMENT = "-";
  static String METHOD = "-";
  static String IMGreaddata = "-";
  static String IMGno = "-";
  static String LOAD = "-";
  static String GT = "-";
  static String AQL = "-";
  static String AQLV = "-";
  static String SPECIFICATION = "-";
  static String SPECIFICATIONstr = "-";
  static String SPECIFICATIONve = "-";
  static NveOB SPECIFICATIONveOB = NveOB();
  static String UNIT = "-";
  static String UNIT_CONVERST = "-";

  static String CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  static String POINT = "";
  static String PCS = "";
  static String FREQUENCY = "-";
  static String REMARK = "-";
  static String RESULTFORMATdata = "-";
  static String SWreport = "YES";
  static String SUMDATA = "YES";
  static String SUMDATATEXT = "";
  static String SRAWDATA = "YES";

  static String CALCULATE = "-";
  static String CAL_K1 = "-";
  static String CAL_K2 = "-";
  static String CAL_K3 = "-";

  static String CAL_K1_N = "-";
  static String CAL_K2_N = "-";
  static String CAL_K3_N = "-";
  static bool CAL_K1b = false;
  static bool CAL_K2b = false;
  static bool CAL_K3b = false;

  static bool POP = false;
  //----------------------------
  static List<MapEntry<String, String>> List_ITEMs = [MapEntry("-", "-")];
  static List<P6List_ITEMs_SET_Class> List_ITEMs_set = [];
  static List<MapEntry<String, String>> List_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_METHOD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_LOAD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_GT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT_CONVERST = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FREQUENCY = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_IMGreaddata = MethodePIC;
  static List<MapEntry<String, String>> List_SWreport = YESNO;
  static List<MapEntry<String, String>> List_IMGno = NUM14;
  static List<MapEntry<String, String>> List_CORETYPE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_CALCULATE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_SPECIFICATIONt = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_COMMENT = [MapEntry("-", "-")];

  static String CALCULATEp = "-";

  static String TEXTTYPE = "-";
}

class P6INSPECTIONstdNvar_INCOMMING {
  static bool iscontrol = false;
  static bool ACTION_isEnabled = false;
  //----------------------------
  static String seq = "-";
  static String ITEMs = "-";
  static String K1b = "-";
  static String K1v = "-";
  static String TYPE = "";
  static String RESULTFORMAT = "";
  static String GRAPHTYPE = "";
  static String INTERSECTION = "";
  static String COREtype = "-";
  static String FORMULA = "-";
  static String SCMARK = "-";
  static String SCMARKTYPE = "-";
  static String DOCUMENT = "-";
  static String METHOD = "-";
  static String IMGreaddata = "-";
  static String IMGno = "-";
  static String LOAD = "-";
  static String GT = "-";
  static String AQL = "-";
  static String AQLV = "-";
  static String SPECIFICATION = "-";
  static String SPECIFICATIONstr = "-";
  static String SPECIFICATIONve = "-";
  static NveOB SPECIFICATIONveOB = NveOB();
  static String UNIT = "-";
  static String UNIT_CONVERST = "-";

  static String CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  static String POINT = "";
  static String PCS = "";
  static String FREQUENCY = "-";
  static String REMARK = "-";
  static String RESULTFORMATdata = "-";
  static String SWreport = "YES";
  static String SUMDATA = "YES";
  static String SUMDATATEXT = "";
  static String SRAWDATA = "YES";

  static String CALCULATE = "-";
  static String CAL_K1 = "-";
  static String CAL_K2 = "-";
  static String CAL_K3 = "-";

  static String CAL_K1_N = "-";
  static String CAL_K2_N = "-";
  static String CAL_K3_N = "-";
  static bool CAL_K1b = false;
  static bool CAL_K2b = false;
  static bool CAL_K3b = false;

  static bool POP = false;
  //----------------------------
  static List<MapEntry<String, String>> List_ITEMs = [MapEntry("-", "-")];
  static List<P6List_ITEMs_SET_Class> List_ITEMs_set = [];
  static List<MapEntry<String, String>> List_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_METHOD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_LOAD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_GT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT_CONVERST = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FREQUENCY = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_IMGreaddata = MethodePIC;
  static List<MapEntry<String, String>> List_SWreport = YESNO;
  static List<MapEntry<String, String>> List_IMGno = NUM14;
  static List<MapEntry<String, String>> List_CORETYPE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_CALCULATE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_SPECIFICATIONt = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_COMMENT = [MapEntry("-", "-")];

  static String CALCULATEp = "-";

  static String TEXTTYPE = "-";
}

class P6INSPECTIONstdNvar_INPROCESS {
  static bool iscontrol = false;
  static bool ACTION_isEnabled = false;
  //----------------------------
  static String seq = "-";
  static String ITEMs = "-";
  static String K1b = "-";
  static String K1v = "-";
  static String TYPE = "";
  static String RESULTFORMAT = "";
  static String GRAPHTYPE = "";
  static String INTERSECTION = "";
  static String COREtype = "-";
  static String FORMULA = "-";
  static String SCMARK = "-";
  static String SCMARKTYPE = "-";
  static String DOCUMENT = "-";
  static String METHOD = "-";
  static String IMGreaddata = "-";
  static String IMGno = "-";
  static String LOAD = "-";
  static String GT = "-";
  static String AQL = "-";
  static String AQLV = "-";
  static String SPECIFICATION = "-";
  static String SPECIFICATIONstr = "-";
  static String SPECIFICATIONve = "-";
  static NveOB SPECIFICATIONveOB = NveOB();
  static String UNIT = "-";
  static String UNIT_CONVERST = "-";

  static String CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  static String POINT = "";
  static String PCS = "";
  static String FREQUENCY = "-";
  static String REMARK = "-";
  static String RESULTFORMATdata = "-";
  static String SWreport = "YES";
  static String SUMDATA = "YES";
  static String SUMDATATEXT = "";
  static String SRAWDATA = "YES";
  static String CONIP = "NO";
  static String CONIPITEM = "-";
  static String CONIPITEMVAR = "-";

  static String CALCULATE = "-";
  static String CAL_K1 = "-";
  static String CAL_K2 = "-";
  static String CAL_K3 = "-";

  static String CAL_K1_N = "-";
  static String CAL_K2_N = "-";
  static String CAL_K3_N = "-";
  static bool CAL_K1b = false;
  static bool CAL_K2b = false;
  static bool CAL_K3b = false;

  static bool POP = false;
  //----------------------------
  static List<MapEntry<String, String>> List_ITEMs = [MapEntry("-", "-")];
  static List<P6List_ITEMs_SET_Class> List_ITEMs_set = [];
  static List<MapEntry<String, String>> List_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_METHOD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_LOAD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_GT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_UNIT_CONVERST = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FREQUENCY = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_IMGreaddata = MethodePIC;
  static List<MapEntry<String, String>> List_SWreport = YESNO;
  static List<MapEntry<String, String>> List_IMGno = NUM14;
  static List<MapEntry<String, String>> List_CORETYPE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_CALCULATE = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_SPECIFICATIONt = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_COMMENT = [MapEntry("-", "-")];

  static String CALCULATEp = "-";

  static String TEXTTYPE = "-";
}

class P6List_ITEMs_SET_Class {
  P6List_ITEMs_SET_Class({
    this.ITEMs = '',
    this.RESULTFORMAT = '',
    this.TYPE = '',
    this.GRAPHTYPE = '',
    this.INTERSECTION = '',
    this.masterID = '',
  });
  String ITEMs;
  String RESULTFORMAT;
  String TYPE;
  String GRAPHTYPE;
  String INTERSECTION;
  String masterID;
}

const List<MapEntry<String, String>> NUM14 = [
  MapEntry("-", "-"),
  MapEntry("1", "1"),
  MapEntry("2", "2"),
  MapEntry("3", "3"),
  MapEntry("4", "4"),
];

const List<MapEntry<String, String>> MethodePIC = [
  MapEntry("-", "-"),
  MapEntry("Attack Pic.", "YES"),
  MapEntry("NO Picture", "NO"),
];

const List<MapEntry<String, String>> YESNO = [
  MapEntry("-", "-"),
  MapEntry("YES", "YES"),
  MapEntry("NO", "NO"),
];

class NveOB {
  NveOB({
    this.condition = "-",
    this.BTW_HI = "-",
    this.BTW_LOW = "-",
    this.HIM_L = "-",
    this.LOL_H = "-",
    this.TARGET = "-",
  });
  String condition;
  String BTW_HI;
  String BTW_LOW;
  String HIM_L;
  String LOL_H;
  String TARGET;
}

P6ClearFINAL() {
  P6INSPECTIONstdNvar_FINAL.iscontrol = false;
  P6INSPECTIONstdNvar_FINAL.ACTION_isEnabled = false;
  //
  P6INSPECTIONstdNvar_FINAL.seq = "-";
  P6INSPECTIONstdNvar_FINAL.ITEMs = "-";
  P6INSPECTIONstdNvar_FINAL.K1b = "-";
  P6INSPECTIONstdNvar_FINAL.K1v = "-";
  P6INSPECTIONstdNvar_FINAL.TYPE = "";
  P6INSPECTIONstdNvar_FINAL.RESULTFORMAT = "";
  P6INSPECTIONstdNvar_FINAL.GRAPHTYPE = "";
  P6INSPECTIONstdNvar_FINAL.INTERSECTION = "";
  P6INSPECTIONstdNvar_FINAL.COREtype = "-";
  P6INSPECTIONstdNvar_FINAL.FORMULA = "-";
  P6INSPECTIONstdNvar_FINAL.SCMARK = "-";
  P6INSPECTIONstdNvar_FINAL.SCMARKTYPE = "-";
  P6INSPECTIONstdNvar_FINAL.DOCUMENT = "-";
  P6INSPECTIONstdNvar_FINAL.METHOD = "-";
  P6INSPECTIONstdNvar_FINAL.IMGreaddata = "-";
  P6INSPECTIONstdNvar_FINAL.IMGno = "-";
  P6INSPECTIONstdNvar_FINAL.LOAD = "-";
  P6INSPECTIONstdNvar_FINAL.GT = "-";
  P6INSPECTIONstdNvar_FINAL.SPECIFICATION = "-";
  P6INSPECTIONstdNvar_FINAL.SPECIFICATIONstr = "-";
  P6INSPECTIONstdNvar_FINAL.SPECIFICATIONve = "-";
  P6INSPECTIONstdNvar_FINAL.SPECIFICATIONveOB = NveOB();
  P6INSPECTIONstdNvar_FINAL.UNIT = "-";
  P6INSPECTIONstdNvar_FINAL.UNIT_CONVERST = "-";
  P6INSPECTIONstdNvar_FINAL.CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  P6INSPECTIONstdNvar_FINAL.POINT = "";
  P6INSPECTIONstdNvar_FINAL.PCS = "";
  P6INSPECTIONstdNvar_FINAL.FREQUENCY = "-";
  P6INSPECTIONstdNvar_FINAL.REMARK = "-";
  P6INSPECTIONstdNvar_FINAL.RESULTFORMATdata = "-";
  P6INSPECTIONstdNvar_FINAL.SWreport = "YES";
  P6INSPECTIONstdNvar_FINAL.AQL = '-';
  P6INSPECTIONstdNvar_FINAL.AQLV = '-';

  P6INSPECTIONstdNvar_FINAL.SUMDATA = "YES";
  P6INSPECTIONstdNvar_FINAL.SUMDATATEXT = "YES";
  P6INSPECTIONstdNvar_FINAL.SRAWDATA = "YES";

  P6INSPECTIONstdNvar_FINAL.CALCULATE = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K1 = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K2 = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K3 = "-";

  P6INSPECTIONstdNvar_FINAL.CAL_K1_N = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K2_N = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K3_N = "-";
  P6INSPECTIONstdNvar_FINAL.CAL_K1b = false;
  P6INSPECTIONstdNvar_FINAL.CAL_K2b = false;
  P6INSPECTIONstdNvar_FINAL.CAL_K3b = false;

  // P6INSPECTIONstdNvar_FINAL.POP = false;
  //----------------------------
  P6INSPECTIONstdNvar_FINAL.List_ITEMs = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_ITEMs_set = [];
  P6INSPECTIONstdNvar_FINAL.List_SCMARK = YESNO;
  P6INSPECTIONstdNvar_FINAL.List_METHOD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_LOAD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_GT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_UNIT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_UNIT_CONVERST = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_FREQUENCY = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_IMGreaddata = MethodePIC;
  P6INSPECTIONstdNvar_FINAL.List_SWreport = YESNO;
  P6INSPECTIONstdNvar_FINAL.List_IMGno = NUM14;
  P6INSPECTIONstdNvar_FINAL.List_CORETYPE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_CALCULATE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_SPECIFICATIONt = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_FINAL.List_COMMENT = [MapEntry("-", "-")];

  P6INSPECTIONstdNvar_FINAL.CALCULATEp = "-";
  // P6INSPECTIONstdNvar_FINAL.PICUPLOAD = "";
  P6INSPECTIONstdNvar_FINAL.TEXTTYPE = "-";
}

P6ClearINCOMMING() {
  P6INSPECTIONstdNvar_INCOMMING.iscontrol = false;
  P6INSPECTIONstdNvar_INCOMMING.ACTION_isEnabled = false;
  //
  P6INSPECTIONstdNvar_INCOMMING.seq = "-";
  P6INSPECTIONstdNvar_INCOMMING.ITEMs = "-";
  P6INSPECTIONstdNvar_INCOMMING.K1b = "-";
  P6INSPECTIONstdNvar_INCOMMING.K1v = "-";
  P6INSPECTIONstdNvar_INCOMMING.TYPE = "";
  P6INSPECTIONstdNvar_INCOMMING.RESULTFORMAT = "";
  P6INSPECTIONstdNvar_INCOMMING.GRAPHTYPE = "";
  P6INSPECTIONstdNvar_INCOMMING.INTERSECTION = "";
  P6INSPECTIONstdNvar_INCOMMING.COREtype = "-";
  P6INSPECTIONstdNvar_INCOMMING.FORMULA = "-";
  P6INSPECTIONstdNvar_INCOMMING.SCMARK = "-";
  P6INSPECTIONstdNvar_INCOMMING.SCMARKTYPE = "-";
  P6INSPECTIONstdNvar_INCOMMING.DOCUMENT = "-";
  P6INSPECTIONstdNvar_INCOMMING.METHOD = "-";
  P6INSPECTIONstdNvar_INCOMMING.IMGreaddata = "-";
  P6INSPECTIONstdNvar_INCOMMING.IMGno = "-";
  P6INSPECTIONstdNvar_INCOMMING.LOAD = "-";
  P6INSPECTIONstdNvar_INCOMMING.GT = "-";
  P6INSPECTIONstdNvar_INCOMMING.SPECIFICATION = "-";
  P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONstr = "-";
  P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONve = "-";
  P6INSPECTIONstdNvar_INCOMMING.SPECIFICATIONveOB = NveOB();
  P6INSPECTIONstdNvar_INCOMMING.UNIT = "-";
  P6INSPECTIONstdNvar_INCOMMING.UNIT_CONVERST = "-";
  P6INSPECTIONstdNvar_INCOMMING.CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  P6INSPECTIONstdNvar_INCOMMING.POINT = "";
  P6INSPECTIONstdNvar_INCOMMING.PCS = "";
  P6INSPECTIONstdNvar_INCOMMING.FREQUENCY = "-";
  P6INSPECTIONstdNvar_INCOMMING.REMARK = "-";
  P6INSPECTIONstdNvar_INCOMMING.RESULTFORMATdata = "-";
  P6INSPECTIONstdNvar_INCOMMING.SWreport = "YES";
  P6INSPECTIONstdNvar_INCOMMING.AQL = '-';
  P6INSPECTIONstdNvar_INCOMMING.AQLV = '-';

  P6INSPECTIONstdNvar_INCOMMING.SUMDATA = "YES";
  P6INSPECTIONstdNvar_INCOMMING.SUMDATATEXT = "YES";
  P6INSPECTIONstdNvar_INCOMMING.SRAWDATA = "YES";

  P6INSPECTIONstdNvar_INCOMMING.CALCULATE = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K1 = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K2 = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K3 = "-";

  P6INSPECTIONstdNvar_INCOMMING.CAL_K1_N = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K2_N = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K3_N = "-";
  P6INSPECTIONstdNvar_INCOMMING.CAL_K1b = false;
  P6INSPECTIONstdNvar_INCOMMING.CAL_K2b = false;
  P6INSPECTIONstdNvar_INCOMMING.CAL_K3b = false;

  // P6INSPECTIONstdNvar_INCOMMING.POP = false;
  //----------------------------
  P6INSPECTIONstdNvar_INCOMMING.List_ITEMs = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_ITEMs_set = [];
  P6INSPECTIONstdNvar_INCOMMING.List_SCMARK = YESNO;
  P6INSPECTIONstdNvar_INCOMMING.List_METHOD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_LOAD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_GT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_UNIT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_UNIT_CONVERST = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_FREQUENCY = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_IMGreaddata = MethodePIC;
  P6INSPECTIONstdNvar_INCOMMING.List_SWreport = YESNO;
  P6INSPECTIONstdNvar_INCOMMING.List_IMGno = NUM14;
  P6INSPECTIONstdNvar_INCOMMING.List_CORETYPE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_CALCULATE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_SPECIFICATIONt = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INCOMMING.List_COMMENT = [MapEntry("-", "-")];

  P6INSPECTIONstdNvar_INCOMMING.CALCULATEp = "-";
  // P6INSPECTIONstdNvar_INCOMMING.PICUPLOAD = "";
  P6INSPECTIONstdNvar_INCOMMING.TEXTTYPE = "-";
}

P6NewdataFINAL() {
  if (P6INSPECTIONstdNvar_FINAL.POP) {
    P6INSPECTIONstdNvar_FINAL.POP = false;
  } else {
    P6INSPECTIONstdNvar_FINAL.POP = true;
  }
}

P6NewdataINCOMMING() {
  if (P6INSPECTIONstdNvar_INCOMMING.POP) {
    P6INSPECTIONstdNvar_INCOMMING.POP = false;
  } else {
    P6INSPECTIONstdNvar_INCOMMING.POP = true;
  }
}

P6NewdataINPROCESS() {
  if (P6INSPECTIONstdNvar_INPROCESS.POP) {
    P6INSPECTIONstdNvar_INPROCESS.POP = false;
  } else {
    P6INSPECTIONstdNvar_INPROCESS.POP = true;
  }
}

P6ClearINPROCESS() {
  P6INSPECTIONstdNvar_INPROCESS.iscontrol = false;
  P6INSPECTIONstdNvar_INPROCESS.ACTION_isEnabled = false;
  //
  P6INSPECTIONstdNvar_INPROCESS.seq = "-";
  P6INSPECTIONstdNvar_INPROCESS.ITEMs = "-";
  P6INSPECTIONstdNvar_INPROCESS.K1b = "-";
  P6INSPECTIONstdNvar_INPROCESS.K1v = "-";
  P6INSPECTIONstdNvar_INPROCESS.TYPE = "";
  P6INSPECTIONstdNvar_INPROCESS.RESULTFORMAT = "";
  P6INSPECTIONstdNvar_INPROCESS.GRAPHTYPE = "";
  P6INSPECTIONstdNvar_INPROCESS.INTERSECTION = "";
  P6INSPECTIONstdNvar_INPROCESS.COREtype = "-";
  P6INSPECTIONstdNvar_INPROCESS.FORMULA = "-";
  P6INSPECTIONstdNvar_INPROCESS.SCMARK = "-";
  P6INSPECTIONstdNvar_INPROCESS.SCMARKTYPE = "-";
  P6INSPECTIONstdNvar_INPROCESS.DOCUMENT = "-";
  P6INSPECTIONstdNvar_INPROCESS.METHOD = "-";
  P6INSPECTIONstdNvar_INPROCESS.IMGreaddata = "-";
  P6INSPECTIONstdNvar_INPROCESS.IMGno = "-";
  P6INSPECTIONstdNvar_INPROCESS.LOAD = "-";
  P6INSPECTIONstdNvar_INPROCESS.GT = "-";
  P6INSPECTIONstdNvar_INPROCESS.SPECIFICATION = "-";
  P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONstr = "-";
  P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONve = "-";
  P6INSPECTIONstdNvar_INPROCESS.SPECIFICATIONveOB = NveOB();
  P6INSPECTIONstdNvar_INPROCESS.UNIT = "-";
  P6INSPECTIONstdNvar_INPROCESS.UNIT_CONVERST = "-";
  P6INSPECTIONstdNvar_INPROCESS.CONVERSEDATA = "-";
  // static String POINTPCS = "-";
  P6INSPECTIONstdNvar_INPROCESS.POINT = "";
  P6INSPECTIONstdNvar_INPROCESS.PCS = "";
  P6INSPECTIONstdNvar_INPROCESS.FREQUENCY = "-";
  P6INSPECTIONstdNvar_INPROCESS.REMARK = "-";
  P6INSPECTIONstdNvar_INPROCESS.RESULTFORMATdata = "-";
  P6INSPECTIONstdNvar_INPROCESS.SWreport = "YES";
  P6INSPECTIONstdNvar_INPROCESS.AQL = '-';
  P6INSPECTIONstdNvar_INPROCESS.AQLV = '-';

  P6INSPECTIONstdNvar_INPROCESS.SUMDATA = "YES";
  P6INSPECTIONstdNvar_INPROCESS.SUMDATATEXT = "YES";
  P6INSPECTIONstdNvar_INPROCESS.SRAWDATA = "YES";

  P6INSPECTIONstdNvar_INPROCESS.CALCULATE = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K1 = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K2 = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K3 = "-";

  P6INSPECTIONstdNvar_INPROCESS.CAL_K1_N = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K2_N = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K3_N = "-";
  P6INSPECTIONstdNvar_INPROCESS.CAL_K1b = false;
  P6INSPECTIONstdNvar_INPROCESS.CAL_K2b = false;
  P6INSPECTIONstdNvar_INPROCESS.CAL_K3b = false;

  // P6INSPECTIONstdNvar_INCOMMING.POP = false;
  //----------------------------
  P6INSPECTIONstdNvar_INPROCESS.List_ITEMs = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_ITEMs_set = [];
  P6INSPECTIONstdNvar_INPROCESS.List_SCMARK = YESNO;
  P6INSPECTIONstdNvar_INPROCESS.List_METHOD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_LOAD = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_GT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_UNIT = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_UNIT_CONVERST = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_FREQUENCY = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_IMGreaddata = MethodePIC;
  P6INSPECTIONstdNvar_INPROCESS.List_SWreport = YESNO;
  P6INSPECTIONstdNvar_INPROCESS.List_IMGno = NUM14;
  P6INSPECTIONstdNvar_INPROCESS.List_CORETYPE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_CALCULATE = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_SPECIFICATIONt = [MapEntry("-", "-")];
  P6INSPECTIONstdNvar_INPROCESS.List_COMMENT = [MapEntry("-", "-")];

  P6INSPECTIONstdNvar_INPROCESS.CALCULATEp = "-";
  // P6INSPECTIONstdNvar_INCOMMING.PICUPLOAD = "";
  P6INSPECTIONstdNvar_INPROCESS.TEXTTYPE = "-";
}
