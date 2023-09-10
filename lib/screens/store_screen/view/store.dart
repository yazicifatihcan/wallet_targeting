import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/other/field_tile.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
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
      body: Obx(()=>
      controller.loadingStatus!=LoadingStatus.Loaded ? const SizedBox.shrink() : 
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [SizedBox(
                  width: double.infinity,
                  height: 180.verticalScale,
                  child: PageView(
                        onPageChanged: (page) => controller.selectedIndex = page,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                          controller.carousel.length,
                          (index) => GestureDetector(
                            onTap: ()=>controller.onTapStoreCard(controller.carousel[index].id!),
                            child: Image.network(
                              controller.carousel[index].imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                ),
              const SizedBox(
                height: paddingXS,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    controller.carousel.length,
                    (index) => Obx(()=>DotIndicator(
                          isSelected: index == controller.selectedIndex,
                        ))),
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
                          itemBuilder: (context, index) {

                            final item = controller.storeItems[index];

                            return GestureDetector(
                              onTap: ()=>controller.onTapStoreCard(item.id!),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(radiusM),
                                        image: DecorationImage(
                                            image: Image.network(
                                                    item.imageUrl!)
                                                .image,
                                            fit: BoxFit.cover),
                                      ),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: 150.horizontalScale,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: paddingXXXS,
                                    ),
                                    Center(
                                      child: Text(
                                        item.title!,
                                        style: s16W700Dark.copyWith(color: AppColor.grey),
                                      ),
                                    ),
                                  ],
                                ),
                            );},
                          separatorBuilder: (context, index) => const SizedBox(
                                height: paddingXL,
                              ),
                          itemCount: controller.storeItems.length),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
