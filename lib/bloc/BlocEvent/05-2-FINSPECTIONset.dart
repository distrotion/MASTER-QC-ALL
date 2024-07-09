// import 'package:flutter_bloc/flutter_bloc.dart';

// //-------------------------------------------------

// abstract class FINSPECTIONset_Event {}

// class FINSPECTIONset_PATTERNset extends FINSPECTIONset_Event {}

// class FINSPECTIONset_Flush extends FINSPECTIONset_Event {}

// class FINSPECTIONset_Bloc extends Bloc<FINSPECTIONset_Event, String> {
//   FINSPECTIONset_Bloc() : super('') {
//     on<FINSPECTIONset_PATTERNset>((event, emit) {
//       return _FINSPECTIONset_PATTERNset('', emit);
//     });
//     on<FINSPECTIONset_Flush>((event, emit) {
//       return _FINSPECTIONset_Flush('', emit);
//     });
//   }
//   Future<void> _FINSPECTIONset_PATTERNset(
//       String toAdd, Emitter<String> emit) async {
//     var query = {
//       "CPorder": "",
//       "MASTERdatalist": {
//         "TYPE": "",
//         "RESULTFORMAT": "",
//         "MASTERdatalist": "",
//         "GRAPHTYPE": "",
//         "INTERSECTION": "",
//       },
//       "editedItem_FN": {
//         "SEQ": 0,
//         "ITEMs": '',
//         "DOCUMENT": '',
//         "SCMARK": 'NO',
//         "METHOD": '',
//         "INSTRUMENTS": [],
//         "SPECIFICATION": '',
//         "SPECIFICATIONve": {
//           "condition": '',
//           "BTW_HI": 0,
//           "BTW_LOW": 0,
//           "HIM_L": 0,
//           "LOL_H": 0,
//           "TARGET": '',
//         },
//         "UNIT": '',
//         "POINTPCS": '',
//         "POINT": 0,
//         "PCS": 0,
//         "FREQUENCY": [],
//         "MODE": '',
//         "REMARK": '',
//         "LOAD": '',
//         "CONVERSE": '',
//         "GRAPH_TABLE_FN": ''
//       },
//     };
//     emit('');
//   }

//   Future<void> _FINSPECTIONset_Flush(String toAdd, Emitter<String> emit) async {
//     emit('');
//   }
// }
