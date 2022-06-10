part of 'food_bloc.dart';

@immutable
abstract class FoodState {}

class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodSuccess extends FoodState {
  final FoodResponse? foodResponse;
  FoodSuccess({this.foodResponse});
}

class FoodError extends FoodState {
  final String? error;
  FoodError({this.error});
}
