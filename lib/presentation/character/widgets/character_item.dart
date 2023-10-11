import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmed_task2/domain/entites/character.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/values.dart';
import '../../widgets/common/text_utils.dart';

class CharacterItem extends StatelessWidget{
  final Character character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppPadding.p15),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.s50),
                child: CachedNetworkImage(
                  imageUrl: character.image ?? AppConstants.placeHolder,
                  width: AppSizes.s100,
                  height: AppSizes.s100,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Image.asset(
                    AssetsImagePath.placeHolder,
                    width: AppSizes.s80,
                    height: AppSizes.s80,
                    fit: BoxFit.cover,
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    AssetsImagePath.noImage,
                    width: AppSizes.s80,
                    height: AppSizes.s80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: AppPadding.p10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: character.name ?? "",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  const SizedBox(height: AppPadding.p5),
                  TextUtils(text: character.actor ?? "", fontSize: 14, color: Colors.black),
                  const SizedBox(height: AppPadding.p5),
                  TextUtils(text: character.house ?? "", fontSize: 14, color: Colors.black),
                ],
              )
            ],
          ),
          const SizedBox(height: AppPadding.p15),
          Container(color: Colors.grey.withOpacity(.3), height: 1),
        ],
      ),
    );
  }

}