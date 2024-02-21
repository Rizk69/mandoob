import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/resources/assets_manager.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/routes_manager.dart';

import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/presentation/signup/manger/register/sign_up_cubit.dart';
import 'package:mandoob/presentation/widget/customButton.dart';
import 'package:mandoob/presentation/widget/custom_appbar.dart';
import 'package:mandoob/presentation/widget/default_snake_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<SignUpCubit>(),
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {


            if( state is SignUpSuccessState) {
              final snackBar = defaultSnakeBar(
                title: LocaleKeys.SUCCESS.tr(),
                message: LocaleKeys.SUCCESS,
                state: ContentType.success,
              );
              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

              // Navigator.pushReplacementNamed(context, Routes.confirmSignUpRoute);

            }


            if(state is SignUpFailureState){
              final snackBar = defaultSnakeBar(
                title: LocaleKeys.ERROR.tr(),
                message: state.message,
                state: ContentType.failure,
              );
              ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return _buildContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          CustomAppBar(
              title: LocaleKeys.back.tr(),
              onTap: () {
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              }),
          Container(
            padding: EdgeInsets.all(AppPadding.p5_5.h),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                SvgPicture.asset(ImageAssets.logoSignature,
                    height: AppSize.s13.h, semanticsLabel: 'A red up arrow'),
                SizedBox(
                  height: AppSize.s1.h,
                ),
                Text(
                  LocaleKeys.signUp.tr(),
                  style: getBoldOxygenStyle(
                      color: ColorManager.blueAccent, fontSize: AppSize.s20.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSize.s3.h),
                const SizedBox(height: AppSize.s24),
                TextField(
                  keyboardType: TextInputType.name,
                  controller: _userNameController,
                  textInputAction: TextInputAction.next,
                  style: getRegularOpenSansStyle(
                      color: ColorManager.darkGrey2, fontSize: AppSize.s16.sp),
                  autofillHints: const [AutofillHints.name],
                  onChanged: (userName) {
                    signUpCubit.setUserName(userName);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.userName.tr(),
                    labelText: LocaleKeys.userName.tr(),
                    fillColor: ColorManager.greyLight2,
                  ),
                ),
                SizedBox(height: AppSize.s1_5.h),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  style: getRegularOpenSansStyle(
                      color: ColorManager.darkGrey2, fontSize: AppSize.s16.sp),
                  autofillHints: const [AutofillHints.email],
                  onChanged: (email) {
                    signUpCubit.setEmail(email);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.email.tr(),
                    labelText: LocaleKeys.email.tr(),
                    fillColor: ColorManager.greyLight2,
                  ),
                ),
                SizedBox(height: AppSize.s1_5.h),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: _mobileController,
                  textInputAction: TextInputAction.next,
                  style: getRegularOpenSansStyle(
                      color: ColorManager.darkGrey2, fontSize: AppSize.s16.sp),
                  autofillHints: const [AutofillHints.telephoneNumber],
                  onChanged: (mobileNumber) {
                    signUpCubit.setMobileNumber(mobileNumber);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.mobile.tr(),
                    labelText: LocaleKeys.mobile.tr(),
                    fillColor: ColorManager.greyLight2,
                  ),
                ),
                SizedBox(height: AppSize.s1_5.h),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  obscureText: signUpCubit.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  style: getRegularOpenSansStyle(
                      color: ColorManager.darkGrey2, fontSize: AppSize.s16.sp),
                  autofillHints: const [AutofillHints.password],
                  onChanged: (password) {
                    signUpCubit.setPassword(password);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.password.tr(),
                    labelText: LocaleKeys.password.tr(),
                    fillColor: ColorManager.greyLight2,
                    suffixIcon: IconButton(
                      icon: Icon(signUpCubit.suffixIcon),
                      onPressed: () => signUpCubit.changePasswordVisibility(),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s1_5.h),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _confirmPasswordController,
                  obscureText: signUpCubit.isPasswordVisible,
                  textInputAction: TextInputAction.done,
                  style: getRegularOpenSansStyle(
                      color: ColorManager.darkGrey2, fontSize: AppSize.s16.sp),
                  autofillHints: const [AutofillHints.password],
                  onChanged: (password) {
                    signUpCubit.setConfirmPassword(password);
                  },
                  decoration: InputDecoration(
                    hintText: LocaleKeys.confirmPassword.tr(),
                    labelText: LocaleKeys.confirmPassword.tr(),
                    fillColor: ColorManager.greyLight2,
                    suffixIcon: IconButton(
                      icon: Icon(signUpCubit.suffixIcon),
                      onPressed: () => signUpCubit.changePasswordVisibility(),
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                CustomButton(
                  title: LocaleKeys.next.tr(),
                  onPressed: signUpCubit.isDataValid
                      ? () => signUpCubit.register()
                      : null,
                ),
                SizedBox(height: AppSize.s2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.doYouHaveAccount.tr(),
                      style: getMediumInterStyle(
                          color: ColorManager.greyDark3,
                          fontSize: AppSize.s16.sp),
                    ),
                    SizedBox(width: AppSize.s02.h),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.loginRoute);
                        },
                        child: Text(
                          LocaleKeys.signIn.tr(),
                          style: getSemiBoldInterStyle(
                                  color: ColorManager.blueAccent,
                                  fontSize: AppSize.s16.sp)
                              .copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
