import 'package:flutter/material.dart';
import 'package:inst_pay/core/style/colors.dart';

class AuthAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AuthAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.background,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.background,
      actions: [
        PopupMenuButton(
          itemBuilder:
              (_) => [
                PopupMenuItem(value: 'en', child: Text("English")),
                PopupMenuItem(value: 'fr', child: Text("Français")),
                PopupMenuItem(value: 'ar', child: Text("ar")),
              ],
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.translate),
          ),
          onSelected: (v) async {
            // c.setLocal(v);
            // await c.saveLocale(v);
            // await c.loadLocale();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
