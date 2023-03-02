
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/style.dart';

class CardInputComponent extends StatefulWidget {
  const CardInputComponent(
      {Key? key,
        required this.cardText,
        required this.initialValue})
      : super(key: key);

  final ValueChanged<String> cardText;
  final String initialValue;

  @override
  State<CardInputComponent> createState() => _CardInputComponentState();
}

class _CardInputComponentState extends State<CardInputComponent> {
  late MaskTextInputFormatter cardMaskInputFormatter;
  final FocusNode cardFocusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  @override
  void initState(){
    cardMaskInputFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {
        '#': RegExp(r'[0-9]'),
      },
    );
    controller.text = cardMaskInputFormatter.maskText(widget.initialValue);
    super.initState();
  }
  @override
  void dispose(){
    cardFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Text('Card Number',
              style: MyTextStyle.aeonikSemiBold.copyWith(
                  color: AppColors.neutral1.withOpacity(0.8), fontSize: 16),),
            Text("*",
              style: MyTextStyle.aeonikBold.copyWith(color: AppColors.error),),
          ],
        ),
        const SizedBox(height: 10),
        Material(
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.blue.withOpacity(0.12),
          elevation: 25,
          child: TextField(
            controller: controller,
            inputFormatters: [cardMaskInputFormatter],
            keyboardType:const TextInputType.numberWithOptions(
              signed: false,
              decimal: true
            ),
            cursorColor: AppColors.white,
            focusNode: cardFocusNode,
            onChanged: (String value){
              setState(() {
                if(value.length==19){
                  cardFocusNode.unfocus();
                }
                widget.cardText.call(value);
              });
            },
            style: MyTextStyle.aeonikSemiBold.copyWith(
              fontSize: 27.sp,
              color: AppColors.white
            ),
            decoration: InputDecoration(
              hintText: 'Card Number',
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: MyTextStyle.aeonikSemiBold
                  .copyWith(color: AppColors.neutral7, fontSize: 16),

              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.neutral8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: AppColors.error),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: AppColors.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


