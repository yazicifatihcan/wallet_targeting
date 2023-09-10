import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';
import 'package:flutter_base_project/app/theme/color/app_colors.dart';
import 'package:flutter_base_project/app/theme/text_style/text_style.dart';
import 'package:flutter_base_project/screens/navigation/drawer/drawer_item/drawer_screen.dart';
import 'package:get/get.dart';
import '../../../app/components/app_bar/general_app_bar.dart';
import '../../../app/components/button/two_option_switch_button.dart';
import '../../../app/components/card/card_with_progress.dart';
import '../../../app/components/other/field_tile.dart';
import '../../../app/components/other/progress_widget.dart';
import '../../../app/constants/other/padding_and_radius_size.dart';
import '../controller/home_controller.dart';

part 'components/game_card.dart';
part 'components/available_view.dart';
part 'components/unavailable_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: GeneralAppBar(
        imageUrl: 'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
        onTapHamburger: controller.onTapDrawer,
        title: 'Game Launcher',
      ),
      endDrawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: paddingXL),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: s28W500LightPrimary,
                    ),
                    Text('dev@claudepeak.com', style: s28W800LightPrimary),
                    const SizedBox(height: paddingM),
                    Obx(() => TwoOptionSwitchButton(
                          firstTitle: 'Available',
                          secondTitle: 'Unavailable',
                          onTapSwitch: controller.onTapChangeTab,
                          selectedValue: controller.selectedIndex,
                        )),
                    const SizedBox(height: paddingM),
                  ],
                ),
              ),
              Obx(() => controller.selectedIndex == 0
                  ? _AvailableView(
                      controller: controller,
                    )
                  : _UnavailableView(
                      controller: controller,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
