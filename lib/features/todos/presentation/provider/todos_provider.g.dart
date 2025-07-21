// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todoBoxHash() => r'a06d202acbe895ee327472fa745bff05d010765b';

/// See also [todoBox].
@ProviderFor(todoBox)
final todoBoxProvider = Provider<Box<TodoDto>>.internal(
  todoBox,
  name: r'todoBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todoBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodoBoxRef = ProviderRef<Box<TodoDto>>;
String _$todosDataSourceHash() => r'a1e5f13dd2b90506fefd11db7bb994c22cf973a0';

/// See also [todosDataSource].
@ProviderFor(todosDataSource)
final todosDataSourceProvider = Provider<TodosDataSource>.internal(
  todosDataSource,
  name: r'todosDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodosDataSourceRef = ProviderRef<TodosDataSource>;
String _$todosRepositoryHash() => r'd714fd668efb91b2aadcd82ea298dd5524fc2b28';

/// See also [todosRepository].
@ProviderFor(todosRepository)
final todosRepositoryProvider = Provider<TodosRepository>.internal(
  todosRepository,
  name: r'todosRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TodosRepositoryRef = ProviderRef<TodosRepository>;
String _$getTodosUseCaseHash() => r'b54335f4c6e85d261696ed2b1d8179d8c196b87e';

/// See also [getTodosUseCase].
@ProviderFor(getTodosUseCase)
final getTodosUseCaseProvider = Provider<GetTodosUseCase>.internal(
  getTodosUseCase,
  name: r'getTodosUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTodosUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTodosUseCaseRef = ProviderRef<GetTodosUseCase>;
String _$addTodoUseCaseHash() => r'2e417a07aea292737b06130b1785c7a815684c29';

/// See also [addTodoUseCase].
@ProviderFor(addTodoUseCase)
final addTodoUseCaseProvider = Provider<AddTodoUseCase>.internal(
  addTodoUseCase,
  name: r'addTodoUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addTodoUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddTodoUseCaseRef = ProviderRef<AddTodoUseCase>;
String _$updateTodoUseCaseHash() => r'542a01a8b9ed46f3748edbbd60eb1cf87b1375d0';

/// See also [updateTodoUseCase].
@ProviderFor(updateTodoUseCase)
final updateTodoUseCaseProvider = Provider<UpdateTodoUseCase>.internal(
  updateTodoUseCase,
  name: r'updateTodoUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateTodoUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpdateTodoUseCaseRef = ProviderRef<UpdateTodoUseCase>;
String _$deleteTodoUseCaseHash() => r'7c52ce1eaaf1dce13673130cd08fe5e657a5cbf4';

/// See also [deleteTodoUseCase].
@ProviderFor(deleteTodoUseCase)
final deleteTodoUseCaseProvider = Provider<DeleteTodoUseCase>.internal(
  deleteTodoUseCase,
  name: r'deleteTodoUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteTodoUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DeleteTodoUseCaseRef = ProviderRef<DeleteTodoUseCase>;
String _$todosNotifierHash() => r'e59ba3a68f3a802433007c6692089375b613abd6';

/// See also [TodosNotifier].
@ProviderFor(TodosNotifier)
final todosNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TodosNotifier, List<Todo>>.internal(
  TodosNotifier.new,
  name: r'todosNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodosNotifier = AutoDisposeAsyncNotifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
