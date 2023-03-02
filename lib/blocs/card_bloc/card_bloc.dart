import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_exam/blocs/card_bloc/card_event.dart';
import 'package:seven_exam/blocs/card_bloc/card_state.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/data/repositories/card_repository.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc({required this.cardRepository}) : super(CardInitial()){
    on<AddCard>(addCard);
    on<UpdateCard>(updateCard);
    on<DeleteCard>(deleteCard);
    // on<GetCards>(getAllCards);
  }

  final CardRepository cardRepository;

  addCard(AddCard event, Emitter<CardState> emit) async {
    emit(CardProgress());
    CardModel cardModel =  event.cardModel;
    cardRepository.addCard(cardModel: cardModel);
  }

  // getAllCards(GetCards event, Emitter<CardState> emit)  {
  //   emit(CardProgress());
  //   cardRepository.getAllCards().listen((List<CardModel> cards) {
  //      emit(CardSuccess(cards: cards));
  //   });
  // }

  updateCard(UpdateCard event, Emitter<CardState> emit) async {
    emit(CardProgress());
    cardRepository.updateCards(
        color: event.color, docId: event.docId, owner: event.owner);
  }

  deleteCard(DeleteCard event, Emitter<CardState> emit) async {
    emit(CardProgress());
    cardRepository.deleteCard(docId: event.docId);
  }
}
