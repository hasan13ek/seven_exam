import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_exam/cubits/get_favorite/get_favorite_state.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/data/repositories/card_repository.dart';


class FavoriteCardsCubit extends Cubit<FavoriteCubitState> {
  FavoriteCardsCubit(
      this.cardRepository,
      ) : super(InitialGetFavorite()) {
    fetchAllFavoriteCards();
  }

  final CardRepository cardRepository;

  fetchAllFavoriteCards() {
    emit(LoadGetFavoriteInProgress());
    cardRepository
        .getAllFavorite()
        .listen((List<CardModel> favoriteCardModel) {
      emit(LoadGetFavoriteInSuccess(favoriteCardModel: favoriteCardModel));
    });
  }
}
