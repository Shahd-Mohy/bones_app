import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/core/networking/retrieve_images_service.dart';
import 'package:bones_app/features/profile/presentation/view/widgets/logout_button.dart';
import 'package:bones_app/features/profile/presentation/view/widgets/profile_view_body.dart';
import 'package:bones_app/features/profile/presentation/view_model/cubit/uploaded_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UploadedImagesCubit(GetUploadedImagesService()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: const Text(
            "Profile",
            style: Styles.textStyle20,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const ProfileViewBody(),
        bottomNavigationBar: const LogoutButton(),
      ),
    );
  }
}
