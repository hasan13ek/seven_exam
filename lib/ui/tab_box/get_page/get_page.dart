import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/blocs/card_bloc/card_bloc.dart';
import 'package:seven_exam/blocs/card_bloc/card_event.dart';
import 'package:seven_exam/cubits/get_card/get_card_cubit.dart';
import 'package:seven_exam/cubits/get_card/get_card_state.dart';
import 'package:seven_exam/cubits/get_favorite/get_favorite_cubit.dart';
import 'package:seven_exam/ui/tab_box/favorite_page/favorite_page.dart';
import 'package:seven_exam/ui/tab_box/update_page/update_page.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/style.dart';

class GetAllCardsScreen extends StatefulWidget {
  const GetAllCardsScreen({Key? key}) : super(key: key);

  @override
  State<GetAllCardsScreen> createState() => _GetAllCardsScreenState();
}

bool isFavorite = false;
bool isPass = false;

class _GetAllCardsScreenState extends State<GetAllCardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get All Cards"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => GetFavoriteCards()));
              },
              icon: Icon(
                Icons.favorite,
                size: 30,
              ))
        ],
      ),
      body:
          BlocBuilder<GetCardsCubit, CardCubitState>(builder: (context, state) {
        if (state is LoadGetInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadGetInSuccess) {
          return ListView.builder(
              itemCount: state.cardModel.length,
              itemBuilder: (BuildContext context, int index) {
                var item = state.cardModel[index];
                // var c = state.cardModel[index].color.replaceAll(')', '');
                return
                  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
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
                                Color(hexColor(state.cardModel[index].color)),
                              ]),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                                top: 4, left: 34, bottom: 26, right: 20)
                            .r,
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
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFavorite =! isFavorite;
                                    });
                                    BlocProvider.of<CardBloc>(context).add(
                                      UpdateFavorite(
                                          favorite: isFavorite,
                                          docId: state.cardModel[index].cardId),
                                    );
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: isFavorite == false
                                        ? Colors.white
                                        : Colors.red,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){
                                  setState(() {
                                    isPass=!isPass;
                                  });
                                }, icon: Icon(isPass?Icons.visibility:Icons.visibility_off,color: Colors.white,)),
                                Visibility(visible: isPass,child: Text(item.moneyAmount.toString(),style: const TextStyle(color: Colors.white),),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.cardNumber.toString().replaceRange(5, 14, '**** **** '),
                                  style: MyTextStyle.aeonikSemiBold.copyWith(
                                      fontSize: 22.sp, color: AppColors.white),
                                ),
                                Container(
                                  width: 60.w,
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12).r,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              item.iconImage.toString()),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    SizedBox(
                                      width: 86.w,
                                      child: Text(
                                        item.owner.toString(),
                                        maxLines: 2,
                                        style: MyTextStyle.aeonikSemiBold
                                            .copyWith(
                                                fontSize: 16.sp,
                                                color: AppColors.white),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 42.5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 9.h,
                                    ),
                                    Text(
                                      item.expireDate.toString(),
                                      style: MyTextStyle.aeonikSemiBold
                                          .copyWith(
                                              fontSize: 16.sp,
                                              color: AppColors.white),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0,top: 4).r,
                                  child: IconButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return CupertinoAlertDialog(
                                                title: const Text(
                                                  "o'chirmoqchimisiz?",
                                                ),
                                                actions: [
                                                  CupertinoDialogAction(
                                                    child: const Text("yoq"),
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  CupertinoDialogAction(
                                                    child: const Text(
                                                      "ha",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    onPressed: () {
                                                      BlocProvider.of<CardBloc>(
                                                              context)
                                                          .add(
                                                        DeleteCard(
                                                            docId: state
                                                                .cardModel[
                                                                    index]
                                                                .cardId),
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        size: 24.w,
                                        color: Colors.white,
                                      )),
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => UpdateCardScreen(
                                            cardModel: item,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit_outlined,
                                      size: 24.w,
                                      color: Colors.white,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                );
              });
        }
        return const Center(
          child: Text('Oxirgi return'),
        );
      }),
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
