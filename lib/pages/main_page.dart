import 'package:etos_scale_windows/components/drawer/settings.dart';
import 'package:etos_scale_windows/components/side_navigation/side_navigation.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/list/list_page.dart';
import 'package:etos_scale_windows/provider/connection_provider.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/pages/scale/scale_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onSidebarItemSelected(String item) {
    final selectedItem =
        Provider.of<ConnectionProvider>(context, listen: false);
    selectedItem.setSelectedItem(item);
  }

  @override
  Widget build(BuildContext context) {
    final selectedItemProvider = Provider.of<ConnectionProvider>(context);
    String selectedItem = selectedItemProvider.selectedItem;

    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          backgroundColor: colorBlue,
          child: const SettingsDrawer(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: [
            SizedBox(
              child: CustomSideNavigationBar(
                selectedItem: selectedItem,
                onItemSelected: _onSidebarItemSelected,
                scaffoldKey: _scaffoldKey,
              ),
            ),
            Expanded(
              child: _buildContentSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    final selectedItemProvider = Provider.of<ConnectionProvider>(context);
    final selectedItem = selectedItemProvider.selectedItem;

    if (selectedItem == 'ScalePage') {
      return const ScalePage();
    } else if (selectedItem == 'ScaleList') {
      return const ScaleListPage();
    }
    return const SizedBox(
      child: Center(
        child: Text('NOTHING IN HERE XD'),
      ),
    );
  }
}
