import 'dart:html';

import '../controllers/Controller.dart';
import 'PageBodyView.dart';
import 'SideBarView.dart';
import 'TopbarView.dart';
import 'View.dart';

class MainView extends View {
  DivElement _container = DivElement();
  TopbarView _topbar;
  SideBarView _sidebar;
  PageBodyView _pagebody;

  MainView(this._topbar, this._sidebar, this._pagebody) {
    _sidebar.check.onChange.listen((e) => _onChange(e));
  }

  @override
  Element build() {
    return _container
      ..append(_topbar.build())
      ..append(_sidebar.build())
      ..append(_pagebody.build());
  }

  get topbar => _topbar;
  get sidebar => _sidebar;
  get pagebody => _pagebody;

  set topbar(value) => _topbar = value;
  set sidebar(value) => _sidebar = value;
  set pagebody(value) => _pagebody = value;

  _onChange(Event e) {
    var target = e.target;
    if (target is CheckboxInputElement) {
      if (target.checked) {
        _pagebody.container.style.marginLeft = "275px";
      } else {
        _pagebody.container.style.marginLeft = "25px";
      }
    }
  }
}
