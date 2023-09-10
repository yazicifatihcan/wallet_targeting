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
              itemBuilder: (context, index) {
                final item = controller.notAvailableAllStore[index];
                return CardWithProgress(
                  onTap: ()=>controller.onTapGameCard(item.id!),
                  imageUrl: item.imageUrls![0],
                  currentProgress: 75,
                  totalProgress: 100,
                  gameName: item.title!,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: paddingXS,
              ),
              itemCount: controller.notAvailableAllStore.length,
            ),
          ),
        ),
        const SizedBox(height: paddingXL),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingM),
          child: FieldTitle(
            onTap: () {},
            title: 'Earned Rewards',
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
              itemBuilder: (context, index) {
                final item = controller.availableAllStore[index];
                return _GameCard(
                  onTap: ()=>controller.onTapGameCard(item.id!),
                  imageUrl: item.imageUrls![0],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: paddingXS,
              ),
              itemCount: controller.availableAllStore.length,
            ),
          ),
        ),
      ],
    );
  }
}
