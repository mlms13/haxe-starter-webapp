package app.components;

import mithril.M;
import app.models.TodoListModel;
using thx.Arrays;

class TodoListComponent implements Component {
  var list : TodoListModel;

  public function new() {
  }

  public function controller() {
    TodoListModel.fetch()
      .success(function (todoList) {
        this.list = todoList;
      })
      .failure(function (err) {
        trace(err);
      })
      .always(function () {
        M.redraw();
      });
  }

  public function view() : ViewOutput {
    return list.todos.pluck(m('ul.todo-list', _.title));
  }
}
