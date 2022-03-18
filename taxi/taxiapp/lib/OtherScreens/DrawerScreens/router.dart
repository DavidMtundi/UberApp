import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxiapp/OtherScreens/chatRiderroute.dart';
import 'package:taxiapp/OtherScreens/customWalkThrough.dart';
import 'package:taxiapp/OtherScreens/favouritesscreens/favourites.dart';
import 'package:taxiapp/OtherScreens/myrides.dart';
import 'package:taxiapp/OtherScreens/otherwidgets/updateinformation.dart';
import 'package:taxiapp/OtherScreens/payments/addcard.dart';
import 'package:taxiapp/OtherScreens/payments/payment.dart';
import 'package:taxiapp/OtherScreens/profile.dart';
import 'package:taxiapp/OtherScreens/promotions/promotions.dart';
import 'package:taxiapp/screens/home.dart';

import '../favouritesscreens/updatefavourite.dart';
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
    case FavoritesRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Favorites());
    case PromotionRoute:
      return MaterialPageRoute(builder: (BuildContext context) => Promotions());
    case UpdateFavoritesRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => UpdateFavorite());
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
