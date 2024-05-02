import 'package:equatable/equatable.dart';

abstract class TaskState extends Equatable {
   @override
  List<Object> get props => []; }

 class TaskBlocInitial extends TaskState {}
 //!get date
class GetDateLoadingState extends TaskState{}
class GetDateErrorState extends TaskState{}
class GetDateSuccessState extends TaskState{}

//!get start time
class GetStartTimeLoadingState extends TaskState{}
class GetStartTimeErrorState extends TaskState{}
class GetStartTimeSuccessState extends TaskState{}

//!get end time
class GetEndTimeLoadingState extends TaskState{}
class GetEndTimeErrorState extends TaskState{}
class GetEndTimeSuccessState extends TaskState{}
//!select color
// class SelectColorLoadingState extends TaskState{}
// class SelectColorErrorState extends TaskState{}
class SelectColorSuccessState extends TaskState{}
//!InsertTask
class InsertTaskLoadingState extends TaskState{}
class InsertTaskErrorState extends TaskState{}
class InsertTaskSuccessState extends TaskState{}
//!GetTask
class GetTaskLoadingState extends TaskState{}
class GetTaskErrorState extends TaskState{}
class GetTaskSuccessState extends TaskState{}
//!UpDateTask
class UpDateTaskLoadingState extends TaskState{}
class UpDateTaskErrorState extends TaskState{}
class UpDateTaskSuccessState extends TaskState{}
//!DeleteTask
class DeleteTaskLoadingState extends TaskState{}
class DeleteTaskErrorState extends TaskState{}
class DeleteTaskSuccessState extends TaskState{}

//!GetSelectDate
class GetSelectDateLoadingState extends TaskState{}
class GetSelectDateErrorState extends TaskState{}
class GetSelectDateSuccessState extends TaskState{}

//!dark light mode
class DarkLightModeSuccessState extends TaskState{}
class GetThemeSuccessState extends TaskState{}