// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodosListState _$TodosListStateFromJson(Map<String, dynamic> json) {
  return _TodosListState.fromJson(json);
}

/// @nodoc
mixin _$TodosListState {
  List<Todo> get todos => throw _privateConstructorUsedError;
  bool get isLastPage => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodosListStateCopyWith<TodosListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosListStateCopyWith<$Res> {
  factory $TodosListStateCopyWith(
          TodosListState value, $Res Function(TodosListState) then) =
      _$TodosListStateCopyWithImpl<$Res, TodosListState>;
  @useResult
  $Res call({List<Todo> todos, bool isLastPage, int currentPage});
}

/// @nodoc
class _$TodosListStateCopyWithImpl<$Res, $Val extends TodosListState>
    implements $TodosListStateCopyWith<$Res> {
  _$TodosListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? isLastPage = null,
    Object? currentPage = null,
  }) {
    return _then(_value.copyWith(
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodosListStateImplCopyWith<$Res>
    implements $TodosListStateCopyWith<$Res> {
  factory _$$TodosListStateImplCopyWith(_$TodosListStateImpl value,
          $Res Function(_$TodosListStateImpl) then) =
      __$$TodosListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Todo> todos, bool isLastPage, int currentPage});
}

/// @nodoc
class __$$TodosListStateImplCopyWithImpl<$Res>
    extends _$TodosListStateCopyWithImpl<$Res, _$TodosListStateImpl>
    implements _$$TodosListStateImplCopyWith<$Res> {
  __$$TodosListStateImplCopyWithImpl(
      _$TodosListStateImpl _value, $Res Function(_$TodosListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
    Object? isLastPage = null,
    Object? currentPage = null,
  }) {
    return _then(_$TodosListStateImpl(
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      isLastPage: null == isLastPage
          ? _value.isLastPage
          : isLastPage // ignore: cast_nullable_to_non_nullable
              as bool,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodosListStateImpl implements _TodosListState {
  const _$TodosListStateImpl(
      {required final List<Todo> todos,
      required this.isLastPage,
      required this.currentPage})
      : _todos = todos;

  factory _$TodosListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodosListStateImplFromJson(json);

  final List<Todo> _todos;
  @override
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final bool isLastPage;
  @override
  final int currentPage;

  @override
  String toString() {
    return 'TodosListState(todos: $todos, isLastPage: $isLastPage, currentPage: $currentPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosListStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.isLastPage, isLastPage) ||
                other.isLastPage == isLastPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_todos), isLastPage, currentPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosListStateImplCopyWith<_$TodosListStateImpl> get copyWith =>
      __$$TodosListStateImplCopyWithImpl<_$TodosListStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodosListStateImplToJson(
      this,
    );
  }
}

abstract class _TodosListState implements TodosListState {
  const factory _TodosListState(
      {required final List<Todo> todos,
      required final bool isLastPage,
      required final int currentPage}) = _$TodosListStateImpl;

  factory _TodosListState.fromJson(Map<String, dynamic> json) =
      _$TodosListStateImpl.fromJson;

  @override
  List<Todo> get todos;
  @override
  bool get isLastPage;
  @override
  int get currentPage;
  @override
  @JsonKey(ignore: true)
  _$$TodosListStateImplCopyWith<_$TodosListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
