import 'package:flutter/widgets.dart';
import 'package:smart_ix_takehome/src/feature/authentication/presentation/pages/login_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_device_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_routine_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/add_services_page.dart';
import 'package:smart_ix_takehome/src/feature/home/presentation/pages/home_page.dart';

final routes = {
  LoginPage.route: (BuildContext context) => LoginPage(),
  HomePage.route: (BuildContext context) => const HomePage(),
  AddServicePage.route: (BuildContext context) => const AddServicePage(),
  AddRoutinePage.route: (BuildContext context) => const AddRoutinePage(),
  AddDevicePage.route: (BuildContext context) => const AddDevicePage(),
};
