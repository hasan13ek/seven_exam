import 'package:seven_exam/data/models/card_model.dart';

abstract class CardCubitState{}

class InitialGetAppointments extends CardCubitState {}

class LoadGetInProgress extends CardCubitState {}

class LoadGetInSuccess extends CardCubitState {
  LoadGetInSuccess({required this.cardModel});

  final List<CardModel> cardModel;
}

class LoadGetInFailure extends CardCubitState  {
  LoadGetInFailure({required this.error});

  final String error;
}
