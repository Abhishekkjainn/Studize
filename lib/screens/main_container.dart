import 'package:flutter/material.dart';
import 'package:studize/screens/detail/new_task_view.dart';
import 'package:studize/screens/info/main_info_view.dart';
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
        page = const GptMain();
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
      body: mainArea,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NewTaskCategoryPicker(),
        )),
        label: const Text('New Task'),
        icon: const Icon(Icons.add_task),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
