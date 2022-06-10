import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:food_id_homepage/models/food_response.dart';
import 'package:food_id_homepage/services/food_service.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial());

  @override
  Stream<FoodState> mapEventToState(
    FoodEvent event,
  ) async* {
    if (event is GetFoodEvent) {
      try {
        yield FoodLoading();

        FoodResponse foodResponse = await FoodService().getFoodData();

        if (foodResponse != null) {
          yield FoodSuccess(foodResponse: foodResponse);
        } else {
          log("data response null");
        }
      } catch (e) {
        FoodError(error: e.toString());
      }
    }
  }
}
