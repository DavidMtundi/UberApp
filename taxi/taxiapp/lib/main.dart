import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/MainPages/MainPage.dart';
import 'package:taxiapp/MainPages/otherDetails/otherDetails.dart';
import 'package:taxiapp/OtherScreens/DrawerScreens/router.dart';
import 'package:taxiapp/OtherScreens/customWalkThrough.dart';
import 'package:taxiapp/OtherScreens/otherauthscreens/loginpage.dart';
import 'package:taxiapp/OtherScreens/otherconstants/themedart.dart';
import 'package:taxiapp/providers/app_state.dart';
import 'package:taxiapp/providers/user.dart';
import 'package:taxiapp/screens/home.dart';
import 'package:taxiapp/screens/splash.dart';
import 'locators/service_locator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Future reloadData() async {
  AppStateProvider().refreshData();

  setupLocator();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppStateProvider>.value(
        value: AppStateProvider(),
      ),
      ChangeNotifierProvider<UserProvider>.value(
        value: UserProvider.initialize(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'taxiapp',
      theme: ThemeScheme.light(),
      darkTheme: ThemeScheme.dark(),
      onGenerateRoute: onGenerateRoute,
      home: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppStateProvider appState = Provider.of<AppStateProvider>(context);
    //appState.refreshData();
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          UserProvider auth = Provider.of<UserProvider>(context);
          switch (auth.status) {
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
              return WalkThrough();
            case Status.Authenticating:
              return WalkThrough();
            case Status.Authenticated:
              // return OtherProperties();
              return MyHomePage(title: '');
            default:
              return WalkThrough();
          }
        });
  }
}
