import 'package:seven_exam/data/models/card_model.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardProgress extends CardState {}

class CardSuccess extends CardState {
  final List<CardModel> cards;
  CardSuccess({required this.cards});
}

class CardFailure extends CardState {}
