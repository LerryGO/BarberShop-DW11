import 'package:flutter/material.dart';

import '../../../core/ui/barbershop_icons.dart';
import '../../../core/ui/constants.dart';
import '../widgets/home_header.dart';
import 'widgets/home_employee_tile.dart';

class HomeAdmPage extends StatelessWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsConstants.brow,
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: ColorsConstants.brow,
          ),
        ),
        onPressed: () {},
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => const HomeEmployeeTile(),
                childCount: 20),
          ),
        ],
      ),
    );
  }
}
