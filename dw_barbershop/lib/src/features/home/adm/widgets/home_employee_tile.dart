import 'package:flutter/material.dart';

import '../../../../core/ui/barbershop_icons.dart';
import '../../../../core/ui/constants.dart';

class HomeEmployeeTile extends StatelessWidget {
  final imageNetwork = false;
  const HomeEmployeeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorsConstants.grey,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: switch (imageNetwork) {
                true => const NetworkImage('url'),
                false => const AssetImage(
                    ImageConstants.avatar,
                  ),
              } as ImageProvider),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nome e sobrenome',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('AGENDAR'),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('VER AGENDA'),
                    ),
                    const Icon(
                      BarbershopIcons.penEdit,
                      color: ColorsConstants.brow,
                      size: 16,
                    ),
                    const Icon(
                      BarbershopIcons.trash,
                      color: Colors.red,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
