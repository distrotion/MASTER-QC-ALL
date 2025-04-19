import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/LoginEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../page/page1.dart';
import '../../page/page10.dart';
import '../../page/page11.dart';
import '../../page/page2.dart';
import '../../page/page3.dart';
import '../../page/page4.dart';
import '../../page/page5.dart';
import '../../page/page6.dart';
import 'sub_widget.dart';

late BuildContext MenuContext;
bool menupop = false;

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    MenuContext = context;
    //---------------------------------------------------------------

    return Container(
      height: (MediaQuery.of(context).size.height),
      // width: MediaQuery.of(context).size.width,
      width: 200,
      color: const Color(0xff0b1327),
      //color: Colors.red,
      child: ListView(
        children: [
          Center(
            child: Data_Menu_mainmenu(),
          )
        ],
      ),
    );
  }
}

class Data_Menu_mainmenu extends StatefulWidget {
  @override
  State<Data_Menu_mainmenu> createState() => _Data_Menu_mainmenuState();
}

class _Data_Menu_mainmenuState extends State<Data_Menu_mainmenu> {
  //const Data_Menu_mainmenu({Key? key},this.pagein) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(USERDATA.UserLV);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //Axis-Y
      crossAxisAlignment: CrossAxisAlignment.center, //Axis-X

      children: [
        const SizedBox(
          height: 20,
        ),
        // Align(
        //     alignment: Alignment.center,
        //     child: Container(
        //         height: 40,
        //         width: 180,
        //         color: Colors.white,
        //         child: Padding(
        //           padding: const EdgeInsetsDirectional.all(1),
        //           child: Container(
        //             height: 35,
        //             decoration: const BoxDecoration(
        //               color: Colors.white,
        //               image: DecorationImage(
        //                 image: AssetImage("assets/images/logo_tpk.png"),
        //                 fit: BoxFit.fitHeight,
        //               ),
        //             ),
        //           ),
        //         ))),
        // menu_normal(
        //   name: "Page1",
        //   page: Page1(),
        //   Lv: 1,
        // ),
        if (serverGB != '') ...[
          if (USERDATA.UserLV > 51) ...[
            InkWell(
              onTap: () {
                setState(() {
                  if (menupop) {
                    menupop = false;
                  } else {
                    menupop = true;
                  }
                });
              },
              child: SizedBox(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 6.0, left: 6, top: 4.0, bottom: 4.0),
                        child: Container(
                          height: 24,
                          width: 24,
                          child: Icon(
                            menupop
                                ? Icons.arrow_drop_up_outlined
                                : Icons.arrow_drop_down_outlined,
                            color: Colors.white,
                          ),
                          // decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //         image: AssetImage(getShowHidePassword_ImgPath()),
                          //         fit: BoxFit.fitHeight))
                        ),
                      ),
                      const Text(
                        "MASTER MENU",
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (menupop) ...[
              menu_sub(
                name: "INCOMMING",
                page: Page1(),
                Lv: 1,
              ),
              menu_sub(
                name: "INPROCESS",
                page: Page3(),
                Lv: 1,
              ),
              menu_sub(
                name: "FINAL",
                page: Page2(),
                Lv: 1,
              ),
            ],
          ],

          // menu_normal(
          //   name: "Page3",
          //   page: Page3(),
          //   Lv: 1,
          // ),
          // menu_normal(
          //   name: "MATCP",
          //   page: Page4(),
          //   Lv: 1,
          // ),
          menu_normal(
            name: "MATCP",
            page: Page4(),
            Lv: 1,
          ),
          menu_normal(
            name: "INSPECTION STD",
            page: Page6(),
            Lv: 1,
          ),
          menu_normal(
            name: "Signature",
            page: Page11(),
            Lv: 1,
          ),
          // menu_normal(
          //   colorsetup: Colors.blue,
          //   name: "SC MARK SETUP",
          //   page: Page10(),
          //   Lv: 1,
          // ),
          // menu_normal(
          //   colorsetup: Colors.blue,
          //   name: "Frequency control",
          //   page: Page10(),
          //   Lv: 1,
          // ),
        ],
        menu_normal(
          colorsetup: Colors.blue,
          name: "Select Plant",
          page: Page10(),
          Lv: 1,
        ),
        menu_logout(
          name: "Logout",
        ),
        const Divider(
          color: Color(0x4dffffff),
          height: 12,
        ),
      ],
    );
  }
}

class Logomenu extends StatelessWidget {
  const Logomenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsetsDirectional.all(1),
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo_tpk.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),

      //color: Colors.white,
    );
  }
}

class menu_logout extends StatelessWidget {
  menu_logout({Key? key, this.name}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        LoginContext.read<Login_Bloc>().add(Logout());
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        // CuPage = page;
        // CuPageLV = Lv;
        // MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
      },
      child: Container(
        //color: Colors.blue,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 24,
                width: 24,
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  // size: 30.0,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.redAccent.shade400,

                //   // image: DecorationImage(
                //   //   image: AssetImage(""),
                //   //   fit: BoxFit.fitWidth,
                //   // ),
                //   //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                // ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "   " + _name,
                style: const TextStyle(
                  fontFamily: 'Mitr',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// String serverGB = '';

// String serverPHHES = 'http://172.23.10.40:14800/';
// String serverPALHES = 'http://172.23.10.40:14810/';
// //
// String serverPALBP12 = 'http://172.23.10.40:14730/';
// String serverPVDBP12 = 'http://172.23.10.40:14710/';
// String serverKNGBP12 = 'http://172.23.10.40:14720/';
// String serverPHBP12 = 'http://172.23.10.40:14010/';


