part of '../home.dart'; 
class _GameCard extends StatelessWidget {

  final String imageUrl;
  final VoidCallback onTap;

  const _GameCard({required this.imageUrl, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radiusM),
                          image: DecorationImage(
                              image: Image.network(
                                imageUrl,
                              ).image,
                              fit: BoxFit.cover),
                        ),
                        child: SizedBox(
                          height: 110.verticalScale,
                          width: 90.horizontalScale,
                        ),
                      ),
    );
  }
}