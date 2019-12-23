import 'dart:html';

import 'scripts/controllers/Controller.dart';
import 'scripts/views/EdicoesView.dart';
import 'scripts/views/MainView.dart';
import 'scripts/views/SideBarView.dart';
import 'scripts/views/TopbarView.dart';

main() {
  // querySelector("#side-bar").append(SideBar().build());
  Controller.load(querySelector('body'),
      MainView(TopbarView(), SideBarView(), EdicaoView()));
  // querySelector('body'),
  // HomeView());

  querySelector('#check')
    ..onChange.listen((e) {
      var target = e.target;
      if (target is CheckboxInputElement) {
        if (target.checked) {
          querySelector('.pagebody').style.marginLeft = "275px";
        } else {
          querySelector('.pagebody').style.marginLeft = "25px";
        }
      }
    });
}
