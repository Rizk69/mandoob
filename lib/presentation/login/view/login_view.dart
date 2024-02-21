import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/login/manger/login_cubit.dart';
import 'package:mandoob/presentation/resources/assets_manager.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/routes_manager.dart';

import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:mandoob/presentation/widget/default_snake_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(
            right: AppPadding.p12.w,
            left: AppPadding.p12.w,
            top: AppPadding.p10.h,
          ),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                final snackBar = defaultSnakeBar(
                  title: LocaleKeys.SUCCESS.tr(),
                  message: LocaleKeys.SUCCESS.tr(),
                  state: ContentType.success,
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);

                // Navigator.pushReplacementNamed(context, Routes.startRoute);
              }

              if (state is LoginFailureState) {
                final snackBar = defaultSnakeBar(
                  title: LocaleKeys.ERROR.tr(),
                  message: state.message,
                  state: ContentType.failure,
                );
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              }
            },
            builder: (context, state) {
              return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Text(
                    LocaleKeys.logIn.tr(),
                    textAlign: TextAlign.center,
                    style: getBoldOxygenStyle(
                      color: ColorManager.coolBlue,
                      fontSize: AppSize.s24.sp,
                    ),
                  ),
                  SizedBox(height: AppSize.s5.h),
                  SvgPicture.asset(
                    ImageAssets.logoSignature,
                    height: AppSize.s16.h,
                    width: AppSize.s16.w,
                    semanticsLabel: 'Mozakrety', //Todo
                  ),
                  SizedBox(height: AppSize.s10.h),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    style: Theme.of(context).textTheme.titleSmall,
                    autofillHints: const [AutofillHints.email],
                    onChanged: (email) {
                      context.read<LoginCubit>().setEmail(email);
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.email.tr(),
                      labelText: LocaleKeys.email.tr(),
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: context.read<LoginCubit>().isPassword,
                    textInputAction: TextInputAction.done,
                    style: Theme.of(context).textTheme.titleSmall,
                    autofillHints: const [AutofillHints.password],
                    onChanged: (password) {
                      context.read<LoginCubit>().setPassword(password);
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.password.tr(),
                      labelText: LocaleKeys.password.tr(),
                      suffixIcon: InkWell(
                        onTap: () =>
                            context.read<LoginCubit>().changePasswordIcon(),
                        child: Icon(
                          context.read<LoginCubit>().suffixIcon,
                          color: ColorManager.grey3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s10.h),
                  SizedBox(
                    height: AppSize.s8.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: context.read<LoginCubit>().isDataValid
                          ? () {
                              context.read<LoginCubit>().login(
                                    context: context,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  );
                            }
                          : null,
                      child: Text(
                        LocaleKeys.signIn.tr(),
                        style: getRegularSegoeStyle(
                          color: ColorManager.whiteTwo,
                          fontSize: AppSize.s20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  InkWell(
                    onTap: () {
                    },
                    child: Text(
                      LocaleKeys.forgetPassword.tr(),
                      textAlign: TextAlign.center,
                      style: getSemiBoldInterStyle(
                        color: ColorManager.coolBlue,
                        fontSize: AppSize.s20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.dontHaveAcc.tr(),
                        style: getMediumInterStyle(
                          color: ColorManager.blueGrey,
                          fontSize: AppSize.s16.sp,
                        ),
                      ),
                      SizedBox(width: AppSize.s2.w),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacementNamed(
                            Routes.signupRoute,
                          );
                        },
                        child: Text(
                          LocaleKeys.signUp.tr(),
                          style: getSemiBoldInterStyle(
                            color: ColorManager.coolBlue,
                            fontSize: AppSize.s16.sp,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
