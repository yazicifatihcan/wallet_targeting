import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/game_detail_controller.dart';
import 'view/game_detail.dart';

class GameDetailScreen extends StatelessWidget {
  const GameDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: GameDetailController(id: ModalRoute.of(context)!.settings.arguments as String),
      builder: (_) => const GameDetail(),
    );
  }
}