import 'package:seven_exam/data/models/card_model.dart';

abstract class FavoriteCubitState{}

class InitialGetFavorite extends FavoriteCubitState {}

class LoadGetFavoriteInProgress extends FavoriteCubitState {}

class LoadGetFavoriteInSuccess extends FavoriteCubitState {
  LoadGetFavoriteInSuccess({required this.favoriteCardModel});

  final List<CardModel> favoriteCardModel;
}

class LoadGetFavoriteInFailure extends FavoriteCubitState  {
  LoadGetFavoriteInFailure({required this.error});

  final String error;
}
