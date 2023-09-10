import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/constants/assets/assets.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/libs/app/size_config.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../app/components/button/base_button.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../controller/game_detail_controller.dart';

class GameDetail extends StatelessWidget {
  const GameDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GameDetailController>();
    return Scaffold(
      key: controller.scaffoldKey,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: paddingXL,horizontal: paddingM),
        child: BaseButton.primary(txt: 'GET NFT ON STORE'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
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
                          image: Image.network(
                                  'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4')
                              .image,
                          fit: BoxFit.cover),
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
                    child:  GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: CircleAvatar(
                        backgroundColor: AppColor.lootInfo,
                        child: const Center(
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 160.verticalScale,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: paddingM),
                      child: Text(
                        'Destiny 2',
                        style: s44W800White,
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
                          Text('Rewards',style: s16W700Dark.copyWith(color: Colors.white),),
                          const SizedBox(height: paddingXS,),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(lootIcon),
                                    const SizedBox(width: paddingXXS,),
                                    Text('Lootbox',style: s16W700Dark.copyWith(color: Colors.white),),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    SvgPicture.asset(scoreIcon),
                                    const SizedBox(width: paddingXXS,),
                                    Flexible(child: Text('Gamer Score +100',style: s16W700Dark.copyWith(color: Colors.white),)),
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
            const SizedBox(height: paddingM,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingM),
              child: Text('Criteria for playing',style: s22W600Dark.copyWith(color: Colors.white),),
            ),
            const SizedBox(height: paddingXS,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingM),
              child: Text('To be able to play the relevant game, you need to own any of the following NFTs, either previously or currently.',style: s14W300Dark.copyWith(color: Colors.white),),
            ),
            const SizedBox(height: paddingXS,),
            Padding(
                padding: const EdgeInsets.only(left: paddingM),
                child: AspectRatio(
                  aspectRatio: 2,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radiusM),
                        image: DecorationImage(
                            image: Image.network(
                              'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
                            ).image,
                            fit: BoxFit.cover),
                      ),
                      child: SizedBox(
                        height: 120.verticalScale,
                        width: 120.horizontalScale,
                      ),
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: paddingXS,
                    ),
                    itemCount: 5,
                  ),
                ),
              ),
              const SizedBox(height: paddingXL,),
          ],
        ),
      ),
    );
  }
}
