import 'dart:core';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as Path;

import 'package:redstone/redstone.dart' as app;
import 'package:redstone_mapper/mapper.dart';
import 'package:redstone_mapper/plugin.dart';
import 'package:shelf_static/shelf_static.dart';

void main() {
  app.setupConsoleLog();
  app.addPlugin(getMapperPlugin());

  if ( Platform.environment.containsKey("ENVIRONMENT") && Platform.environment["ENVIRONMENT"] == "PROD" )
  {
    String scriptPath = Path.dirname(Path.fromUri(Platform.script));
    String webRootPath = Path.normalize("$scriptPath/../../wwwroot/web");
    print("Serving $webRootPath");

    app.setShelfHandler(createStaticHandler(
      webRootPath,
      defaultDocument: "index.html",
      serveFilesOutsidePath: false
    ));
  }

  app.start();
}

class Task {

  @Field()
  String text;

  @Field()
  bool completed;

}

@app.Group("/api/tasks")
class Tasks {

  List<Task> _tasks = new List<Task>();

  @app.DefaultRoute()
  @Encode()
  List<Task> getTasks() {
    return this._tasks;
  }

  @app.Route("/add")
  @Encode()
  addTask(@Decode() Task task) {

    if ( task.text == null )
    {
      return {"success": false};
    }

    task.completed = false;
    this._tasks.add(task);

    return {"success": true, "task": task};
  }


}