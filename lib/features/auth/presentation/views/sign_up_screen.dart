import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/functions/build_error_bar.dart';
import 'package:fruits/core/services/get_it_services.dart';
import 'package:fruits/core/widgets/custom_app_bar.dart';
import 'package:fruits/features/auth/domain/repositories/auth_repo.dart';
import 'package:fruits/features/auth/presentation/manager/sign_up_cubit/sing_up_cubit.dart';
import 'package:fruits/features/auth/presentation/widgets/sign_up_screen_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String routeName = 'signUpScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: Builder(
          builder: (context) {
            return BlocConsumer< SingUpCubit, SingUpState>(
                listener: (context, state)
                {
                  if (state is SingUpSuccess) {
                    Navigator.pop(context);

                  } else if (state is SingUpFailure) {
                    buildErrorBar(context, state.message);

                  }
                },
                builder: (context, state) {
                  return  ModalProgressHUD(
                      inAsyncCall:  state is SingUpLoading ? true : false,
                      child: SignUpScreenBody());
                },
                );
          }
        ),
      ),
    );
  }

}
