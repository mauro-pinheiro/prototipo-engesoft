import 'dart:html';

import 'scripts/controllers/Controller.dart';
import 'scripts/views/LoginView.dart';

main() {
  // querySelector("#side-bar").append(SideBar().build());
  // Controller.load(querySelector('body'),
  //     MainView(TopbarView(), SideBarView(), EdicaoView()));
  // querySelector('body'),
  // HomeView());

  Controller.body = querySelector('body');

  Controller.loadOnBody(LoginView());
}
