import 'package:attendance_mobile/app/misc/constants.dart';
import 'package:attendance_mobile/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final FontWeight fontWeight;
  final Widget iconLeft;
  final Widget iconRight;
  final VoidCallback onRightPressed, onLeftPress, onBackPressed;
  final bool isNotif, isBack, searchActive, showSetting, centerTitle, showInfo;
  final TextEditingController _searchController;
  final FocusNode _focusNode;
  final PreferredSizeWidget bottom;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonAppBar(
      {Key key,
      @required this.title,
      this.fontWeight = FontWeight.w700,
      this.iconLeft,
      this.onLeftPress,
      this.iconRight = const Icon(Icons.notifications),
      this.isNotif = false,
      this.isBack = false,
      this.searchActive = false,
      this.showSetting = false,
      this.centerTitle = false,
      this.showInfo = false,
      TextEditingController searchController,
      FocusNode focusNode,
      this.bottom,
      this.onBackPressed,
      this.onRightPressed})
      : _searchController = searchController,
        _focusNode = focusNode,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      key: key,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
          color: searchActive
              ? AppConstants.COLOR_BLACK
              : AppConstants.COLOR_WHITE),
      actionsIconTheme: IconThemeData(
          color: searchActive
              ? AppConstants.COLOR_BLACK
              : AppConstants.COLOR_WHITE),
      automaticallyImplyLeading: true,
      elevation: 0.1,
      backgroundColor:
          searchActive ? AppConstants.COLOR_WHITE : AppConstants.COLOR_BLACK,
      title: searchActive
          ? TextField(
              autofocus: searchActive,
              controller: _searchController,
              decoration: InputDecoration(hintText: 'Cari...'),
              focusNode: _focusNode,
            )
          : Text(
              title,
              style:
                  TextStyle(fontFamily: "MMC-Medium", fontWeight: fontWeight),
            ),
      leading: isBack
          ? IconButton(
              onPressed: searchActive
                  ? onLeftPress
                  : onBackPressed ?? () {
                      Navigator.pop(context);
                    },
              icon: Icon(Icons.arrow_back),
            )
          : iconLeft ??
              IconButton(
                icon: new Image.asset(
                    "lib/app/ui/assets/icons/app_bar_icon_mitsubishi.png"),
                onPressed: () {},
                iconSize: 20,
                splashColor: Colors.transparent,
              ),
      actions: <Widget>[
        if (isBack)
          IconButton(
            icon: showInfo
                ? Icon(Icons.info)
                : searchActive ? Icon(Icons.close) : Icon(Icons.search),
            onPressed: onRightPressed,
          ),
        if (isNotif)
          IconButton(
            icon: iconRight,
            onPressed: () {
              //Navigator.pushNamed(context, Pages.notification);
            },
          ),
        if (showSetting)
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              //Navigator.pushNamed(context, Pages.setting);
            },
          ),
        if (showSetting)
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              //Navigator.pushNamed(context, Pages.settingInfo);
            },
          ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}
