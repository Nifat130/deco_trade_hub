import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subTitle;
  final bool? isBackButtonExist;
  final Function()? onBackPressed;
  final bool? showCart;
  final bool? centerTitle;
  final Color? bgColor;
  final Widget? actionWidget;
  final bool isTransparentBG;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.showCart = false,
    this.centerTitle = true,
    this.bgColor,
    this.actionWidget,
    this.subTitle,
    this.isTransparentBG = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: isTransparentBG ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
      ),
      backgroundColor: isTransparentBG
          ? Colors.transparent
          : Get.isDarkMode
              ? Theme.of(context).cardColor.withValues(alpha: .2)
              : Theme.of(context).primaryColor,
      centerTitle: centerTitle,
      shape: Border(bottom: BorderSide(width: .4, color: Theme.of(context).primaryColorLight.withValues(alpha: .2))),
      elevation: 0,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: context.theme.textTheme.titleLarge?.copyWith(
              color: isTransparentBG ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          if (subTitle != null)
            Text(
              subTitle!,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: isTransparentBG ? Theme.of(context).colorScheme.primary : Theme.of(context).primaryColorLight,
              ),
            ),
        ],
      ),
      leading: isBackButtonExist!
          ? IconButton(
              hoverColor: Colors.transparent,
              icon: Icon(Icons.arrow_back_ios,
                  color: isTransparentBG ? Theme.of(context).colorScheme.primary : Theme.of(context).primaryColorLight),
              color: Theme.of(context).textTheme.bodyLarge!.color,
              onPressed: () => onBackPressed != null
                  ? onBackPressed!()
                  : Navigator.of(context).canPop()
                      ? Navigator.pop(context)
                      : Get.offAllNamed(AppRoutes.rolePrompt),
            )
          : null,
      actions: showCart!
          ? [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart_sharp),
              )
            ]
          : actionWidget != null
              ? [actionWidget!]
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
