import 'package:bones_app/constants.dart';
import 'package:bones_app/core/utils/styles.dart';
import 'package:bones_app/features/profile/presentation/view_model/cubit/uploaded_image_cubit.dart';
import 'package:bones_app/features/profile/presentation/view/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({Key? key}) : super(key: key);

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  Map<String, String>? userData;

  @override
  void initState() {
    super.initState();
    _loadUserDataAndImages();
  }

  Future<void> _loadUserDataAndImages() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      'name': prefs.getString('user_name') ?? 'Unknown',
      'email': prefs.getString('user_email') ?? 'Unknown',
      'phone': prefs.getString('user_phone') ?? 'Unknown',
    };
    final userStringId = prefs.getString('userStringId');
    setState(() {
      userData = data;
    });

    if (userStringId != null) {
      context.read<UploadedImagesCubit>().loadImages(userStringId);
    } else {
      context
          .read<UploadedImagesCubit>()
          .emit(UploadedImagesError('User ID not found.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (userData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: kPrimaryColor.withOpacity(0.2),
            maxRadius: 90,
            child: Lottie.asset("assets/animations/profile_avatar.json"),
          ),
          Divider(
            thickness: 1.2,
            color: Colors.grey.shade300,
            indent: screenWidth * 0.1,
            endIndent: screenWidth * 0.1,
          ),
          const SizedBox(height: 24),
          ProfileInfoCard(
            icon: Icons.person_outline,
            title: 'Name',
            value: userData!['name']!,
          ),
          const SizedBox(height: 16),
          ProfileInfoCard(
            icon: Icons.email_outlined,
            title: 'Email',
            value: userData!['email']!,
          ),
          const SizedBox(height: 16),
          ProfileInfoCard(
            icon: Icons.phone_outlined,
            title: 'Phone',
            value: userData!['phone']!,
          ),
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Uploaded Images",
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 12),
          BlocBuilder<UploadedImagesCubit, UploadedImagesState>(
            builder: (context, state) {
              if (state is UploadedImagesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is UploadedImagesLoaded) {
                if (state.images.isEmpty) {
                  return const Text("No uploaded images.");
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final img = state.images[index];

                    // 🛠️ Fix path: replace `\` with `/` and add domain
                    final fixedPath = img.imageUrl.replaceAll(r'\', '/');
                    final fullImageUrl = 'https://bones.runasp.net$fixedPath';

                    return Container(
                      key: ValueKey(img.id),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          fullImageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image);
                          },
                        ),
                      ),
                    );
                  },
                );
              } else if (state is UploadedImagesError) {
                return Text(state.message);
              } else {
                return const Text("No images found.");
              }
            },
          ),
        ],
      ),
    );
  }
}
