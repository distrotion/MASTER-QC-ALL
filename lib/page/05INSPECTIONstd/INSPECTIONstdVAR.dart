class INSPECTIONstdVAR {
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
  //copypo

  //----------------------------
  static List<MapEntry<String, String>> List_INCOMMING_ITEMs = [
    MapEntry("-", "-")
  ];
  static List<List_INCOMMING_ITEMs_set_Class> List_INCOMMING_ITEMs_set = [];
  static List<MapEntry<String, String>> List_INCOMMING_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_INCOMMING_METHOD = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_LOAD = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_GT = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_UNIT = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_UNIT_CONVERST = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_FREQUENCY = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_IMGreaddata = YESNO;
  static List<MapEntry<String, String>> List_INCOMMING_SWreport = YESNO;
  static List<MapEntry<String, String>> List_INCOMMING_IMGno = NUM14;
  static List<MapEntry<String, String>> List_INCOMMING_CORETYPE = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_CALCULATE = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_INCOMMING_SPECIFICATIONt = [
    MapEntry("-", "-")
  ];

  static List<MapEntry<String, String>> List_INCOMMING_COMMENT = [
    MapEntry("-", "-")
  ];
  //----------------------------
  static List<MapEntry<String, String>> List_FINAL_ITEMs = [MapEntry("-", "-")];
  static List<List_FINAL_ITEMs_set_Class> List_FINAL_ITEMs_set = [];
  static List<MapEntry<String, String>> List_FINAL_SCMARK = YESNO;
  static List<MapEntry<String, String>> List_FINAL_METHOD = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_LOAD = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_FINAL_GT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_FINAL_UNIT = [MapEntry("-", "-")];
  static List<MapEntry<String, String>> List_FINAL_UNIT_CONVERST = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_FREQUENCY = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_IMGreaddata = MethodePIC;
  static List<MapEntry<String, String>> List_FINAL_SWreport = YESNO;
  static List<MapEntry<String, String>> List_FINAL_IMGno = NUM14;
  static List<MapEntry<String, String>> List_FINAL_CORETYPE = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_CALCULATE = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_SPECIFICATIONt = [
    MapEntry("-", "-")
  ];
  static List<MapEntry<String, String>> List_FINAL_COMMENT = [
    MapEntry("-", "-")
  ];
  //------------------------------------------------------------------------------------ List_INCOMMING_SPECIFICATIONt

  static String INCOMMING_seq = "-";
  static String INCOMMING_ITEMs = "-";
  static String INCOMMING_TYPE = "";
  static String INCOMMING_RESULTFORMAT = "";
  static String INCOMMING_GRAPHTYPE = "";
  static String INCOMMING_INTERSECTION = "";
  static String INCOMMING_COREtype = "-";
  static String INCOMMING_FORMULA = "-";
  static String INCOMMING_SCMARK = "-";
  static String INCOMMING_SCMARKtype = "-";
  static String INCOMMING_DOCUMENT = "-";
  static String INCOMMING_METHOD = "-";
  static String INCOMMING_IMGreaddata = "-";
  static String INCOMMING_IMGno = "-";
  static String INCOMMING_LOAD = "-";
  static String INCOMMING_GT = "-";
  static String INCOMMING_SPECIFICATION = "-";
  static String INCOMMING_SPECIFICATIONstr = "-";
  static String INCOMMING_SPECIFICATIONve = "-";
  static veOB INCOMMING_SPECIFICATIONveOB = veOB();
  static String INCOMMING_UNIT = "-";
  static String INCOMMING_UNIT_CONVERST = "-";
  // static String INCOMMING_POINTPCS = "-";
  static String INCOMMING_POINT = "";
  static String INCOMMING_PCS = "";
  static String INCOMMING_FREQUENCY = "-";
  static String INCOMMING_REMARK = "-";
  static String INCOMMING_RESULTFORMATdata = "-";
  static String INCOMMING_SWreport = "-";

  static String INCOMMING_CALCULATE = "-";
  static String INCOMMING_CAL_K1 = "-";
  static String INCOMMING_CAL_K2 = "-";
  static String INCOMMING_CAL_K3 = "-";

  static String INCOMMING_CAL_K1_N = "-";
  static String INCOMMING_CAL_K2_N = "-";
  static String INCOMMING_CAL_K3_N = "-";
  static bool INCOMMING_CAL_K1b = false;
  static bool INCOMMING_CAL_K2b = false;
  static bool INCOMMING_CAL_K3b = false;

  static bool INCOMMING_POP = false;

  static String INCOMMING_K1b = "-";
  static String INCOMMING_K1v = "-";

  //------------------------------------------------------------------------------------ List_FINAL_SPECIFICATIONt

  static String FINAL_seq = "-";
  static String FINAL_ITEMs = "-";
  static String FINAL_K1b = "-";
  static String FINAL_K1v = "-";
  static String FINAL_TYPE = "";
  static String FINAL_RESULTFORMAT = "";
  static String FINAL_GRAPHTYPE = "";
  static String FINAL_INTERSECTION = "";
  static String FINAL_COREtype = "-";
  static String FINAL_FORMULA = "-";
  static String FINAL_SCMARK = "-";
  static String FINAL_SCMARKtype = "-";
  static String FINAL_DOCUMENT = "-";
  static String FINAL_METHOD = "-";
  static String FINAL_IMGreaddata = "-";
  static String FINAL_IMGno = "-";
  static String FINAL_LOAD = "-";
  static String FINAL_GT = "-";
  static String FINAL_SPECIFICATION = "-";
  static String FINAL_SPECIFICATIONstr = "-";
  static String FINAL_SPECIFICATIONve = "-";
  static veOB FINAL_SPECIFICATIONveOB = veOB();
  static String FINAL_UNIT = "-";
  static String FINAL_UNIT_CONVERST = "-";
  // static String FINAL_POINTPCS = "-";
  static String FINAL_POINT = "";
  static String FINAL_PCS = "";
  static String FINAL_FREQUENCY = "-";
  static String FINAL_REMARK = "-";
  static String FINAL_RESULTFORMATdata = "-";
  static String FINAL_SWreport = "YES";

  static String FINAL_CALCULATE = "-";
  static String FINAL_CAL_K1 = "-";
  static String FINAL_CAL_K2 = "-";
  static String FINAL_CAL_K3 = "-";

  static String FINAL_CAL_K1_N = "-";
  static String FINAL_CAL_K2_N = "-";
  static String FINAL_CAL_K3_N = "-";
  static bool FINAL_CAL_K1b = false;
  static bool FINAL_CAL_K2b = false;
  static bool FINAL_CAL_K3b = false;

  static bool FINAL_POP = false;

  static String CALCULATEp = "-";

  static String PICUPLOAD = "";

  static String TEXTTYPE = "-";

  //------------------------------------------------------------------------------------

  //  print(FPint);
  //   print(LPint);

  static int FPint = 0;
  static int LPint = 0;
}

class veOB {
  veOB({
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

const List<MapEntry<String, String>> NUM14 = [
  MapEntry("-", "-"),
  MapEntry("1", "1"),
  MapEntry("2", "2"),
  MapEntry("3", "3"),
  MapEntry("4", "4"),
];

const List<MapEntry<String, String>> YESNO = [
  MapEntry("-", "-"),
  MapEntry("YES", "YES"),
  MapEntry("NO", "NO"),
];

const List<MapEntry<String, String>> MethodePIC = [
  MapEntry("-", "-"),
  MapEntry("Attack Pic.", "YES"),
  MapEntry("NO Picture", "NO"),
];

const List<MapEntry<String, String>> specset = [
  MapEntry("-", "-"),
  MapEntry("BTW", "BTW"),
  MapEntry("LOL(<)", "LOL(<)"),
  MapEntry("HIM(>)", "HIM(>)"),
  MapEntry("Actual", "Actual"),
];

clearFINAL() {
  INSPECTIONstdVAR.iscontrol = true;
  //
  INSPECTIONstdVAR.FINAL_seq = "0";
  INSPECTIONstdVAR.FINAL_ITEMs = "-";
  INSPECTIONstdVAR.FINAL_K1b = "-";
  INSPECTIONstdVAR.FINAL_K1v = "-";
  INSPECTIONstdVAR.FINAL_TYPE = "";
  INSPECTIONstdVAR.FINAL_RESULTFORMAT = "";
  INSPECTIONstdVAR.FINAL_GRAPHTYPE = "";
  INSPECTIONstdVAR.FINAL_INTERSECTION = "";
  INSPECTIONstdVAR.FINAL_COREtype = "-";
  INSPECTIONstdVAR.FINAL_FORMULA = "-";
  INSPECTIONstdVAR.FINAL_SCMARK = "-";
  INSPECTIONstdVAR.FINAL_SCMARKtype = "-";
  INSPECTIONstdVAR.FINAL_DOCUMENT = "-";
  INSPECTIONstdVAR.FINAL_METHOD = "-";
  INSPECTIONstdVAR.FINAL_IMGreaddata = "-";
  INSPECTIONstdVAR.FINAL_IMGno = "-";
  INSPECTIONstdVAR.FINAL_LOAD = "-";
  INSPECTIONstdVAR.FINAL_GT = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATION = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONstr = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONve = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB = veOB();
  INSPECTIONstdVAR.FINAL_UNIT = "-";
  INSPECTIONstdVAR.FINAL_UNIT_CONVERST = "-";
  // INSPECTIONstdVAR.FINAL_POINTPCS = "-";
  INSPECTIONstdVAR.FINAL_POINT = "";
  INSPECTIONstdVAR.FINAL_PCS = "";
  INSPECTIONstdVAR.FINAL_FREQUENCY = "-";
  INSPECTIONstdVAR.FINAL_REMARK = "-";
  INSPECTIONstdVAR.FINAL_RESULTFORMATdata = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition = "-";

  INSPECTIONstdVAR.FINAL_CAL_K1_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K2_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K3_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K1b = false;
  INSPECTIONstdVAR.FINAL_CAL_K2b = false;
  INSPECTIONstdVAR.FINAL_CAL_K3b = false;
  //--------------------------------------------------
  INSPECTIONstdVAR.List_FINAL_ITEMs = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_ITEMs_set = [];
  INSPECTIONstdVAR.List_FINAL_SCMARK = YESNO;
  INSPECTIONstdVAR.List_FINAL_METHOD = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_LOAD = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_GT = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_UNIT = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_UNIT_CONVERST = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_FREQUENCY = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_IMGreaddata = YESNO;
  INSPECTIONstdVAR.List_FINAL_SWreport = YESNO;
  INSPECTIONstdVAR.List_FINAL_IMGno = NUM14;
  INSPECTIONstdVAR.List_FINAL_CORETYPE = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_CALCULATE = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_FINAL_SPECIFICATIONt = [MapEntry("-", "-")];

  INSPECTIONstdVAR.List_FINAL_COMMENT = [MapEntry("-", "-")];
}

clearINCOMMING() {
  INSPECTIONstdVAR.iscontrol = true;
  //
  INSPECTIONstdVAR.INCOMMING_seq = "0";
  INSPECTIONstdVAR.INCOMMING_ITEMs = "-";
  INSPECTIONstdVAR.INCOMMING_TYPE = "";
  INSPECTIONstdVAR.INCOMMING_RESULTFORMAT = "";
  INSPECTIONstdVAR.INCOMMING_GRAPHTYPE = "";
  INSPECTIONstdVAR.INCOMMING_INTERSECTION = "";
  INSPECTIONstdVAR.INCOMMING_COREtype = "-";
  INSPECTIONstdVAR.INCOMMING_FORMULA = "-";
  INSPECTIONstdVAR.INCOMMING_SCMARK = "-";
  INSPECTIONstdVAR.INCOMMING_SCMARKtype = "-";
  INSPECTIONstdVAR.INCOMMING_DOCUMENT = "-";
  INSPECTIONstdVAR.INCOMMING_METHOD = "-";
  INSPECTIONstdVAR.INCOMMING_IMGreaddata = "-";
  INSPECTIONstdVAR.INCOMMING_IMGno = "-";
  INSPECTIONstdVAR.INCOMMING_LOAD = "-";
  INSPECTIONstdVAR.INCOMMING_GT = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATION = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONstr = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONve = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB = veOB();
  INSPECTIONstdVAR.INCOMMING_UNIT = "-";
  INSPECTIONstdVAR.INCOMMING_UNIT_CONVERST = "-";
  // INSPECTIONstdVAR.INCOMMING_POINTPCS = "-";
  INSPECTIONstdVAR.INCOMMING_POINT = "";
  INSPECTIONstdVAR.INCOMMING_PCS = "";
  INSPECTIONstdVAR.INCOMMING_FREQUENCY = "-";
  INSPECTIONstdVAR.INCOMMING_REMARK = "-";
  INSPECTIONstdVAR.INCOMMING_RESULTFORMATdata = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.condition = "-";

  INSPECTIONstdVAR.INCOMMING_CAL_K1_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K2_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K3_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K1b = false;
  INSPECTIONstdVAR.INCOMMING_CAL_K2b = false;
  INSPECTIONstdVAR.INCOMMING_CAL_K3b = false;
  //--------------------------------------------------
  INSPECTIONstdVAR.List_INCOMMING_ITEMs = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_ITEMs_set = [];
  INSPECTIONstdVAR.List_INCOMMING_SCMARK = YESNO;
  INSPECTIONstdVAR.List_INCOMMING_METHOD = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_LOAD = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_GT = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_UNIT = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_UNIT_CONVERST = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_FREQUENCY = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_IMGreaddata = YESNO;
  INSPECTIONstdVAR.List_INCOMMING_SWreport = YESNO;
  INSPECTIONstdVAR.List_INCOMMING_IMGno = NUM14;
  INSPECTIONstdVAR.List_INCOMMING_CORETYPE = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_CALCULATE = [MapEntry("-", "-")];
  INSPECTIONstdVAR.List_INCOMMING_SPECIFICATIONt = [MapEntry("-", "-")];
}

newdataFINAL() {
  INSPECTIONstdVAR.FINAL_seq = "0";
  INSPECTIONstdVAR.FINAL_ITEMs = "-";
  INSPECTIONstdVAR.FINAL_TYPE = "";
  INSPECTIONstdVAR.FINAL_RESULTFORMAT = "";
  INSPECTIONstdVAR.FINAL_GRAPHTYPE = "";
  INSPECTIONstdVAR.FINAL_INTERSECTION = "";
  INSPECTIONstdVAR.FINAL_COREtype = "-";
  INSPECTIONstdVAR.FINAL_FORMULA = "-";
  INSPECTIONstdVAR.FINAL_SCMARK = "-";
  INSPECTIONstdVAR.FINAL_SCMARKtype = "-";
  INSPECTIONstdVAR.FINAL_DOCUMENT = "-";
  INSPECTIONstdVAR.FINAL_METHOD = "-";
  INSPECTIONstdVAR.FINAL_IMGreaddata = "-";
  INSPECTIONstdVAR.FINAL_IMGno = "-";
  INSPECTIONstdVAR.FINAL_LOAD = "-";
  INSPECTIONstdVAR.FINAL_GT = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATION = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONve = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONstr = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB = veOB();
  INSPECTIONstdVAR.FINAL_UNIT = "-";
  INSPECTIONstdVAR.FINAL_UNIT_CONVERST = "-";
  // INSPECTIONstdVAR.FINAL_POINTPCS = "-";
  INSPECTIONstdVAR.FINAL_POINT = "";
  INSPECTIONstdVAR.FINAL_PCS = "";
  INSPECTIONstdVAR.FINAL_FREQUENCY = "-";
  INSPECTIONstdVAR.FINAL_REMARK = "-";
  INSPECTIONstdVAR.FINAL_RESULTFORMATdata = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.condition = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_HI = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.BTW_LOW = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.HIM_L = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.LOL_H = "-";
  INSPECTIONstdVAR.FINAL_SPECIFICATIONveOB.TARGET = "-";

  INSPECTIONstdVAR.FINAL_CAL_K1_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K2_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K3_N = "-";
  INSPECTIONstdVAR.FINAL_CAL_K1b = false;
  INSPECTIONstdVAR.FINAL_CAL_K2b = false;
  INSPECTIONstdVAR.FINAL_CAL_K3b = false;
  if (INSPECTIONstdVAR.FINAL_POP) {
    INSPECTIONstdVAR.FINAL_POP = false;
  } else {
    INSPECTIONstdVAR.FINAL_POP = true;
  }
}

newdataINCOMMING() {
  INSPECTIONstdVAR.INCOMMING_seq = "0";
  INSPECTIONstdVAR.INCOMMING_ITEMs = "-";
  INSPECTIONstdVAR.INCOMMING_TYPE = "";
  INSPECTIONstdVAR.INCOMMING_RESULTFORMAT = "";
  INSPECTIONstdVAR.INCOMMING_GRAPHTYPE = "";
  INSPECTIONstdVAR.INCOMMING_INTERSECTION = "";
  INSPECTIONstdVAR.INCOMMING_COREtype = "-";
  INSPECTIONstdVAR.INCOMMING_FORMULA = "-";
  INSPECTIONstdVAR.INCOMMING_SCMARK = "-";
  INSPECTIONstdVAR.INCOMMING_SCMARKtype = "-";
  INSPECTIONstdVAR.INCOMMING_DOCUMENT = "-";
  INSPECTIONstdVAR.INCOMMING_METHOD = "-";
  INSPECTIONstdVAR.INCOMMING_IMGreaddata = "-";
  INSPECTIONstdVAR.INCOMMING_IMGno = "-";
  INSPECTIONstdVAR.INCOMMING_LOAD = "-";
  INSPECTIONstdVAR.INCOMMING_GT = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATION = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONve = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONstr = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB = veOB();
  INSPECTIONstdVAR.INCOMMING_UNIT = "-";
  INSPECTIONstdVAR.INCOMMING_UNIT_CONVERST = "-";
  // INSPECTIONstdVAR.INCOMMING_POINTPCS = "-";
  INSPECTIONstdVAR.INCOMMING_POINT = "";
  INSPECTIONstdVAR.INCOMMING_PCS = "";
  INSPECTIONstdVAR.INCOMMING_FREQUENCY = "-";
  INSPECTIONstdVAR.INCOMMING_REMARK = "-";
  INSPECTIONstdVAR.INCOMMING_RESULTFORMATdata = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.condition = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.BTW_HI = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.BTW_LOW = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.HIM_L = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.LOL_H = "-";
  INSPECTIONstdVAR.INCOMMING_SPECIFICATIONveOB.TARGET = "-";

  INSPECTIONstdVAR.INCOMMING_CAL_K1_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K2_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K3_N = "-";
  INSPECTIONstdVAR.INCOMMING_CAL_K1b = false;
  INSPECTIONstdVAR.INCOMMING_CAL_K2b = false;
  INSPECTIONstdVAR.INCOMMING_CAL_K3b = false;
  if (INSPECTIONstdVAR.INCOMMING_POP) {
    INSPECTIONstdVAR.INCOMMING_POP = false;
  } else {
    INSPECTIONstdVAR.INCOMMING_POP = true;
  }
}

class speckSTD {
  speckSTD({
    this.seq = "-",
    this.TYPE = "-",
    this.TYPEname = "-",
    this.ITEMs = "-",
    this.ITEMsname = "-",
    this.RESULTFORMAT = "-",
    this.GRAPHTYPE = "-",
    this.INTERSECTION = "-",
    this.DOCUMENT = "-",
    this.SCMARK = "-",
    this.METHOD = "-",
    this.METHODname = "-",
    this.INSTRUMENTS = "-",
    this.SPECIFICATION = "-",
    this.SPECIFICATIONve = "-",
    this.SPECIFICATIONvename = "-",
    this.UNIT = "-",
    this.UNITname = "-",
    this.CONVERSE = "-",
    this.CONVERSEname = "-",
    this.POINTPCS = "-",
    this.POINT = "-",
    this.PCS = "-",
    this.FREQUENCY = "-",
    this.FREQUENCYname = "-",
    this.MODE = "-",
    this.REMARK = "-",
    this.LOAD = "-",
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
  String SPECIFICATIONve;
  String SPECIFICATIONvename;
  String UNIT;
  String UNITname;
  String CONVERSE;
  String CONVERSEname;
  String POINTPCS;
  String POINT;
  String PCS;
  String FREQUENCY;
  String FREQUENCYname;
  String MODE;
  String REMARK;
  String LOAD;
}

class List_FINAL_ITEMs_set_Class {
  List_FINAL_ITEMs_set_Class({
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

class List_INCOMMING_ITEMs_set_Class {
  List_INCOMMING_ITEMs_set_Class({
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
