package app.viewmodels;

import js.html.Event;
import js.html.KeyboardEvent;
import js.html.InputElement;
import mithril.M;
import app.models.TodoListModel;

class TodoListViewModel {
  public var list(default, null) : TodoListModel;
  public var newTaskName : String;
  public function new() {
    newTaskName = '';
  }

  public function getData() {
    return TodoListModel.fetch()
      .success(function (todoList) {
        list = todoList;
      })
      .failure(function (err) {
        trace(err);
      })
      .always(function () {
        M.redraw();
      });
  }

  public function onNewTaskKeyup(e : KeyboardEvent) {
    var input : InputElement = cast e.target;
    newTaskName = input.value;
  }

  public function onNewTaskSubmit(e : Event) {
    e.preventDefault();
    list.addTask(newTaskName);
    newTaskName = '';
  }
}
