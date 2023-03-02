import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_exam/cubits/get_card/get_card_state.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/data/repositories/card_repository.dart';


class GetCardsCubit extends Cubit<CardCubitState> {
  GetCardsCubit(
      this.cardRepository,
      ) : super(InitialGetAppointments()) {
    fetchAllAppointments();
  }

  final CardRepository cardRepository;

  fetchAllAppointments() {
    emit(LoadGetInProgress());
    cardRepository
        .getAllCards()
        .listen((List<CardModel> cardModel) {
      emit(LoadGetInSuccess(cardModel: cardModel));
    });
  }


}
