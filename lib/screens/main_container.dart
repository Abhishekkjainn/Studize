import 'package:flutter/material.dart';
import 'package:studize/screens/main_info_view.dart';
import 'package:studize/screens/aiMentor/main.dart';
import 'package:studize/screens/main_tasks.dart';
import 'package:studize/widgets/app_bar.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MainTasksView();
        break;
      case 1:
        page = const MainInfoView();
        break;
      case 2:
        page = const gpt_main();
        break;
      case 3:
        page = const Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    var mainArea = AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: page,
    );

    const navDestinationLabels = ['Home', 'Info', 'AI', 'Mentor'];
    const navDestinationIcons = [
      Icons.home_outlined,
      Icons.info_outline,
      Icons.chat_bubble_outline,
      Icons.person_2_outlined,
    ];
    const navDestinationIconsSelected = [
      Icons.home,
      Icons.info,
      Icons.chat_bubble,
      Icons.person,
    ];

    return Scaffold(
      appBar: MainAppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= 0.8 * constraints.maxHeight) {
          // Use a mobile friendly layout with BottomNavigationBar for narrow screens
          return Column(
            children: [
              Expanded(child: mainArea),
              SafeArea(
                child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  items: List.generate(
                    navDestinationLabels.length,
                    (index) => BottomNavigationBarItem(
                      icon: Icon(navDestinationIcons[index]),
                      activeIcon: Icon(navDestinationIconsSelected[index]),
                      label: navDestinationLabels[index],
                    ),
                  ),
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              )
            ],
          );
        } else {
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  labelType: NavigationRailLabelType.selected,

                  groupAlignment: 0,
                  // extended: constraints.maxWidth >= 800,
                  destinations: List.generate(
                    navDestinationLabels.length,
                    (index) => NavigationRailDestination(
                      icon: Icon(navDestinationIcons[index]),
                      selectedIcon: Icon(navDestinationIconsSelected[index]),
                      label: Text(navDestinationLabels[index]),
                    ),
                  ),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(child: mainArea),
            ],
          );
        }
      }),
    );
  }
}
