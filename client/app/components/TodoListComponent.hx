package app.components;

import mithril.M;
import app.models.TodoListModel;
import app.viewmodels.TodoListViewModel;
using thx.Arrays;
using thx.Functions;

class TodoListComponent implements Component {
  var vm : TodoListViewModel;

  public function new() {
    vm = new TodoListViewModel();
  }

  public function controller() {
    vm.getData();
  }

  function checklist() : ViewOutput {
    // TODO: add actual loader here
    return vm.list == null ? [] :
      m('ul.todo-list', vm.list.todos.map.fn(
        m('li.todo-item', _.title)
      ));
  }

  function form() : ViewOutput {
    return m('form', {
      onsubmit : vm.onNewTaskSubmit
    }, [
      m('input', {
        onkeyup : vm.onNewTaskKeyup,
        value : vm.newTaskName
      })
    ]);
  }

  public function view() : ViewOutput {
    return [
      checklist(),
      form()
    ];
  }
}
