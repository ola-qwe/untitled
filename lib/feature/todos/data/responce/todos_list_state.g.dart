// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodosListStateImpl _$$TodosListStateImplFromJson(Map<String, dynamic> json) =>
    _$TodosListStateImpl(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLastPage: json['isLastPage'] as bool,
      currentPage: (json['currentPage'] as num).toInt(),
    );

Map<String, dynamic> _$$TodosListStateImplToJson(
        _$TodosListStateImpl instance) =>
    <String, dynamic>{
      'todos': instance.todos,
      'isLastPage': instance.isLastPage,
      'currentPage': instance.currentPage,
    };
