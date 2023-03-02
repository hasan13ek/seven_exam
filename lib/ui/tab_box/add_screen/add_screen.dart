import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:seven_exam/blocs/card_bloc/card_bloc.dart';
import 'package:seven_exam/blocs/card_bloc/card_event.dart';
import 'package:seven_exam/data/models/card_model.dart';
import 'package:seven_exam/ui/tab_box/add_screen/widget/card_expire_date.dart';
import 'package:seven_exam/ui/tab_box/add_screen/widget/card_input_component.dart';
import 'package:seven_exam/ui/tab_box/add_screen/widget/card_item.dart';
import 'package:seven_exam/ui/tab_box/add_screen/widget/darwer_baner.dart';
import 'package:seven_exam/ui/tab_box/add_screen/widget/drawer_body.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/images.dart';
import 'package:seven_exam/utils/style.dart';
import 'package:seven_exam/widgets/global_button.dart';
import 'package:seven_exam/widgets/text_field.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

TextEditingController fullNameController = TextEditingController();
String expiryDate = '';
String cardNumber = '';
String dropdownValue = 'UzCard';
var cards = [
  AppImages.uzcard,
  AppImages.humo,
  AppImages.matercard,
  AppImages.visa,
];

// create some values
Color currentColor = Color(0xff66ff00);
Color pickerColor = Color(0xff66ff00);
GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

bool isOn = false;

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.drag_handle_sharp)),
      ),
      key: scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerBaner(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 4.0).r,
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
                            pickerColor,
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                            top: 10, left: 34, bottom: 26, right: 20)
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
                            Container(
                              width: 60.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).r,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          dropdownValue.length == 6
                                          ? AppImages.uzcard
                                          : dropdownValue.length == 4
                                              ? AppImages.humo
                                              : dropdownValue.length == 5
                                                  ? AppImages.visa
                                                  : dropdownValue.length == 10
                                                      ? AppImages.matercard
                                                      : AppImages.uzcard),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          cardNumber.isEmpty
                              ? 'xxxx xxxx xxxx xxxx'
                              : cardNumber.length == 19
                                  ? cardNumber.replaceRange(5, 14, '**** ****')
                                  : cardNumber,
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
                                    fullNameController.text,
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
                                  expiryDate,
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







              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 40.h,
                child: GlobalButton(
                  isActive: true,
                  buttonText: 'color edit',
                  onTap: () {
                    showDialog(
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text('Got it'),
                                onPressed: () {
                                  setState(() => currentColor = pickerColor);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                        context: context);
                  },
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              MyTextField(
                onChanged: (v) {
                  setState(() {});
                },
                controller: fullNameController,
                textInputType: TextInputType.text,
                text: 'Full name',
              ),
              SizedBox(
                height: 24.h,
              ),
              CardNumber(
                  cardNumber: (cardNumber1) {
                    setState(() {
                      cardNumber = cardNumber1;
                    });
                  },
                  initialValue: ''),
              SizedBox(
                height: 20.h,
              ),
              CardInputExpiryDate(
                  cardExpiryDate: (cardExpiryDate) {
                    setState(() {
                      expiryDate = cardExpiryDate;
                    });
                  },
                  initialValue: ''),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0).r,
                child: myDropDown(),
              ),
              SizedBox(
                height: 132.h,
              ),
              SizedBox(
                width: 380.w,
                child: GlobalButton(
                  isActive: expiryDate.length == 5 &&
                      cardNumber.length == 19 &&
                      dropdownValue.isNotEmpty &&
                      fullNameController.text != '',
                  buttonText: 'Add Card',
                  onTap: () async {
                    CardModel cardModel = await CardModel(
                      cardId: '',
                      color: pickerColor.toString().replaceRange(0, 10, ''),
                      cardNumber: cardNumber,
                      moneyAmount: 'moneyAmount',
                      owner: fullNameController.text,
                      expireDate: expiryDate,
                      iconImage:  dropdownValue.length == 6
                          ? AppImages.uzcard
                          : dropdownValue.length == 4
                          ? AppImages.humo
                          : dropdownValue.length == 5
                          ? AppImages.visa
                          : dropdownValue.length == 10
                          ? AppImages.matercard
                          : AppImages.uzcard,
                      userId: '',
                      cardName: dropdownValue,
                    );
                    BlocProvider.of<CardBloc>(context)
                        .add(AddCard(cardModel: cardModel));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Widget myDropDown() {
    return SizedBox(
      height: 82.h,
      // width: 190,
      child: DropdownButtonFormField(
        // elevation: 10,
        borderRadius: BorderRadius.circular(30),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral4, width: 1.w),
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.neutral4, width: 1.w),
              borderRadius: BorderRadius.circular(30).r),
          filled: true,
        ),
        dropdownColor: AppColors.white,
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'UzCard',
          'Humo',
          'MasterCard',
          'Visaa',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: MyTextStyle.aeonikSemiBold.copyWith(
                      color: dropdownValue == dropdownValue
                          ? AppColors.neutral5
                          : AppColors.black,
                      fontSize: 14.sp),
                ),
                Image.asset(
                    cards[value.length == 6
                        ? 0
                        : value.length == 4
                            ? 1
                            : value.length == 10
                                ? 2
                                : value.length == 5
                                    ? 3
                                    : 0],
                    width: 40.w,
                    height: 40.h)
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
