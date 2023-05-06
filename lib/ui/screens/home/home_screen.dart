import 'package:ciftciden/ui/screens/home/sub_screens/contact/contact_screen.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/main/main_screen.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/order/order_screen.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/profile/profile_screen.dart';
import 'package:ciftciden/ui/screens/home/sub_screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';

import 'components/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 2;
  int prevIndex = 2;

  final List<Widget> pages = [
    const ProfileScreen(),
    const OrderScreen(),
    const MainScreen(),
    const ContactScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onHorizontalDragEnd: (DragEndDetails details) {
      //   if (details.primaryVelocity! > 0) {
      //     if (index > 0) {
      //       setState(() {
      //         index--;
      //       });
      //     }
      //   } else if (details.primaryVelocity! < 0) {
      //     if (index < pages.length - 1) {
      //       setState(() {
      //         index++;
      //       });
      //     }
      //   }
      // },
      child: Scaffold(
          body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 280),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: // TODO: ekranin saga mi sola mi gectigini kontrol icin bir onceki degeri bilmemiz gerekiyor
                      index > prevIndex
                          ? Tween<Offset>(
                                  begin: const Offset(1, 0),
                                  end: const Offset(0.0, 0))
                              .animate(animation)
                          : Tween<Offset>(
                                  begin: const Offset(-1, 0),
                                  end: const Offset(0.0, 0))
                              .animate(animation),
                  child: child,
                );
              },
              child: pages[index]),
          bottomNavigationBar: CiftcidenBottomNavigation(
            currentIndex: index,
            onTabSelected: changePageIndex,
          )),
    );
  }

  changePageIndex({required int index, required int currentIndex}) {
    if (index != currentIndex) {
      setState(() {
        this.index = index;
        prevIndex = currentIndex;
      });
    }
  }
}
