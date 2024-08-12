import 'package:flutter/material.dart';

import '../../../core/ui/barbershop_icons.dart';
import '../../../core/ui/constants.dart';

class HomeHeader extends StatelessWidget {
  final bool showFilter;

  const HomeHeader({super.key}) : showFilter = true;
  const HomeHeader.withoutFilter({super.key}) : showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(
            ImageConstants.backgroundChair,
          ),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xFFbdbdbd),
                  child: SizedBox.shrink(),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Flexible(
                  child: Text(
                    'Andrea',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Expanded(
                  child: Text(
                    'Editar',
                    style: TextStyle(
                      color: ColorsConstants.brow,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    BarbershopIcons.exit,
                    color: ColorsConstants.brow,
                    size: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Bem-Vindo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Agende um Cliente',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Offstage(
              offstage: !showFilter,
              child: const SizedBox(
                height: 24,
              ),
            ),
            Offstage(
              offstage: !showFilter,
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Buscar Colaborador',
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 24.0),
                    child: Icon(
                      BarbershopIcons.search,
                      color: ColorsConstants.brow,
                      size: 26,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
