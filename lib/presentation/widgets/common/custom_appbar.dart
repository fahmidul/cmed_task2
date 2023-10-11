import 'dart:io';
import 'package:cmed_task2/core/extesnions/theme_extension.dart';
import 'package:cmed_task2/presentation/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/values.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            exit(0);
          }
        },
        icon: Icon(Icons.arrow_back_ios, color: context.primaryColor),
      ),
      centerTitle: true,
      title: TextUtils(
        text: title,
        fontSize: 20,
        fontWe: FontWe.medium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.s55);
}
