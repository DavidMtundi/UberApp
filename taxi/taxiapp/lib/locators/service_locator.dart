import 'package:get_it/get_it.dart';
import 'package:taxiapp/services/call_sms.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
