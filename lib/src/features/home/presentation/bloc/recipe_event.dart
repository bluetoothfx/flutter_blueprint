import 'package:equatable/equatable.dart';

sealed class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class RecipeInitEvent extends RecipeEvent {}

class RecipeStartEvent extends RecipeEvent {
  final bool forceRefresh;

  const RecipeStartEvent({this.forceRefresh = false});
}