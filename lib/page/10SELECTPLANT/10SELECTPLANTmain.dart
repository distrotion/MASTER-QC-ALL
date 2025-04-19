import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Loading.dart';
import '../page4.dart';

class P10SELECTPLANTmain extends StatelessWidget {
  const P10SELECTPLANTmain({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (USERDATA.LOCATIONList.contains("HES-PH") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "HES-PH";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("PH HES"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("HES-PAL") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "HES-PAL";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("PAL HES"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("BP12-PAL") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "BP12-PAL";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("PAL BP12"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("BP12-PVD") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "BP12-PVD";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("PVD BP12"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("BP12-KNG") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "BP12-KNG";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("KNG BP12"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("BP12-PH") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "BP12-PH";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("PH BP12"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("HES-GAS") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "HES-GAS";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("HES GAS"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("GW-GAS") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "GW-GAS";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("GW GAS"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("BP12-GAS") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "BP12-GAS";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("BP12 GAS"),
                    ),
                  ),
                ),
              ),
            ),
          ],
          if (USERDATA.LOCATIONList.contains("HES-ISN") &&
              USERDATA.UserLV >= 5) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  USERDATA.MASTER = "HES-ISN";

                  CuPage = Page4();

                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Container(
                  height: 100,
                  width: 400,
                  color: Colors.blue,
                  child: Center(
                    child: Center(
                      child: Text("HES ISN"),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
