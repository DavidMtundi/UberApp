import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxiapp/helpers/constants.dart';
import 'package:taxiapp/helpers/screen_navigation.dart';
import 'package:taxiapp/models/user.dart';
import 'package:taxiapp/screens/login.dart';
import 'package:taxiapp/services/user.dart';
import 'package:taxiapp/widgets/loading.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserProvider with ChangeNotifier {
  static const LOGGED_IN = "loggedIn";
  static const ID = "id";

  late User _user;
  Status _status = Status.Uninitialized;
  int _currentPage = 0;
  void onPageChange(int newPage) {
    _currentPage = newPage;
    notifyListeners();
  }

  int get currentPageValue => _currentPage;
  final UserServices _userServices = UserServices();
  UserModel _userModel = UserModel(
      idvalue: "idvalue",
      namevalue: "namevalue",
      emailvalue: "emailvalue",
      phonevalue: "phonevalue",
      tokenvalue: "tokenvalue",
      votesvalue: 0,
      tripsvalue: 0,
      ratingsvalue: 0);

//  getter

  // public variables
  final formkey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController countrycode = TextEditingController();
  TextEditingController message = TextEditingController();

  TextEditingController newpassword = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController expiry = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController placename = TextEditingController();
  TextEditingController placeaddress = TextEditingController();
  TextEditingController phone = TextEditingController();

  UserProvider.initialize() {
    _initialize();
  }
  UserModel get userModel => _userModel;
  Status get status => _status;
  //User get user => _user;

  Future<bool> signIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

//    try{
    _status = Status.Authenticating;
    notifyListeners();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((value) async {
        await prefs.setString(ID, value.user!.uid);
        await prefs.setBool(LOGGED_IN, true);

        _userModel = await _userServices.getUserById(value.user!.uid);
      });
    } catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<bool> signUp(BuildContext context) async {
//    try{
    _status = Status.Authenticating;
    notifyListeners();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(ID, result.user!.uid);
        await prefs.setBool(LOGGED_IN, true);
        _userServices.createUser(
          id: result.user!.uid,
          name: name.text.trim(),
          email: email.text.trim(),
          phone: phone.text.trim(),
          position: {},
        );
        await prefs.setString(ID, result.user!.uid);
        await prefs.setBool(LOGGED_IN, true);
        //     authProvider.clearController();
        // changeScreenReplacement(context, LoginScreen());
      });
    } catch (e) {
      print("Email is Registered");
    }
    return true;
  }

  Future signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    auth.signOut();
    _status = Status.Unauthenticated;
    await prefs.setString(ID, "");
    await prefs.setBool(LOGGED_IN, false);
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  void clearController() {
    name.text = "";
    password.text = "";
    email.text = "";
    phone.text = "";
    lastname.text = "";
    otp1.text = "";
    cardNumber.text = "";
    expiry.text = "";
    otp2.text = "";
    cvv.text = "";
    placename.text = "";
    placeaddress.text = "";
    otp3.text = "";
    otp4.text = "";
    newpassword.text = "";
    countrycode.text = "";
    message.text = "";
  }

  Future<void> reloadUserModel() async {
    _userModel = await _userServices.getUserById(_user.uid);
    notifyListeners();
  }

  updateUserData(Map<String, dynamic> data) async {
    _userServices.updateUserData(data);
  }

  saveDeviceToken() async {
    String? deviceToken = await fcm.getToken();
    if (deviceToken != null) {
      if (_user != null) {
        _userServices.addDeviceToken(userId: _user.uid, token: deviceToken);
      } else {
        Loading();
      }
    }
  }

  _initialize() async {
    //clearController();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loggedIn = prefs.getBool(LOGGED_IN) ?? false;
    if (!loggedIn) {
      _status = Status.Unauthenticated;
    } else {
      if (auth.currentUser != null) {
        _user = auth.currentUser!;
        _status = Status.Authenticated;

        _userModel = await _userServices.getUserById(auth.currentUser!.uid);
      }
    }
    notifyListeners();
  }
}
