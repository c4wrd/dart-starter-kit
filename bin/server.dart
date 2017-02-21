import 'dart:core';
import 'dart:async';

import 'package:redstone/redstone.dart' as app;
import 'package:redstone_mapper/mapper.dart';
import 'package:redstone_mapper/plugin.dart';

void main() {
  app.setupConsoleLog();
  app.addPlugin(getMapperPlugin());
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

    return {"success": true, "task": task}
  }


}