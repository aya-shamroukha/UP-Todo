// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable




import 'package:equatable/equatable.dart';

import 'package:todo_application/domain/model/task/task_model.dart';

abstract class TaskEvent extends Equatable {
    @override
  List<Object> get props => [];
}
class ShowDateEvent extends TaskEvent{}

class ShowStartTimeEvent extends TaskEvent{}

class ShowEndTimeEvent extends TaskEvent{}

class SelectColorEvent extends TaskEvent {

  int index;
  SelectColorEvent({
    required this.index,
  });
}
class InsertTaskEvent extends TaskEvent{
  final TaskModel taskModel;

  InsertTaskEvent({required this.taskModel});


  @override
  List<Object> get props => [taskModel];
} 
class GetTasks extends TaskEvent{}
class UpDateTask extends TaskEvent {
  int id;
  UpDateTask({
    required this.id,
  });
    @override
  List<Object> get props => [id];
}
class DeleteTask extends TaskEvent {
  int id;
  DeleteTask({
    required this.id,
  });
}
class GetSelectDate extends TaskEvent {
  final date;
  GetSelectDate({
    required this.date,
  });
}
class GetTheme extends TaskEvent{}
class DarkLightMode extends TaskEvent {
  // bool dark_light;
  // DarkLightMode({
  //   required this.dark_light,
 // });
}
