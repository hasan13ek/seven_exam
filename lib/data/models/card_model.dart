import 'dart:ui';

class CardModel {
  CardModel({
    required this.cardId,
    // required this.gradient,
    required this.cardNumber,
    required this.moneyAmount,
    required this.owner,
    required this.expireDate,
    required this.iconImage,
    required this.userId,
    required this.cardName,
    required this.color,
    required this.favorite
  });

  String cardId;
  String cardName;
  // var gradient;
  String color;
  String cardNumber;
  String moneyAmount;
  String owner;
  String expireDate;
  String iconImage;
  String userId;
  bool favorite;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
    cardId: json["cardId"],
    cardName: json["cardName"],
    color: json['color'],
    favorite: json['favorite'],
    cardNumber: json["cardNumber"],
    moneyAmount: json["moneyAmount"],
    owner: json["owner"],
    expireDate: json["expireDate"],
    iconImage: json["iconImage"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "cardId": cardId,
    "cardName":cardName,
    "color": color,
    "cardNumber": cardNumber,
    "moneyAmount": moneyAmount,
    "owner": owner,
    "expireDate": expireDate,
    "iconImage": iconImage,
    "userId": userId,
    "favorite": favorite,
  };
}