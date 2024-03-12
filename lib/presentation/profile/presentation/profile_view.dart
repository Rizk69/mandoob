import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/di.dart';
import '../../../domain/repository/repository.dart';
import '../../../domain/usecase/get_profle_usecase.dart';
import '../../../utiles_app/header_screen.dart';
import '../../home/widget/drawer_home.dart';
import '../../resources/values_manager.dart';
import '../cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorManager.backGround,
      drawer: buildDrawer(context),
      body: BlocProvider<ProfileCubit>(
          create: (_) => instance<ProfileCubit>()..getProfile(),
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileLoadedState) {
                var user = ProfileCubit.get(context).userModel?.user;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppSize.s4.h,
                        ),
                        HeaderScreen(
                            functionDrawer: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            title: 'الحساب',
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(height: AppSize.s5.h),
                        Container(
                          padding: EdgeInsets.all(AppPadding.p45),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: ColorManager.baseColorLight,
                              border: Border.all(
                                  color: ColorManager.baseColorLight,
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
                            color: ColorManager.black,
                            fontSize: 23,
                          ),
                        ),
                        SizedBox(height: AppSize.s5.h),
                        customCardProfile(
                            color: ColorManager.grey2,
                            title: 'اسم المستخدم',
                            des: user.email),
                        customCardProfilePassword(
                            color: ColorManager.transparent,
                            title: 'كلمة السر',
                            des: '#############33'),
                        customCardProfile(
                            color: ColorManager.grey2,
                            title: 'الرصيد بالعملة',
                            des: '23671467'),
                        customCardProfile(
                            color: ColorManager.transparent,
                            title: 'كلمة السر',
                            des: '#############33'),
                        customCardProfile(
                            color: ColorManager.grey2,
                            title: 'اجمالي المبيعات للشهر',
                            des: "${user.balanceTL}"),
                        customCardProfile(
                            color: ColorManager.transparent,
                            title: 'اجمالي الكميات المباعة',
                            des: '172637'),
                        customCardProfile(
                            color: ColorManager.grey2,
                            title: 'عمولات الشهر',
                            des: '172637'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.transparent,
                              borderRadius: BorderRadius.circular(15)),
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
                                      text: 'المظهر \t\t\t\t',
                                    ),
                                    TextSpan(
                                      text: 'light',
                                      style: getMediumInterStyle(
                                        fontSize: 15,
                                        color: ColorManager.desColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                thumbColor: MaterialStatePropertyAll<Color>(
                                    ColorManager.baseColorLight),
                                inactiveTrackColor: Colors.grey,
                                trackOutlineColor:
                                    MaterialStatePropertyAll<Color>(
                                        ColorManager.baseColorLight),
                                value: true,
                                trackColor: MaterialStatePropertyAll<Color>(
                                    Colors.white),
                                onChanged: (bool value) {},
                              )
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
                return const Center(child: Text('Initial state'));
              }
            },
          )),
    );
  }

  Widget customCardProfile(
      {required Color color, required String title, required String des}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: RichText(
        text: TextSpan(
          style: getBoldSegoeStyle(
            fontSize: 25,
            color: ColorManager.black,
          ),
          children: [
            TextSpan(
              text: '${title} \t\t\t\t',
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
      {required Color color, required String title, required String des}) {
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
                  text: '${title} \t\t\t\t',
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
          IconButton(
              onPressed: () {}, icon: Icon(Icons.remove_red_eye_outlined))
        ],
      ),
    );
  }
}
