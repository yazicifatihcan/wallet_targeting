import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/other/field_tile.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:get/get.dart';
import '../../../app/components/app_bar/general_app_bar.dart';
import '../../../app/components/other/dot_indicator.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../../../app/theme/color/app_colors.dart';
import '../../../app/theme/text_style/text_style.dart';
import '../../navigation/drawer/drawer_item/drawer_screen.dart';
import '../controller/store_controller.dart';

class Store extends StatelessWidget {
  const Store({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StoreController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: GeneralAppBar(
        imageUrl: 'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
        onTapHamburger: controller.onTapDrawer,
        title: 'Store',
      ),
      endDrawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.network(
                              'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4')
                          .image,
                      fit: BoxFit.cover),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 180.verticalScale,
                ),
              ),
              const SizedBox(
                height: paddingXS,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    4,
                    (index) => DotIndicator(
                          isSelected: index == 1,
                        )),
              ),
              const SizedBox(
                height: paddingM,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingM),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FieldTitle(title: 'Your Next Goal', onTap: () {}),
                    const SizedBox(height: paddingM),
                    Flexible(
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radiusM),
                                      image: DecorationImage(
                                          image: Image.network(
                                                  'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4')
                                              .image,
                                          fit: BoxFit.cover),
                                    ),
                                    child: SizedBox(
                                      width: 350.horizontalScale,
                                      height: 150.horizontalScale,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: paddingXXXS,
                                  ),
                                  Text(
                                    'Nft Item Name',
                                    style: s16W700Dark.copyWith(color: AppColor.grey),
                                  ),
                                ],
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: paddingXL,
                              ),
                          itemCount: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
