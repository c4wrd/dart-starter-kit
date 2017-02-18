import 'dart:html';

/* Import packages required for our polymer elements */
import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';

import 'package:polymer/polymer.dart';

import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';

import 'package:dataminr_helper/app_component.dart';

main() async {
  await initPolymer();
  bootstrap(AppComponent);
}
