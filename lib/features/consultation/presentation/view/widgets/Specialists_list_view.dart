import 'package:bones_app/features/consultation/presentation/view/widgets/specalist_list_item.dart';
import 'package:flutter/material.dart';

class SpecialistsListView extends StatelessWidget {
  const SpecialistsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SpecialistListItem();
        },
      ),
    );
  }
}
