class Todo {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }
}

class TodoList {
  final List<Todo> todos;
  final int total;
  final int skip;
  final int limit;

  TodoList({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TodoList.fromJson(Map<String, dynamic> json) {
    List<Todo> todos = List<Todo>.from(
      json['todos'].map((todoJson) => Todo.fromJson(todoJson)),
    );

    return TodoList(
      todos: todos,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todos': todos.map((todo) => todo.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}