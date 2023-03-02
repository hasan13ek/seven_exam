import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/utils/my_utils.dart';

class CardRepository {
  late FirebaseFirestore _firestore;

  CardRepository({required FirebaseFirestore firebaseFirestore}) {
    _firestore = firebaseFirestore;
  }

  Future<void> addCard(
      {required CardModel cardModel}) async {
    try {
      DocumentReference newCards =
      await _firestore.collection("cards").add(cardModel.toJson());
      await _firestore
          .collection("cards")
          .doc(newCards.id)
          .update({
        "cardId": newCards.id,
      });
      MyUtils.getMyToast(message: "qo'shildi!");
      debugPrint(
          "Qo'shildi-----------=================================================================================");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
      debugPrint(er.toString());
    }
  }

  Stream<List<CardModel>> getAllCards() => _firestore
      .collection("cards")
      .snapshots()
      .map(
        (querySnapshot) => querySnapshot.docs
        .map((doc) => CardModel.fromJson(doc.data()))
        .toList(),
  );


  Future<void> updateCards(
      {required var gradient, required String docId,required String owner}) async {
    try {
      await _firestore.collection("cards").doc(docId).update({
        "gradient": gradient,
        "owner": owner,
      });
      MyUtils.getMyToast(message: "Yangilandi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
      debugPrint(er.toString());
    }
  }


  Future<void> deleteCard({required String docId}) async {
    try {
      await _firestore.collection("cards").doc(docId).delete();
      MyUtils.getMyToast(message: "o'chirildi!");
    } on FirebaseException catch (er) {
      MyUtils.getMyToast(message: er.message.toString());
    }
  }


}
