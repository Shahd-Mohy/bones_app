import 'package:bones_app/features/consultation/presentation/view/widgets/specalist_list_item.dart';
import 'package:flutter/material.dart';

class SpecialistsListView extends StatelessWidget {
  const SpecialistsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        physics:
            const NeverScrollableScrollPhysics(), 
        shrinkWrap: true, 
        itemCount: 10,
        itemBuilder: (context, index) {
          return const SpecialistListItem();
        },
      ),
    );
  }
}
