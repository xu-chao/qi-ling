import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qiling/routes/app_pages.dart';

import 'bloc/active_index_bloc.dart';
import 'components/category_list.dart';
import 'components/menu_icon.dart';
import 'components/player_controls.dart';
import 'components/selected_category_section.dart';
import 'components/title_widget.dart';
import 'components/user_card.dart';
import 'data/category_database.dart';
import 'package:get/get.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    // systemNavigationBarColor: Colors.grey[50],
    // systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

// Global Variables
double lExpanded = 0;
double rExpanded = 0;
double lCollapsed = 0;
double rCollapsed = 0;
double lMidExpanded = 0;
double lMidCollapsed = 0;
double rMidExpanded = 0;
double rMidCollapsed = 0;
Duration normal = const Duration(milliseconds: 300);
Duration fast = const Duration(milliseconds: 200);
Duration superFast = const Duration(milliseconds: 100);
bool leftActive = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      // HomePage is the main page.
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Controller for Rotation Animation.
  late Animation<double> rotateAnim;
  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    leftActive = true;

    rotationController = AnimationController(vsync: this, duration: superFast);
    rotateAnim =
        Tween<double>(begin: 0, end: 0.125).animate(rotationController);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lExpanded = 4 * MediaQuery.of(context).size.width / 5 - 0.5;
    lCollapsed = MediaQuery.of(context).size.width / 3 - 0.5;
    rExpanded = 2 * MediaQuery.of(context).size.width / 3 - 0.5;
    rCollapsed = MediaQuery.of(context).size.width / 5 - 0.5;
    lMidExpanded = MediaQuery.of(context).size.height - 2 * rCollapsed - 24;
    lMidCollapsed = MediaQuery.of(context).size.height - lExpanded - 24;
    rMidExpanded = MediaQuery.of(context).size.height - 2 * rCollapsed - 24;
    rMidCollapsed = MediaQuery.of(context).size.height - rCollapsed - lExpanded - 24;
  }

  void expandLeftSection() {
    // This function expands left section.
    setState(() {
      leftActive = true;
      leftActive ? rotationController.reverse() : rotationController.forward();
    });
  }

  void expandRightSection() {
    // This function expands right section.
    setState(() {
      leftActive = false;
      leftActive ? rotationController.reverse() : rotationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        // This gets the active Category's index number.
        initialData: 0,
        stream: activeIndexBloc.streamActiveIndex,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            // Base Widget.
            padding: const EdgeInsets.only(top: 24),
            child: Row(
              // This Row separtaes the Left Section from the one on the Right Side.
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: AnimatedContainer(
                    padding: EdgeInsets.zero,
                    //Left Section
                    duration: normal,
                    color: Colors.transparent,
                    width: leftActive ? lExpanded : lCollapsed,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child:ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // Top Left Widget: App Title
                              titleWidget(),

                              // Mid Left Widget: Category Info & Contents
                              selectedCategorySection(
                                activeIndex: snapshot.data,
                                totalItems: database[snapshot.data].audioList.length,
                                categoryTag: database[snapshot.data].categoryTag,
                                imagePath: database[snapshot.data].imagePath,
                                categoryTitle: database[snapshot.data].categoryTitle,
                                trigger: expandLeftSection,
                              ),

                              // Bottom Left Widget: Player Controls
                              PlayerControls(),
                            ],
                          ),
                        ],
                      ),),
                  ),
                ),
                Container(
                  //Seperator
                  color: Colors.grey[200],
                  width: 1,
                ),
                AnimatedContainer(
                  //Right Section
                  duration: normal,
                  color: Colors.transparent,
                  width: leftActive ? rCollapsed : rExpanded,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Top Right Widget: Rotating Menu Icon
                      menuIcon(
                        rotateAnim: rotateAnim,
                        rotationController: rotationController,
                        trigger: expandRightSection,
                      ),

                      // Middle Right Widget: List of all Categories
                      categoryList(activeIndex: snapshot.data),

                      // Bottom Right Widget: User Info Widget
                      userCard(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
