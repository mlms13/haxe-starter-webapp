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
    return m('ul.todo-list', list.todos.pluck(
      m('li.todo-item', _.title)
    ));
  }
}
