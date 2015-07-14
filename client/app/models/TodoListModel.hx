package app.models;

import mithril.M;
import thx.promise.Promise;
using thx.Arrays;
using thx.Functions;

class TodoListModel {
  public var todos : Array<TodoModel>;

  public static var fakeData = [
    'Make this list',
    'Add some style',
    'Implement an actual api',
    'Make a form for adding more todos',
    'Persist data',
    'Fork this project',
    'Make a more interesting application'
  ];

  public function new() {
  }

  public static function fetch() : Promise<TodoListModel> {
    var list = new TodoListModel();
    list.todos = fakeData.map.fn(new TodoModel(_));
    return Promise.value(list);
  }
}
