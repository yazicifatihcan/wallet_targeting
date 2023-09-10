import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';

import '../../constants/other/padding_and_radius_size.dart';
import '../../navigation/route/route_factory.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? txt;
  final Widget? widget;
  final Color? buttonBgColor;
  final Color? buttonBorderColor;
  final Color? txtColor;
  final EdgeInsets? padding;
  final EdgeInsets? contactPadding;
  final TextStyle? textStyle;
  final Key? buttonKey;
  final double? height;
  final double? borderWidth;
  final double? width;

  const BaseButton({
    Key? key,
    required this.onTap,
    this.txt = '',
    this.height,
    this.width,
    this.buttonBgColor,
    this.buttonBorderColor,
    this.widget,
    this.padding,
    this.contactPadding,
    this.textStyle,
    this.buttonKey,
    this.txtColor,
    this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          key: buttonKey,
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonBgColor),
            side: MaterialStateProperty.all(
              BorderSide(color: buttonBorderColor ?? Colors.transparent, width: borderWidth ?? 1),
            ),
          ),
          child: Padding(
            padding: contactPadding ?? EdgeInsets.symmetric(vertical: paddingM),
            child: widget ??
                Text(
                  txt!,
                  style: textStyle?.copyWith(color: txtColor ?? Colors.white) ??
                      s16W700Dark.copyWith(color: txtColor ?? Colors.white),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      ),
    );
  }

  factory BaseButton.primary({
    VoidCallback? onTap,
    required String txt,
    bool isDisabled=false,
  }) =>
      BaseButton(
        onTap: onTap,
        txt: txt,
        width: double.infinity,
        buttonBgColor: isDisabled ? Colors.black12 :  Theme.of(MyRouteFactory.context).colorScheme.primary,
        txtColor: isDisabled ? Colors.black26 : null,
      );

  factory BaseButton.secondary({
    VoidCallback? onTap,
    required String txt,
    bool isDisabled=false,
  }) =>
      BaseButton(
        onTap:  onTap,
        txt: txt,
        buttonBgColor: isDisabled ? Colors.black12 :  Colors.transparent,
        buttonBorderColor: isDisabled ? Colors.transparent : Colors.white,
        txtColor: Colors.white,
        width: double.infinity,
        borderWidth: 2,
      );

}
