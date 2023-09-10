part of '../home.dart'; 
class _AvailableView extends StatelessWidget {

  final HomeController controller;
  const _AvailableView({required this.controller});
  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingM),
                    child: FieldTitle(
                      onTap: () {},
                      title: 'Your Next Goal',
                    ),
                  ),
                  const SizedBox(height: paddingM),
                  Padding(
                    padding: const EdgeInsets.only(left: paddingM),
                    child: AspectRatio(
                      aspectRatio: 1.75,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>  CardWithProgress(
                          onTap: controller.onTapGameCard,
                          imageUrl:
                              'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
                          currentProgress: 75,
                          totalProgress: 100,
                          gameName: 'Grand Thieft Auto 5',
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: paddingXS,
                        ),
                        itemCount: 5,
                      ),
                    ),
                  ),
                  const SizedBox(height: paddingXL),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingM),
                    child: FieldTitle(
                      onTap: () {},
                      title: 'My Games ',
                    ),
                  ),
                  const SizedBox(height: paddingXL),
                  Padding(
                    padding: const EdgeInsets.only(left: paddingM),
                    child: AspectRatio(
                      aspectRatio: 3,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => _GameCard(
                          onTap: controller.onTapGameCard,
                          imageUrl:
                              'https://fastly.picsum.photos/id/468/200/300.jpg?hmac=_y9LVzJfrmELvOun_dpNOKoPajv8_vT3t3IPS6Jbhk4',
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: paddingXS,
                        ),
                        itemCount: 5,
                      ),
                    ),
                  ),
                ],
              );
  }
}