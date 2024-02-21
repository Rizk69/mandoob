import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/resources/assets_manager.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';

enum StateRendererType {
  // popup states (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,

  // full screen states (full screen)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // general
  contentState,
}

//ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  Function retryActionFunction;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      String? message,
      String? title = "",
      required this.retryActionFunction})
      : message = message ?? LocaleKeys.loading.tr(),
        title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopupDialog(
            context, [_getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.popupErrorState:
        return _getPopupDialog(context, [
          _getMessage(message),
          _getAnimatedImage(JsonAssets.error),
          _getRetryButton(LocaleKeys.ok.tr(), context)
        ]);
      case StateRendererType.popupSuccessState:
        return _getPopupDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(message),
          _getRetryButton(LocaleKeys.ok.tr(), context)
        ]);
      case StateRendererType.fullScreenLoadingState:
        return _getItemsColumn(
            [_getMessage(message), _getAnimatedImage(JsonAssets.loading)]);
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getMessage(message),
          _getAnimatedImage(JsonAssets.error),
          _getRetryButton(LocaleKeys.retryAgain.tr(), context)
        ]);
      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn(
            [_getMessage(message), _getAnimatedImage(JsonAssets.empty)]);
      case StateRendererType.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s14)),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        width: AppSize.s200,
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName), // todo add json image
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getSemiBoldInterStyle(
              color: ColorManager.greyIshBrown, fontSize: AppSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType ==
                        StateRendererType.fullScreenErrorState ||
                    stateRendererType == StateRendererType.popupSuccessState) {
                  // call retry function
                  if (stateRendererType ==
                      StateRendererType.popupSuccessState) {
                    Navigator.of(context).pop();
                  }
                  retryActionFunction.call();
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonTitle,
                  style: getBoldSegoeStyle(
                      color: ColorManager.whiteTwo, fontSize: AppSize.s24))),
        ),
      ),
    );
  }
}
