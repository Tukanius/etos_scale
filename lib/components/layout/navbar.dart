import 'package:etos_scale_windows/components/ui/button_circle.dart';
import 'package:etos_scale_windows/components/ui/icons/network_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/printer_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/scale_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/settings_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/user_icon.dart';
import 'package:etos_scale_windows/components/ui/icons/wifi_icon.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      showMenu(
                        context: context,
                        position: RelativeRect.fill,
                        elevation: 0,
                        items: <PopupMenuItem<String>>[
                          PopupMenuItem<String>(
                            value: 'logout',
                            child: ListTile(
                              title: const Text('Log Out'),
                              leading: const Icon(Icons.logout),
                              onTap: () {
                                Navigator.pop(context);
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
