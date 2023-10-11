import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmed_task2/core/extesnions/media_query_extension.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/values.dart';
import '../../../domain/entites/character_details.dart';
import '../../widgets/common/text_utils.dart';

class DetailsWidget extends StatelessWidget {
  final CharacterDetails characterDetails;

  const DetailsWidget({super.key, required this.characterDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSizes.s30), bottomRight: Radius.circular(AppSizes.s30)),
          child: CachedNetworkImage(
            imageUrl: characterDetails.image ?? AppConstants.placeHolder,
            width: context.fullWidth(),
            height: context.setWidth(.7),
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p20, horizontal: AppPadding.p20),
          child: Row(
            children: [
              const SizedBox(width: AppPadding.p20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: characterDetails.name ?? "",
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      const SizedBox(width: AppPadding.p5),
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.s10), color: characterDetails.alive != null && true ? Colors.green : Colors.red),
                        width: AppSizes.s10,
                        height: AppSizes.s10,
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  titledContent(title: "Actor:", value: characterDetails.actor),
                  const SizedBox(height: 5),
                  titledContent(title: "House:", value: characterDetails.house),
                  const SizedBox(height: AppPadding.p20),
                  Row(
                    children: [
                      Container(color: Colors.grey, width: context.fullWidth() - 60, height: 1),
                    ],
                  ),
                  const SizedBox(height: AppPadding.p20),
                  titledContent(title: "Eye Color:", value: characterDetails.eyeColour),
                  const SizedBox(height: AppPadding.p10),
                  titledContent(title: "Gender:", value: characterDetails.gender),
                  const SizedBox(height: AppPadding.p10),
                  titledContent(title: "Date Of Birth:", value: characterDetails.dateOfBirth)
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget titledContent({required String title, String? value}) {
    return Row(
      children: [
        TextUtils(text: "$title:", fontSize: 14, color: Colors.black),
        const SizedBox(width: AppPadding.p5),
        TextUtils(text: value ?? "", fontSize: 14, color: Colors.black),
      ],
    );
  }
}
