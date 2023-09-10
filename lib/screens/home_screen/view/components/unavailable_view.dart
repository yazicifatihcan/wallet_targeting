part of '../home.dart'; 
class _UnavailableView extends StatelessWidget {

  final HomeController controller;
  const _UnavailableView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingM),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FieldTitle(
                            onTap: () {},
                            title: 'Your Next Goal',
                          ),
                          const SizedBox(height: paddingM),
                          Flexible(
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: controller.onTapGameCard,
                                child: Column(
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
                                    const SizedBox(height: paddingXXXS,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Grand Thieft Auto',
                                            style: s16W700Dark.copyWith(color: AppColor.grey),
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                                      children: [
                                                        const Expanded(child: ProgressWidget(total: 100, current: 75)),
                                                        const SizedBox(
                                                          width: paddingXS,
                                                        ),
                                                        Text(
                                                          '50/100',
                                                          style: s12W500Dark.copyWith(color: AppColor.greenColor),
                                                        ),
                                                      ],
                                                    ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) => const SizedBox(
                                height: paddingXL,
                              ),
                              itemCount: 5,
                            ),
                          ),
                        ],
                      ),
                  );
  }
}