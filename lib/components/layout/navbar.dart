import 'package:etos_scale_windows/components/ui/button_circle.dart';
import 'package:etos_scale_windows/components/ui/icons/network_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/printer_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/scale_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/settings_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/user_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/wifi_icon.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/splash/splash_page.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomSideNavigationBar extends StatefulWidget {
  final String selectedItem;
  final Function(String) onItemSelected;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const CustomSideNavigationBar({
    Key? key,
    required this.selectedItem,
    required this.onItemSelected,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<CustomSideNavigationBar> createState() =>
      _CustomSideNavigationBarState();
}

class _CustomSideNavigationBarState extends State<CustomSideNavigationBar> {
  bool isSubmit = false;

  logout() async {
    setState(() {
      isSubmit = true;
    });
    await Provider.of<UserProvider>(context, listen: false).logout();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed(SplashPage.routeName);
    setState(() {
      isSubmit = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(vertical: 30),
      color: primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    widget.selectedItem == 'ScalePage';
                    widget.onItemSelected('ScalePage');
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.selectedItem == 'ScalePage'
                            ? selectedColor
                            : colorBlue,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/scale.svg',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.selectedItem == 'ScaleList';
                    widget.onItemSelected('ScaleList');
                  });
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: widget.selectedItem == 'ScaleList'
                            ? selectedColor
                            : colorBlue,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/svg/history.svg',
                          height: 25,
                          width: 25,
                          // ignore: deprecated_member_use
                          color: widget.selectedItem == 'ScaleList'
                              ? black
                              : white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              ButtonCircle(
                color: colorBlue,
                onPress: () {},
                icon: const WifiIcon(),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonCircle(
                color: colorBlue,
                onPress: () {},
                icon: const NetworkIcon(),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonCircle(
                color: colorBlue,
                onPress: () {},
                icon: const ScaleIcon(),
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonCircle(
                color: colorBlue,
                onPress: () {},
                icon: const PrinterIcon(),
              ),
              const SizedBox(
                height: 30,
              ),
              ButtonCircle(
                color: colorBlue,
                onPress: () {
                  widget.scaffoldKey.currentState!.openDrawer();
                },
                icon: const SettingsIcon(),
              ),
              const SizedBox(
                height: 15,
              ),
              Builder(
                builder: (context) {
                  return ButtonCircle(
                    color: colorBlue,
                    onPress: () {
                      final RenderBox renderBox =
                          context.findRenderObject() as RenderBox;
                      final Offset localOffset =
                          renderBox.localToGlobal(Offset.zero);

                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          localOffset.dx,
                          localOffset.dy + renderBox.size.height,
                          localOffset.dx + renderBox.size.width,
                          localOffset.dy + renderBox.size.height + 10,
                        ),
                        items: <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            child: ListTile(
                              leading: const Icon(Icons.logout),
                              title: const Text('Гарах'),
                              onTap: () {
                                logout();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    icon: const UserIcon(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
