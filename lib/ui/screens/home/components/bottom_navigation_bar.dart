// necessary
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CiftcidenBottomNavigation extends StatefulWidget {
  final Function({required int index, required int currentIndex}) onTabSelected;
  final int currentIndex;
  const CiftcidenBottomNavigation({Key? key, required this.currentIndex, required this.onTabSelected}) : super(key: key);

  @override
  State<CiftcidenBottomNavigation> createState() => _CiftcidenBottomNavigationState();
}

class _CiftcidenBottomNavigationState extends State<CiftcidenBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        // notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTabItem(index: 0, icon: const Icon(Icons.person_outline)),
            buildTabItem(index: 1, icon: const Icon(Icons.add_circle_outline)),
            buildTabItem(index: 2, icon: const Icon(Icons.home_outlined)),
            buildTabItem(index: 3, icon: const Icon(Icons.email_outlined)),
            buildTabItem(index: 4, icon: const Icon(Icons.settings_outlined)),
          ],
        ));
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final isSelected = index == widget.currentIndex;
    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.white: Colors.black87,
      ),
      child:  IconButton(

        style: isSelected? ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
        ):null,
          icon: icon,
          iconSize: 32,
          onPressed: () {
            widget.onTabSelected(index: index, currentIndex: widget.currentIndex);
          }),
    );
  }
}
