import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/auth/presentation/login/manger/login_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<LoginCubit>(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            right: AppPadding.p4.w,
            left: AppPadding.p4.w,
            top: AppPadding.p5.h,
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

                Navigator.pushReplacementNamed(context, Routes.homeRoute);
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
              bool checkValue = (state is CheckValueState)
                  ? (state as CheckValueState).checkValue
                  : false;
              return ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: AppSize.s01.h),
                  SvgPicture.asset(
                    fit: BoxFit.fitHeight,
                    ImageAssets.logoSignature,
                    height: AppSize.s32.h,
                    width: AppSize.s180.w,
                  ),
                  SizedBox(height: AppSize.s10.h),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller:context.read<LoginCubit>().emailController,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    autofillHints: const [AutofillHints.email],
                    onChanged: (email) {
                      context.read<LoginCubit>().setEmail(email);
                    },
                    decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.email_outlined, color: ColorManager.grey3),
                      hintText: LocaleKeys.email.tr(),
                      labelText: LocaleKeys.email.tr(),
                    ),
                  ),
                  SizedBox(height: AppSize.s3.h),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: context.read<LoginCubit>().passwordController,
                    obscureText: context.read<LoginCubit>().isPassword,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    autofillHints: const [AutofillHints.password],
                    onChanged: (password) {
                      context.read<LoginCubit>().setPassword(password);
                    },
                    decoration: InputDecoration(
                      hintText: LocaleKeys.password.tr(),
                      labelText: LocaleKeys.password.tr(),
                      prefixIcon: Icon(Icons.lock, color: ColorManager.grey3),
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
                  SizedBox(height: AppSize.s4),
                  Row(
                    children: [
                      Checkbox(
                        value: checkValue,
                        onChanged: (newValue) {
                          context
                              .read<LoginCubit>()
                              .toggleCheckbox(newValue ?? false);
                        },
                      ),
                      Text(
                        LocaleKeys.rememberMe.tr(),
                        style: getRegularOpenSansStyle(
                          color: ColorManager.gray,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppSize.s36),
                    height: AppSize.s10.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            context.read<LoginCubit>().isDataValid
                                ? ColorFunctions.loadButtonColor()
                                : ColorManager.grey2),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSize.s40),
                          ),
                        ),
                      ),
                      onPressed: context.read<LoginCubit>().isDataValid
                          ? () {
                        context.read<LoginCubit>().login(
                            context: context,
                            email: context.read<LoginCubit>().emailController.text,
                            password: context.read<LoginCubit>().passwordController.text,
                            rememberMe: checkValue);
                      }
                          : null,
                      child: Text(
                        LocaleKeys.signIn.tr(),
                        style: getBoldSegoeStyle(
                          color: context.read<LoginCubit>().isDataValid
                              ? ColorManager.black
                              : Colors.white,
                          fontSize: AppSize.s20.sp,
                        ),
                      ),
                    ),
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
