import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:get/get.dart';
import '../../../../app/components/bottom_sheet/bottom_sheet_widget.dart';
import '../../../../app/components/button/base_button.dart';
import '../../../../app/constants/other/padding_and_radius_size.dart';
import '../../../../app/theme/text_style/text_style.dart';
import 'network_card.dart';

class AvailableStoreBottomSheet<T> extends BottomSheetWidget<T> {
  Rx<int?> selectedIndex = Rx(null);

  AvailableStoreBottomSheet({
    Key? key,
  }) : super(
          key: key,
          useRootNavigator: true,
          isScrollControlled: true,
          backgroundColor: AppColor.background
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingS),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: paddingXS),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Store Choice',
                    style: s22W600Dark.copyWith(color: Colors.white),
                  ),
                ),
                GestureDetector(onTap: ()=>Navigator.pop(context),child: const Icon(Icons.close,color: Colors.white,)),
              ],
            ),
            const SizedBox(height: paddingS),
            const Divider(),
            const SizedBox(height: paddingS), // Remove extra comma
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => Obx(() => NetworkCard(
                  onTap: () => selectedIndex.value = index,
                  isSelected: index == selectedIndex.value,
                )),
                separatorBuilder: (context, index) => const SizedBox(
                  height: paddingS,
                ),
                itemCount: 2,
              ),
            ),
            const SizedBox(height: 100),
            BaseButton.primary(txt: 'Go to Store',onTap: ()=>Navigator.pop(context),),
          ], // Remove extra parenthesis
        ),
      ),
    );
  }
}
