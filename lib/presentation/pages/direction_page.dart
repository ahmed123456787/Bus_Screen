import 'package:flutter/material.dart';
import 'package:itrans/presentation/widgets/body.dart';
import 'package:itrans/presentation/widgets/footer_direction.dart';
import 'package:itrans/presentation/widgets/header.dart';

class Direction_page extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey<BodyState> bodyKey;

  const Direction_page(
      {required this.scrollController, required this.bodyKey, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Header(),
          Body(
            scrollController: scrollController,
            key: bodyKey,
            storageKey: const PageStorageKey('BodyScrollPosition'),
          ),
          const FooterDirection(),
        ],
      ),
    );
  }
}
