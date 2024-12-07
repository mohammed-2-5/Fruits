import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_services.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';
import 'package:fruits/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits/features/auth/presentation/widgets/login_screen_body.dart';
import 'package:fruits/features/home/presentation/views/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/functions/build_error_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "login";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {

                  if (state is SignInSuccess) {
                    Navigator.pushReplacementNamed(context, HomeView.routeName);
                  }else if (state is SignInError) {
                    buildErrorBar(context, state.message);
                  }
                },

                builder: (context, state) {
                  return  ModalProgressHUD(
                    progressIndicator:  Center(
                      child: CircularProgressIndicator(
                        color: AbstractAppColors.primaryColor,

                      ),
                    ),
                      inAsyncCall:
                      state is SignInLoading ? true : false,

                      child: LoginScreenBody());
                },
                );
          }
        ),
      ),
    );
  }

}
