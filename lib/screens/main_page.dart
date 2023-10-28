import 'package:flutter/material.dart';
import 'package:etos_scale_windows/components/drawer/end-drawer.dart';
import 'package:etos_scale_windows/screens/list/list-page.dart';
import 'package:etos_scale_windows/screens/scale/scale_page.dart';
import 'package:etos_scale_windows/widgets/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.index = currentIndex;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  changePage(index) {
    setState(() {
      tabController.index = index;
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: CustomDrawer(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: darkgrey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 190),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: tabController.index == 0
                                      ? BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: white,
                                              width: 4,
                                            ),
                                          ),
                                        )
                                      : BoxDecoration(),
                                  child: GestureDetector(
                                    onTap: () {
                                      changePage(0);
                                    },
                                    child: Center(
                                      child: Text(
                                        'ПҮҮЛЭХ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: white,
                                          fontWeight: tabController.index == 0
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  decoration: tabController.index == 1
                                      ? BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: white,
                                              width: 4,
                                            ),
                                          ),
                                        )
                                      : BoxDecoration(),
                                  child: GestureDetector(
                                    onTap: () {
                                      changePage(1);
                                    },
                                    child: Center(
                                      child: Text(
                                        'ТҮҮХ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: white,
                                          fontWeight: tabController.index == 1
                                              ? FontWeight.w700
                                              : FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: backgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(35),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              'ПҮН',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Холбогдсон ПҮН COM6',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextButton(
                                                      style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .transparent),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text(
                                                        'Ойлголоо',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/wifi.svg',
                                    height: 28,
                                    width: 28,
                                    color: svgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: backgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(35),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              'Интернет',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Интернет холболт салсан',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextButton(
                                                      style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .transparent),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text(
                                                        'Ойлголоо',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/transfer.svg',
                                    height: 28,
                                    width: 28,
                                    color: svgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: backgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(35),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              'ПҮН',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Холбогдсон ПҮН COM6',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextButton(
                                                      style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .transparent),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text(
                                                        'Ойлголоо',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/dashboard.svg',
                                    height: 28,
                                    width: 28,
                                    color: svgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: backgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 300,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(35),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              'Printer',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Холбогдсон Printer байхгүй.',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    TextButton(
                                                      style: ButtonStyle(
                                                        overlayColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .transparent),
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text(
                                                        'Ойлголоо',
                                                        style: TextStyle(
                                                          color: white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/printer.svg',
                                    color: svgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/settings.svg',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) {
                                        return Dialog(
                                          backgroundColor: backgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 400,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      'Баталгаажуулалт',
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: white),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Container(
                                                      margin:
                                                          EdgeInsets.all(35),
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              'UserName',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 15,
                                                          ),
                                                          Center(
                                                            child: Text(
                                                              'Та гарахдаа итгэлтэй байна уу?',
                                                              style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 15),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      TextButton(
                                                        style: ButtonStyle(
                                                          overlayColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .transparent),
                                                        ),
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false),
                                                        child: const Text(
                                                          'Болих',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        style: ButtonStyle(
                                                          overlayColor:
                                                              MaterialStateProperty
                                                                  .all(Colors
                                                                      .transparent),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(true);
                                                        },
                                                        child: const Text(
                                                          'Гарах',
                                                          style: TextStyle(
                                                            color: white,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  backgroundColor: backgroundColor,
                                  child: SvgPicture.asset(
                                    'assets/svg/user.svg',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ScalePage(),
                ListPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
