import 'package:bones_app/features/consultation/presentation/view/widgets/specalist_list_item.dart';
import 'package:bones_app/features/consultation/presentation/view_model/cubit/specialist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecialistsListView extends StatelessWidget {
  const SpecialistsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecialistCubit, SpecialistState>(
      builder: (context, state) {
        if (state is SpecialistLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SpecialistSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.specialists.length,
            itemBuilder: (context, index) {
              final specialist = state.specialists[index];
              return SpecialistListItem(
                name: specialist.name,
                email: specialist.email,
                userId: specialist.userId,
              );
            },
          );
        } else if (state is SpecialistFailed) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
