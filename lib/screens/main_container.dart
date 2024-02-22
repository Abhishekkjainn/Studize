import 'package:flutter/material.dart';
import 'package:studize/screens/detail/new_task_view.dart';
import 'package:studize/screens/info/main_info_view.dart';
import 'package:studize/screens/aiMentor/main.dart';
import 'package:studize/screens/main_tasks.dart';
import 'package:studize/screens/profile/MainProfile.dart';
import 'package:studize/widgets/app_bar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/cupertino.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  var selectedIndex = 0;
  // ignore: non_constant_identifier_names
  final List SelectedIndexPage = [
    const MainTasksView(),
    const MainInfoView(),
    const GptMain(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    Widget page;
    // switch (selectedIndex) {
    //   case 0:
    //     page = const MainTasksView();
    //     break;
    //   case 1:
    //     page = const MainInfoView();
    //     break;
    //   case 2:
    //     page = const GptMain();
    //     break;
    //   case 3:
    //     page = const Placeholder();
    //     break;
    //   default:
    //     throw UnimplementedError('no widget for $selectedIndex');
    // }
    var mainArea = AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: SelectedIndexPage[selectedIndex],
    );

    // const navDestinationLabels = ['Home', 'Info', 'AI', 'Mentor'];
    // const navDestinationIcons = [
    //   Icons.home_outlined,
    //   Icons.info_outline,
    //   Icons.chat_bubble_outline,
    //   Icons.person_2_outlined,
    // ];
    // const navDestinationIconsSelected = [
    //   Icons.home,
    //   Icons.info,
    //   Icons.chat_bubble,
    //   Icons.person,
    // ];

    return Scaffold(
      extendBody: true,
      // appBar: MainAppBar(),
      body: mainArea,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const NewTaskCategoryPicker(),
        )),
        label: const Text('New Task'),
        icon: const Icon(Icons.add_task),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: BottomNavigationBar(
      //   showUnselectedLabels: false,
      //   type: BottomNavigationBarType.fixed,
      //   items: List.generate(
      //     navDestinationLabels.length,
      //     (index) => BottomNavigationBarItem(
      //       icon: Icon(navDestinationIcons[index]),
      //       activeIcon: Icon(navDestinationIconsSelected[index]),
      //       label: navDestinationLabels[index],
      //     ),
      //   ),
      //   currentIndex: selectedIndex,
      //   onTap: (value) {
      //     setState(() {
      //       selectedIndex = value;
      //     });
      //   },
      // ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Padding BottomNavBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            color: Colors.white,
            style: GnavStyle.google,
            gap: 8,
            tabActiveBorder: Border.all(color: Colors.blue),
            tabBackgroundColor: Colors.blue.withOpacity(0.2),
            activeColor: Colors.blue,
            textStyle: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.w600),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
                text: 'Home',
              ),
              GButton(
                icon: CupertinoIcons.info_circle_fill,
                text: 'Info',
              ),
              GButton(
                icon: CupertinoIcons.chat_bubble_fill,
                text: 'Chat',
              ),
              GButton(
                icon: CupertinoIcons.person_alt_circle_fill,
                text: 'Profile',
              ),
            ],
            selectedIndex: selectedIndex,
            onTabChange: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
