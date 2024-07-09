import 'package:dio/dio.dart';

import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//print(databuff[0]['FINAL']);
//--------------------

//--------------------

Future<dynamic> P6INSPECTION_FINAL_GET_STEP1(String CP) async {
  final response = await Dio().post(
    serverGB + "INSPECTION_FINAL_GET_STEP1",
    data: {
      "MATCP": CP,
    },
  );
  var databuff;
  if (response.statusCode == 200) {
    databuff = response.data;
  }
  return databuff;
}

Future<dynamic> P6INSPECTION_FINAL_GET_STEP2(String ITEMs) async {
  var databuff;

  final response = await Dio().post(
    serverGB + "INSPECTION_FINAL_GET_STEP2",
    data: {
      "ITEMs": ITEMs,
    },
  );

  if (response.statusCode == 200) {
    databuff = response.data;
  }

  return databuff;
}

Future<dynamic> P6INSPECTION_INCOMMING_GET_STEP1(String CP) async {
  final response = await Dio().post(
    serverGB + "INSPECTION_INCOMMING_GET_STEP1",
    data: {
      "MATCP": CP,
    },
  );
  var databuff;
  if (response.statusCode == 200) {
    databuff = response.data;
  }
  return databuff;
}

Future<dynamic> P6INSPECTION_INCOMMING_GET_STEP2(String ITEMs) async {
  var databuff;

  final response = await Dio().post(
    serverGB + "INSPECTION_INCOMMING_GET_STEP2",
    data: {
      "ITEMs": ITEMs,
    },
  );

  if (response.statusCode == 200) {
    databuff = response.data;
  }

  return databuff;
}

Future<dynamic> P6INSPECTION_INPROCESS_GET_STEP1(String CP) async {
  final response = await Dio().post(
    serverGB + "INSPECTION_INPROCESS_GET_STEP1",
    data: {
      "MATCP": CP,
    },
  );
  var databuff;
  if (response.statusCode == 200) {
    databuff = response.data;
  }
  return databuff;
}

Future<dynamic> P6INSPECTION_INPROCESS_GET_STEP2(String ITEMs) async {
  var databuff;

  final response = await Dio().post(
    serverGB + "INSPECTION_INPROCESS_GET_STEP2",
    data: {
      "ITEMs": ITEMs,
    },
  );

  if (response.statusCode == 200) {
    databuff = response.data;
  }

  return databuff;
}

Future<dynamic> P6COPYDATA(String CP_MASTER, String CP_NEW) async {
  final response = await Dio().post(
    serverGB + "copy_cp",
    data: {
      "CP_MASTER": CP_MASTER,
      "CP_NEW": CP_NEW,
    },
  );
  var databuff;
  if (response.statusCode == 200) {
    databuff = response.data;
    print(databuff);
    if (databuff['msg'] != null) {
      if (databuff['msg'].toString() == 'OK') {
        BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
            "msg", "data update", enumNotificationlist.Success);
      } else {
        BlocProvider.of<BlocNotification>(contextGB)
            .UpdateNotification("msg", "Error", enumNotificationlist.Error);
      }
    } else {
      BlocProvider.of<BlocNotification>(contextGB)
          .UpdateNotification("msg", "Error", enumNotificationlist.Error);
    }
  }
  return databuff;
}
