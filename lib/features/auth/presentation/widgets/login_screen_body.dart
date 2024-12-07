import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/core/widgets/or_divider.dart';
import 'package:fruits/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:fruits/features/auth/presentation/views/sign_up_screen.dart';
import 'package:fruits/features/auth/presentation/widgets/social_login_button.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;

                },
                hintText: 'البريد الإلكتروني',
                inputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
                inputType: TextInputType.visiblePassword,
                isPassword: true, // Enables password visibility toggle
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'هل نسيت كلمة المرور؟',
                style: AppTextStyles.style13w600Grey
                    .copyWith(color: AbstractAppColors.secondaryColor),
              ),
              SizedBox(
                height: 33,
              ),
              CustomButton(onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context
                      .read<SignInCubit>()
                      .signInWithEmailAndPassword(
                      email, password);
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              }, title: 'تسجيل دخول'
              ),
              SizedBox(
                height: 33,
              ),
              Center(
                child: Text.rich(

                  TextSpan(
                    children: [

                      TextSpan(
                        text: '   لا تمتلك حساب؟  ',
                        style: AppTextStyles.style16w600.copyWith(color: Color(0xff949D9E))
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.of(context).pushNamed(SignUpScreen.routeName);

                        },
                        text: 'قم بانشاء حساب',

                        style: AppTextStyles.style16w600.copyWith(color: AbstractAppColors.primaryColor),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox( height: 33, ),
              OrDivider(),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                text: 'تسجيل بواسطة جوجل',
                assetName: AssetPaths.googleIcon, onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
              },),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(text: 'تسجيل بواسطة أبل', assetName: AssetPaths.appleIcon, onPressed: () {  },),
              SizedBox(
                height: 16,
              ),
              SocialLoginButton(text: 'تسجيل بواسطة فيسبوك', assetName: AssetPaths.facebookIcon, onPressed: () {

                context.read<SignInCubit>().signInWithFacebook();
              },),

            ],
          ),
        ),
      ),
    );
  }
}
