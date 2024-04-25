import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(

      color: Colors.white,
      child: TabBar(

        isScrollable: true,
        tabs: [
          Tab(child: Text('Sports')),
          Tab(text: 'Furniture'),
          Tab(text: 'Electronics'),
          Tab(text: 'Clothes'),
          Tab(text: 'Cosmetics'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
