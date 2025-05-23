import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/Specialists_list_view.dart';
import 'package:bones_app/features/consultation/presentation/view/widgets/custom_search_bar.dart';
import 'package:bones_app/features/consultation/presentation/view_model/cubit/specialist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsultationViewBody extends StatelessWidget {
  const ConsultationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            children: [
              CustomSearchBar(
                onChanged: (query) {
                  context.read<SpecialistCubit>().searchSpecialists(query);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Specialists For you ",
                      style: Styles.textStyle15.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              const SpecialistsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
