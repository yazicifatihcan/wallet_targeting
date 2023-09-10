import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/nft_detail_controller.dart';
import 'view/nft_detail.dart';

class NftDetailScreen extends StatelessWidget {
  const NftDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NftDetailController(id: ModalRoute.of(context)!.settings.arguments as String),
      builder: (_) => const NftDetail(),
    );
  }
}