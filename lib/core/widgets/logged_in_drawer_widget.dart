import 'package:echo_cash/core/constants/app_globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/app_constants.dart';
import '../constants/assets_path.dart';
import 'back_and_skip_button.dart';

class LoggedInCustomDrawer extends StatefulWidget {
  const LoggedInCustomDrawer({super.key});

  @override
  State<LoggedInCustomDrawer> createState() => _LoggedInCustomDrawerState();
}

class _LoggedInCustomDrawerState extends State<LoggedInCustomDrawer> {
  String activeDrawer = 'main';
  bool allowNotification = true;
  bool darkMode = false;
  String lang = 'English';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        buildDrawerUserInfo(),
        buildDrawerContent(),
        const Spacer(),
        buildDrawerHelpLogout(),
      ]),
    );
  }

  Widget buildDrawerUserInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      color: secondaryColor,
      child: Row(children: [
        Expanded(
          flex: 1,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: whiteColor,
            child: Image.asset(userPhoto),
          ),
        ),
        const Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 8, right: 40, top: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Rima Dardar", style: buttonTextDarkBgStyle),
                    SizedBox(width: 5),
                    Icon(Icons.verified, color: primaryColor),
                  ],
                ),
                Spacer(flex: 1),
                SkipAndBackButtonWidget(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.circle),
                        SizedBox(width: 10),
                        Text('Manager'),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 3),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget buildDrawerContent() {
    switch (activeDrawer) {
      case 'main':
        return mainDrawer();
      case 'setting':
        return settingDrawer();
      default:
        return emptyDrawer();
    }
  }

  Widget buildDrawerHelpLogout() {
    return Column(children: [
      drawerItem(title: 'Help', icon: FontAwesomeIcons.circleQuestion, onTap: () {}),
      drawerItem(title: 'Logout', icon: FontAwesomeIcons.arrowRightFromBracket, onTap: () {}, isRedFont: true)
    ]);
  }

  Widget mainDrawer() {
    return Column(
      children: [
        drawerItem(title: 'Home', icon: Icons.home, onTap: () {}),
        drawerItem(title: 'Wallets', icon: Icons.wallet, onTap: () {}),
        drawerItem(title: 'My Profile', icon: FontAwesomeIcons.user, onTap: () {}),
        drawerItem(title: 'Change PIN', icon: FontAwesomeIcons.lock, onTap: () {}),
        drawerItem(title: 'Notification', icon: FontAwesomeIcons.bell, onTap: () {}),
        drawerItem(
            title: 'Settinge',
            icon: FontAwesomeIcons.gear,
            isGroup: true,
            onTap: () {
              setState(() {
                activeDrawer = 'setting';
              });
            }),
      ],
    );
  }

  Widget settingDrawer() {
    return Column(
      children: [
        drawerItem(
          title: 'Back',
          icon: FontAwesomeIcons.chevronLeft,
          onTap: () {
            setState(() {
              activeDrawer = 'main';
            });
          },
        ),
        drawerSwitshItem(
            title: 'Allow Notifications',
            status: allowNotification,
            onTap: (val) {
              setState(
                () {
                  allowNotification = val;
                },
              );
            }),
        drawerSwitshItem(
            title: 'Dark Mode',
            status: darkMode,
            onTap: (val) {
              setState(
                () {
                  darkMode = val;
                },
              );
            }),
        drawerDropdownItem(
            title: 'Language',
            items: ['Arabic', 'English', 'Turkish'],
            dropdownValue: lang,
            onChanged: (val) {
              setState(() {
                lang = val!;
              });
            })
      ],
    );
  }

  Widget emptyDrawer() {
    return const Column();
  }

//Drawer Items

  Widget drawerItem(
      {required String title,
      IconData? icon,
      required Function() onTap,
      bool isGroup = false,
      isRedFont = false}) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: darkGreyColor,
            width: 0.5,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          title: Text(title, style: (!isRedFont) ? textStyle1Black : textStyle1Red),
          leading: Icon(
            icon,
            color: (!isRedFont) ? darkGreyColor : redColor,
          ),
          trailing: (isGroup)
              ? const Icon(
                  FontAwesomeIcons.arrowRightFromBracket,
                )
              : null,
          iconColor: darkGreyColor,
          onTap: onTap,
        ),
      ),
    );
  }

  Widget drawerSwitshItem({
    required String title,
    required Function(bool) onTap,
    required bool status,
  }) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: darkGreyColor,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textStyle1Black),
            FlutterSwitch(
              value: status,
              width: 50,
              height: 25,
              onToggle: onTap,
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerDropdownItem(
      {required String title,
      required List<String> items,
      required String dropdownValue,
      required Function(String?)? onChanged}) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: darkGreyColor,
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: textStyle1Black),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(
                  FontAwesomeIcons.chevronDown,
                  size: 12,
                ),
                elevation: 0,
                style: textStyle1Black,
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        value,
                        style: textStyle1Black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
