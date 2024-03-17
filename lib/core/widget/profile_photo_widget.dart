import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/app/constants.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//ignore: must_be_immutable
class ProfileWidget extends StatelessWidget {
  final String networkImage;
  File? imageFileProfile;
  final VoidCallback onTap;

  ProfileWidget(
      {super.key,
      required this.networkImage,
      this.imageFileProfile,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return buildImage();
  }

  Widget buildImage() {
    return SizedBox(
      height: AppSize.s14.h,
      width: AppSize.s14.h,
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12.w),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s12.w),
                child: (imageFileProfile != null)
                    ? Image.file(
                        imageFileProfile!,
                        fit: BoxFit.cover,
                        width: AppSize.s14.h,
                        height: AppSize.s14.h,
                      )
                    : Image.network(
                        Constants.baseUrl + networkImage,
                        fit: BoxFit.cover,
                        width: AppSize.s14.h,
                        height: AppSize.s14.h,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          ImageAssets.user,
                          width: AppSize.s14.h,
                          height: AppSize.s14.h,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            Positioned(
              bottom: AppSize.s0.h,
              right: AppSize.s0.w,
              child: Container(
                padding: EdgeInsets.all(AppSize.s05.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.grey2,
                ),
                child: IconButton(
                  onPressed: onTap,
                  icon: SvgPicture.asset(
                    ImageAssets.editProfilePicture,
                    color: ColorManager.black,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Widget buildEditIcon() => buildCircle(
//       color: AppTheme.colors.white,
//       all: 3,
//       child: buildCircle(
//         color: Colors.lightBlue,
//         all: 8,
//         child: Icon(
//           Icons.edit,
//           color: AppTheme.colors.white,
//           size: 20,
//         ),
//       ),
//     );

// Widget buildCircle({Widget child, double all, Color color}) => ClipOval(
//       child: Container(
//         child: child,
//         color: color,
//         padding: EdgeInsets.all(all),
//       ),
//     );
}
