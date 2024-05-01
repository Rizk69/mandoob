import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/app_cubit/app_cubit.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/auth/presentation/profile/widget/ColorSelectionPage.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    AppPreferences appPreferences = instance<AppPreferences>();

    return SafeArea(
      top: false,
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: MultiBlocProvider(
            providers: [
              BlocProvider<ProfileCubit>(
                  create: (_) => instance<ProfileCubit>()..getProfile()),
            ],
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ProfileLoadingState ||
                    state is EditProfileColorLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileLoadedState ||
                    state is changeVisabialtyState ||
                    state is EditProfileColorLoadedState) {
                  var user = ProfileCubit.get(context).userModel?.user;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              functionDrawer: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              title: LocaleKeys.account.tr(),
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p45),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: ColorFunctions.loadButtonColor(),
                                border: Border.all(
                                    color: ColorFunctions.loadButtonColor(),
                                    width: 5,
                                    strokeAlign: AppSize.s5)),
                            child: SvgPicture.asset(
                              'assets/images/edit_icons.svg',
                            ),
                          ),
                          SizedBox(height: AppSize.s5.h),
                          Text(
                            user!.name,
                            style: getBoldOxygenStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(height: AppSize.s5.h),
                          ColorSelectionPage(colors: user.colors ?? []),
                          SizedBox(height: AppSize.s5.h),
                          customCardProfile(
                              color:appPreferences.getIsDark() ?   ColorManager.graymahrok :ColorManager.transparent,
                              title: LocaleKeys.userName.tr(),
                              des: user.email,
                              context: context),

                          customCardProfile(
                              color:appPreferences.getIsDark() ?   ColorManager.transparent :ColorManager.grey2.withOpacity(0.2),
                              title: LocaleKeys.companyName.tr(),
                              des: user.companyName,
                              context: context),

                          customCardProfile(
                              color:appPreferences.getIsDark() ? ColorManager.graymahrok: ColorManager.transparent,
                              title: LocaleKeys.balanceTL.tr(),
                              des: user.balanceTL.toString(),
                              context: context),
                          customCardProfile(
                              color:appPreferences.getIsDark() ?   ColorManager.transparent :ColorManager.grey2.withOpacity(0.2),
                              title: LocaleKeys.balanceUsd.tr(),
                              des: user.balanceUsd.toString(),
                              context: context),
                          customCardProfile(
                              color:appPreferences.getIsDark() ? ColorManager.graymahrok: ColorManager.transparent,
                              title: LocaleKeys.salseLera.tr(),
                              des: user.salseLera.toString(),
                              context: context),
                          customCardProfile(
                              color:appPreferences.getIsDark() ?   ColorManager.transparent :ColorManager.grey2.withOpacity(0.2),
                              title: LocaleKeys.salseDoler.tr(),
                              des: user.salseDoler.toString(),
                              context: context),
                          customCardProfile(
                              color:appPreferences.getIsDark() ? ColorManager.graymahrok: ColorManager.transparent,
                              title: LocaleKeys.commissionsLera.tr(),
                              des: user.commissionsLera.toString(),
                              context: context),
                          customCardProfile(
                              color:appPreferences.getIsDark() ?   ColorManager.transparent :ColorManager.grey2.withOpacity(0.2),
                              title: LocaleKeys.commissionsDoler.tr(),
                              des: user.commissionsDoler.toString(),
                              context: context),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color:appPreferences.getIsDark() ? ColorManager.graymahrok: ColorManager.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: getBoldSegoeStyle(
                                      fontSize: AppSize.s20.sp,
                                      color: ColorManager.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: '${LocaleKeys.Theme.tr()} \t\t\t\t',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          )),
                                      TextSpan(
                                        text: appPreferences.getIsDark()
                                            ? LocaleKeys.DarkMood.tr()
                                            : LocaleKeys.LightMood.tr(),
                                        style: getMediumInterStyle(
                                          fontSize: 15,
                                          color: ColorManager.desColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Switch(
                                  thumbColor: MaterialStateProperty.all<Color>(
                                      ColorFunctions.loadButtonColor()),
                                  inactiveTrackColor: Colors.grey,
                                  trackOutlineColor:
                                      MaterialStateProperty.all<Color>(
                                          ColorFunctions.loadButtonColor()),
                                  value: appPreferences.getIsDark(),
                                  trackColor: MaterialStateProperty.all<Color>(
                                      Colors.white),
                                  onChanged: (bool value) {
                                    AppCubit.get(context).changeAppMode();
                                  },
                                )
                              ],
                            ),
                          ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appPreferences.getIsDark() ? ColorManager.graymahrok : ColorManager.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.language.tr(),
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                            ),
                            IconButton(
                              icon: Icon(context.locale.languageCode == 'ar' ? Icons.language : Icons.translate),
                              onPressed: () {
                                ProfileCubit.get(context).changeLanguage(context);
                                // context.setLocale(context.locale.languageCode == 'ar' ? Locale('en', 'US') : Locale('ar', 'EG'));
                              },
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      )
                      ],
                      ),
                    ),
                  );
                } else if (state is ProfileErrorState) {
                  return Center(
                      child: Text('Error fetching profile${state.message}'));
                } else {
                  return const Center(child: Text(''));
                }
              },
            )),
      ),
    );
  }

  Widget customCardProfile(
      {required Color color,
      required String title,
      required String des,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: RichText(
        text: TextSpan(
          style: getSemiBoldInterStyle(
            fontSize: AppSize.s20.sp,
            color: Theme.of(context).primaryColor,
          ),
          children: [
            TextSpan(
              text: '$title \t\t\t\t',
            ),
            TextSpan(
              text: des,
              style: getMediumInterStyle(
                fontSize: 15,
                color: ColorManager.desColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customCardProfilePassword(
      {required Color color,
      required String title,
      required String des,
      required BuildContext context}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: getBoldSegoeStyle(
                fontSize: 25,
                color: ColorManager.black,
              ),
              children: [
                TextSpan(
                    text: '$title \t\t\t\t',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                TextSpan(
                  text: des,
                  style: getMediumInterStyle(
                    fontSize: 15,
                    color: ColorManager.desColor,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined))
        ],
      ),
    );
  }
}
