import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/functions/build_error_bar.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/auth/presentation/manager/sign_up_cubit/sing_up_cubit.dart';
import 'package:fruits/features/auth/presentation/widgets/sing_up_prompt.dart';
import 'package:fruits/features/auth/presentation/widgets/terms_and_conditions.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class SignUpScreenBody extends StatefulWidget {
  SignUpScreenBody({Key? key}) : super(key: key);

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermsAndConditionsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'الاسم كامل',
                inputType: TextInputType.name,
              ),
              SizedBox(
                height: 16,
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
              TermsAndConditions(
                onChecked: (value) {
                  isTermsAndConditionsAccepted = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                  onPressed: () {
                    if (isTermsAndConditionsAccepted) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context
                            .read<SingUpCubit>()
                            .createUserWithEmailAndPassword(
                            email, password, name);
                      } else {
                        setState(() {
                          autoValidateMode = AutovalidateMode.always;
                        });
                      }
                    }  else {
                      buildErrorBar(context, 'يجب عليك الموافقة علي الشروط والاحكام');
                    }
                  },
                  title: 'إنشاء حساب جديد'),
              SizedBox(
                height: 26,
              ),
              SignUpPrompt(
                questionText: 'تمتلك حساب بالفعل ؟',
                actionText: ' تسجيل الدخول',
                onActionTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
