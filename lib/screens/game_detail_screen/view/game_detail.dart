import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/constants/enum/loading_status_enum.dart';
import 'package:flutter_base_project/app/extensions/widget_extension.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/libs/app/size_config.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../app/components/button/base_button.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../../nft_detail_screen/view/components/available_store_bottom_sheet.dart';
import '../controller/game_detail_controller.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameDetailController>();
    return Scaffold(
      key: controller.scaffoldKey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingXL, horizontal: paddingM),
        child: Obx(()=>BaseButton.primary(
          txt: 'GET NFT ON STORE',
          onTap: ()=>AvailableStoreBottomSheet().openBottomSheet(backgroundColor: AppColor.background),
        ).isVisible(controller.isAlreadyEarned()&&controller.loadingStatus==LoadingStatus.Loaded)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(()=>
      controller.loadingStatus!=LoadingStatus.Loaded ? const SizedBox.shrink() :
      SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(controller.gameDetail.imageUrls![0]).image, fit: BoxFit.cover),
                    ),
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: 440.verticalScale,
                    ),
                  ),
                ),
                Positioned(
                    top: 64.verticalScale,
                    left: paddingXXXL,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: AppColor.lootInfo,
                        child: const Center(
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    )),
                Positioned(
                    top: 64.verticalScale,
                    left: 64.horizontalScale,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingM),
                      child: Text(
                        controller.gameDetail.title!,
                        style: s26W700Dark,
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingM),
                      child: Card(
                        color: AppColor.lootInfo,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingXL),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Rewards',
                                style: s16W700Dark.copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                height: paddingXS,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(lootIcon),
                                        const SizedBox(
                                          width: paddingXXS,
                                        ),
                                        Text(
                                          'Lootbox',
                                          style: s16W700Dark.copyWith(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(scoreIcon),
                                        const SizedBox(
                                          width: paddingXXS,
                                        ),
                                        Flexible(
                                            child: Text(
                                          'Gamer Score +${controller.getRandomNumber()}',
                                          style: s16W700Dark.copyWith(color: Colors.white),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: paddingM,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingM),
              child: Text(
                'Criteria for playing',
                style: s22W600Dark.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: paddingXS,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingM),
              child: Text(
                controller.gameDetail.content!,
                style: s14W300Dark.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: paddingXS,
            ),
            Padding(
              padding: const EdgeInsets.only(left: paddingM),
              child: AspectRatio(
                aspectRatio: 2,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    final item = controller.gameCriterias[index];

                    return GestureDetector(
                      onTap: ()=>controller.onTapNfc(item.id!),
                      child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radiusM),
                        image: DecorationImage(
                            image: Image.network(
                              item.imageUrl!,
                            ).image,
                            fit: BoxFit.cover),
                      ),
                      child: SizedBox(
                        height: 120.verticalScale,
                        width: 120.horizontalScale,
                      ),
                                      ),
                    );},
                  separatorBuilder: (context, index) => const SizedBox(
                    width: paddingXS,
                  ),
                  itemCount: controller.gameCriterias.length,
                ),
              ),
            ),
            const SizedBox(
              height: paddingXL,
            ),
          ],
        ),
      )),
    );
  }
}
