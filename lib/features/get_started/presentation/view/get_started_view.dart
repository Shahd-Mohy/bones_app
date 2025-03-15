import 'package:bones_app/features/get_started/presentation/view/widgets/get_started_view_body.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key, required this.userType});
    final String userType;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: GetStartedViewBody(userType: userType,));
  }
}
