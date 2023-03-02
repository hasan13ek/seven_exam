import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/style.dart';

class UpdateCardScreen extends StatefulWidget {
   UpdateCardScreen({Key? key,required this.cardModel}) : super(key: key);
  CardModel cardModel;

  @override
  State<UpdateCardScreen> createState() => _UpdateCardScreenState();
}

class _UpdateCardScreenState extends State<UpdateCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Card Screen"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 220.h,
                width: double.infinity,
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.51),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffff4b1f),
                            Color(hexColor(widget.cardModel.color)),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 34, bottom: 26, right: 20).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Credit Card",
                              style: MyTextStyle.aeonikSemiBold.copyWith(
                                  fontSize: 16.sp, color: AppColors.white),
                            ),
                            Container(
                              width: 60.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).r,
                                  image: DecorationImage(
                                      image: AssetImage(widget.cardModel.iconImage.toString()),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          widget.cardModel.cardNumber.toString(),
                          style: MyTextStyle.aeonikSemiBold.copyWith(
                              fontSize: 22.sp, color: AppColors.white),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder name",
                                  style: MyTextStyle.aeonikRegular.copyWith(
                                      fontSize: 12.sp, color: AppColors.white),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                SizedBox(
                                  width: 86.w,
                                  child: Text(
                                    widget.cardModel.owner.toString(),
                                    maxLines: 2,
                                    style: MyTextStyle.aeonikSemiBold.copyWith(
                                        fontSize: 16.sp,
                                        color: AppColors.white),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 52.5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Expiry Date",
                                  style: MyTextStyle.aeonikRegular.copyWith(
                                      fontSize: 12.sp, color: AppColors.white),
                                ),
                                SizedBox(
                                  height: 9.h,
                                ),
                                Text(
                                  widget.cardModel.expireDate.toString(),
                                  style: MyTextStyle.aeonikSemiBold.copyWith(
                                      fontSize: 16.sp, color: AppColors.white),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              
            ],
          ),
        ),
      )
    );
  }

  hexColor(String colorhexcode) {
    String colornew = '0xff$colorhexcode';
    colornew = colornew.replaceAll(")", "");
    int colorint = int.parse(colornew);
    print(colorint);
    return colorint;
  }
}
