import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/components/button/base_button.dart';
import 'package:flutter_base_project/app/components/other/field_tile.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:get/get.dart';
import '../../../app/components/app_bar/general_app_bar.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../../../app/theme/color/app_colors.dart';
import '../../navigation/drawer/drawer_item/drawer_screen.dart';
import '../controller/account_controller.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
    return Scaffold(
      key: controller.scaffoldKey,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingXL, horizontal: paddingM),
        child: BaseButton.secondary(txt: 'Disconnect Your Wallet'),
      ),
      appBar: GeneralAppBar(
        imageUrl: 'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
        onTapHamburger: controller.onTapDrawer,
        title: 'Account',
      ),
      endDrawer: const DrawerScreen(),
      body: Obx(() => controller.loadingStatus != LoadingStatus.Loaded
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: paddingXL),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingM),
                      child: Row(
                        children: [
                          CircleAvatar(radius: 50.horizontalScale),
                          const SizedBox(
                            width: paddingM,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Balance',
                                style: s20W400Dark.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: paddingXXXS,
                              ),
                              Text(
                                '${controller.currentUser.balance} SOL',
                                style: s44W800White,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40, horizontal: paddingM),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingM),
                      child: FieldTitle(title: 'My Items', onTap: () {}),
                    ),
                    const SizedBox(
                      height: paddingM,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: paddingM),
                      child: AspectRatio(
                        aspectRatio: 2,
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {

                            final item = controller.userItems[index];
                            return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radiusM),
                                  image: DecorationImage(
                                      image: Image.network(
                                        item.imageUrl!,
                                      ).image,
                                      fit: BoxFit.cover),
                                ),
                                child: SizedBox(
                                  height: 110.verticalScale,
                                  width: 100.horizontalScale,
                                ),
                              ),
                              const SizedBox(
                                height: paddingXS,
                              ),
                              Text(
                                item.title!,
                                style: s16W700Dark.copyWith(color: AppColor.grey),
                              ),
                            ],
                          );},
                          separatorBuilder: (context, index) => const SizedBox(
                            width: paddingXS,
                          ),
                          itemCount: controller.userItems.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    );
  }
}
