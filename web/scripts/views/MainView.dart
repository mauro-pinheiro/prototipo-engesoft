import 'dart:html';

import 'SideBarView.dart';
import 'TopbarView.dart';
import 'View.dart';

class MainView extends View {
  DivElement _container = DivElement();
  TopbarView _topbar;
  SideBarView _sidebar;
  View _pagebody;

  MainView(this._topbar, this._sidebar, this._pagebody);

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
}
