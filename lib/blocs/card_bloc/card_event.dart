import 'package:seven_exam/data/models/card_model.dart';

abstract class CardEvent {}

class AddCard extends CardEvent {
  final CardModel cardModel;
  AddCard({required this.cardModel});
}

class UpdateCard extends CardEvent {
  final String docId;
  final String color;
  final String owner;
  UpdateCard(
      {required this.docId, required this.color, required this.owner});
}

class DeleteCard extends CardEvent {
  final String docId;
  DeleteCard({required this.docId});
}

class GetCards extends CardEvent {

}
