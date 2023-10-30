import 'package:etos_scale_windows/pages/list/list_page.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/components/drawer/settings.dart';
import 'package:etos_scale_windows/components/ui/button_circle.dart';
import 'package:etos_scale_windows/components/ui/icons/network_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/printer_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/scale_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/settings_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/user_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/wifi_icon.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/scale/scale_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.index = 0;
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  renderLabel(String labelText, int index) {
    return Container(
      decoration: tabController.index == index
          ? const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white,
                  width: 4,
                ),
              ),
            )
          : const BoxDecoration(),
      child: GestureDetector(
        onTap: () {
          setState(() {
            tabController.index = index;
          });
        },
        child: Center(
          child: Text(
            labelText.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: tabController.index == index
                  ? FontWeight.w500
                  : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBaseBg1,
      endDrawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const SettingsDrawer(),
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
                    color: colorBaseBg2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              renderLabel("Хэмжилт", 0),
                              const SizedBox(
                                width: 50,
                              ),
                              renderLabel("Түүх", 1),
                            ],
                          ),
                          Row(
                            children: [
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const WifiIcon(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const NetworkIcon(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const ScaleIcon(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const PrinterIcon(),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const SettingsIcon(),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              ButtonCircle(
                                color: colorBaseDarkLine,
                                onPress: () {},
                                icon: const UserIcon(),
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
              children: const [ScalePage(), ScaleListPage()],
            ),
          ),
        ),
      ),
    );
  }
}
