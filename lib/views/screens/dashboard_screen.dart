import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:tastytakeout_admin_web/views/screens/event_creator_screen.dart';
import 'package:tastytakeout_admin_web/views/screens/voucher_creator_screen.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class DashboardController extends GetxController {
  // TODO: Add controller logic for login
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
}

// class _MyHomePageState extends State<MyHomePage> {
class DashboardPage extends StatelessWidget {
  DashboardController dashboardController = Get.put(DashboardController());
  // PageController pageController = PageController();
  // SideMenuController sideMenu = SideMenuController();

  // @override
  // void initState() {
  //   sideMenu.addListener((index) {
  //     pageController.jumpToPage(index);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    dashboardController.sideMenu.addListener((index) {
      dashboardController.pageController.jumpToPage(index);
    });
    return Scaffold(
      appBar: AppBar(
        // title: Text(widget.title),
        leading: null,
        title: Text("Tasty Takeout Admin"),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: dashboardController.sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedHoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            title: Column(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 150,
                    maxWidth: 150,
                  ),
                  child: Image.asset(
                    'lib/resources/logo.png',
                  ),
                ),
                const Divider(
                  indent: 8.0,
                  endIndent: 8.0,
                ),
              ],
            ),
            // footer: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //         color: Colors.lightBlue[100],
            //         borderRadius: BorderRadius.circular(12)),
            //     child: Padding(
            //       padding:
            //           const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            //       child: Text(
            //         'mohada',
            //         style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            //       ),
            //     ),
            //   ),
            // ),
            items: [
              SideMenuItem(
                title: 'Bảng điều khiển',
                onTap: (index, _) {
                  dashboardController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.home),
                // badgeContent: const Text(
                //   '3',
                //   style: TextStyle(color: Colors.white),
                // ),
                tooltipContent: "This is a tooltip for Dashboard item",
              ),
              SideMenuItem(
                title: 'Người bán',
                onTap: (index, _) {
                  dashboardController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.supervisor_account),
              ),
              SideMenuItem(
                title: 'Phát hành voucher mới',
                onTap: (index, _) {
                  dashboardController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.label_important),
                // trailing: Container(
                //     decoration: const BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.all(Radius.circular(6))),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 6.0, vertical: 3),
                //       child: Text(
                //         'New',
                //         style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                //       ),
                //     )),
              ),
              SideMenuItem(
                title: 'Phát hành event mới',
                onTap: (index, _) {
                  dashboardController.sideMenu.changePage(index);
                },
                icon: const Icon(Icons.event),
              ),
              // SideMenuItem(
              //   title: 'Download',
              //   onTap: (index, _) {
              //     dashboardController.sideMenu.changePage(index);
              //   },
              //   icon: const Icon(Icons.download),
              // ),
              // SideMenuItem(
              //   builder: (context, displayMode) {
              //     return const Divider(
              //       endIndent: 8,
              //       indent: 8,
              //     );
              //   },
              // ),
              // SideMenuItem(
              //   title: 'Settings',
              //   onTap: (index, _) {
              //     dashboardController.sideMenu.changePage(index);
              //   },
              //   icon: const Icon(Icons.settings),
              // ),
              // SideMenuItem(
              //   onTap:(index, _){
              //     dashboardController.sideMenu.changePage(index);
              //   },
              //   icon: const Icon(Icons.image_rounded),
              // ),
              // SideMenuItem(
              //   title: 'Only Title',
              //   onTap:(index, _){
              //     dashboardController.sideMenu.changePage(index);
              //   },
              // ),
              const SideMenuItem(
                title: 'Đăng xuất',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: dashboardController.pageController,
              children: [
                Container(
                  color: Colors.white,
                  
                  child: const Center(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Users',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: VoucherCreatorScreen(),
                  // child: const Center(
                  //   child: Text(
                  //     'Files',
                  //     style: TextStyle(fontSize: 35),
                  //   ),
                  // ),
                ),
                Container(
                  color: Colors.white,
                  child: EventCreatorScreen(),
                  // child: const Center(
                  //   child: Text(
                  //     'Files',
                  //     style: TextStyle(fontSize: 35),
                  //   ),
                  // ),
                ),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Download',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Settings',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Only Title',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
                // Container(
                //   color: Colors.white,
                //   child: const Center(
                //     child: Text(
                //       'Only Icon',
                //       style: TextStyle(fontSize: 35),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}