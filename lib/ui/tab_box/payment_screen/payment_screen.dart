import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/cubits/get_card/get_card_cubit.dart';
import 'package:seven_exam/cubits/get_card/get_card_state.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/constants.dart';
import 'package:seven_exam/utils/images.dart';
import 'package:seven_exam/utils/my_utils.dart';
import 'package:seven_exam/widgets/global_button.dart';
import 'package:seven_exam/widgets/text_field.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

int isFavorite = 0;
final _controller = PageController();
TextEditingController priceController = TextEditingController();
List com = [
  AppImages.beeline,
  AppImages.uzmobile,
  AppImages.ucell,
  AppImages.mobiuz,
];

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Screen"),
      ),
      body:
          BlocBuilder<GetCardsCubit, CardCubitState>(builder: (context, state) {
        if (state is LoadGetInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadGetInSuccess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: myHeight(context) * 0.28,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemCount: state.cardModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = state.cardModel[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            print(item.owner);
                          },
                          child: SizedBox(
                            width: double.infinity,
                            child: Stack(children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.51),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      const Color(0xffff4b1f),
                                      Color(
                                          hexColor(state.cardModel[index].color)),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                        top: 10, left: 34, bottom: 26, right: 30)
                                    .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Plastic Card",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(color: AppColors.white),
                                        ),
                                        Container(
                                          width: 60.w,
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12).r,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    item.iconImage.toString()),
                                                fit: BoxFit.cover),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(item.cardNumber.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(color: AppColors.white)),
                                    const Spacer(),
                                    SizedBox(height: 8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Card Holder name",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                            SizedBox(height: 9.h),
                                            SizedBox(
                                              width: 86.w,
                                              child: Text(item.owner.toString(),
                                                  maxLines: 2,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          color:
                                                              AppColors.white)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(width: 52),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Expiry Date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(
                                                        color: AppColors.white)),
                                            SizedBox(
                                              height: 9.h,
                                            ),
                                            Text(item.expireDate.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        color: AppColors.white))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            isFavorite=index;
                            setState(() {});
                          },
                          child: Container(
                            width: 80.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(com[index])),
                                color: index==index?Colors.white:Colors.lightGreenAccent,
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xff121212)
                                          .withOpacity(0.1),
                                      blurRadius: 4)
                                ],
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                  textInputType: TextInputType.number,
                  controller: priceController,
                  text: "Enter price",
                  onChanged: (v){
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 40.h,
                ),
                GlobalButton(
                  isActive: priceController.text.isNotEmpty,
                  buttonText: 'Pay now',
                  onTap: () {
                    if(state.cardModel[isFavorite].moneyAmount>int.parse(priceController.text)){
                      MyUtils.getMyToast(message: 'Kechirasiz sizning pulingiz yetmaydi! Boshqa kartalardan foydalaning');
                    }else{
                      MyUtils.getMyToast(message: 'Muvafiqiyatli amalga oshirildi!');
                      priceController.clear();
                    }
                  },
                )
              ],
            ),
          );
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
    return colorint;
  }
}
