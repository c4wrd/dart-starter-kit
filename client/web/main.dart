import 'dart:html';

// import packages required for polymer and polymer elements
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer/polymer.dart';

// import Angular 2
import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';

// import the components for the application
import 'package:myclient/app_component.dart';

main() async {
  await initPolymer();
  bootstrap(AppComponent);
}
