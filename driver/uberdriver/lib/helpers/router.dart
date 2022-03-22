import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uberdriver/chatRiderroute.dart';
import 'package:uberdriver/customWalkThrough.dart';
import 'package:uberdriver/myrides.dart';
import 'package:uberdriver/otherwidgets/updateinformation.dart';
import 'package:uberdriver/payments/addcard.dart';
import 'package:uberdriver/payments/payment.dart';
import 'package:uberdriver/profile.dart';
import 'package:uberdriver/screens/home.dart';

import '../otherauthscreens/loginpage.dart';
import '../otherauthscreens/otpVerificationPage.dart';
import '../otherauthscreens/registerpage.dart';
import '../otherauthscreens/unauthpage.dart';

// Routes
// const String HomePageRoute = "/";
const String WalkthroughRoute = "/";
const String RegisterRoute = "register";
const String LoginRoute = "login";
const String PhoneRegisterRoute = "phone-register";
const String OtpVerificationRoute = "otp-verification";
const String UpdateInformationRoute = "update-information";
const String SelectCountryRoute = "country-select";
const String HomepageRoute = "homepage";
const String DestinationRoute = "destination";
const String UnAuthenticatedPageRoute = "unauth";
const String ProfileRoute = "profile";
const String PaymentRoute = "payment";
const String AddCardRoute = "addCard";
const String ChatRiderRoute = "chatRider";
const String FavoritesRoute = "favorite";
const String UpdateFavoritesRoute = "update-favorite";
const String PromotionRoute = "promotion";
const String SuggestedRidesRoute = "suggested-route";
const String MyRidesRoute = "my-rides";

// Router
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case WalkthroughRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => WalkThrough());
    case RegisterRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Register());
    case LoginRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Login());
    // case PhoneRegisterRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => PhoneRegistration());
    case OtpVerificationRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => OtpVerification());
    case UpdateInformationRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => UpdateInformation());
    // case SelectCountryRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => SelectCountry());
    case HomepageRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => MyHomePage(
                title: '',
              ));
    // case DestinationRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => DestinationView());
    case UnAuthenticatedPageRoute:
      return MaterialPageRoute(builder: (BuildContext context) => UnAuth());
    case ProfileRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Profile());
    case PaymentRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Payment());
    case AddCardRoute:
      return MaterialPageRoute(builder: (BuildContext context) => AddCard());
    case ChatRiderRoute:
      return MaterialPageRoute(builder: (BuildContext context) => ChatRider());

    // case SuggestedRidesRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => SuggestedRides());
    case MyRidesRoute:
      return MaterialPageRoute(builder: (BuildContext context) => MyRides());
    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => WalkThrough());
  }
}
