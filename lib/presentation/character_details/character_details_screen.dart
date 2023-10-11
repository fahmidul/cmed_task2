import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmed_task2/core/extesnions/media_query_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/services/service_locator.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/strings.dart';
import '../../../core/utils/values.dart';
import '../../../domain/entites/character_details.dart';
import '../controllers/character_detail/character_detail_cubit.dart';
import '../controllers/character_detail/character_detail_state.dart';
import '../widgets/common/custom_appbar.dart';
import '../widgets/common/text_utils.dart';


class CharacterDetailsScreen extends StatefulWidget {
  final String characterId;

  const CharacterDetailsScreen(this.characterId, {super.key});

  @override
  State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
}

class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
  final CharacterDetailsCubit _characterDetailsCubit = getIt<CharacterDetailsCubit>();

  @override
  void initState() {
    _characterDetailsCubit.getCharacterDetailsById(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _characterDetailsCubit,
      child: Scaffold(
        appBar: const CustomAppbar(title: AppStrings.characterDetails),
        body: SafeArea(child: BlocBuilder<CharacterDetailsCubit, CharacterDetailsState>(
          builder: (context, state) {
            if (state is CharacterDetailsLoading) {
              return const SizedBox(
                height: 500,
                child: Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              );
            } else if (state is CharacterDetailsLoaded) {
              return _buildCharacterDetails(_characterDetailsCubit.characterDetailsEntity);
            } else if (state is CharacterDetailsFailure) {
              return const Text('Something went wrong!');
            } else {
              return const Text('Unknown Error');
            }
          },
        )),
      ),
    );
  }

  Widget _buildCharacterDetails(CharacterDetails? characterDetails) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(AppSizes.s30), bottomRight: Radius.circular(AppSizes.s30)),
                child: CachedNetworkImage(
                  imageUrl: characterDetails?.image ?? AppConstants.placeHolder,
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
                              text: characterDetails?.name ?? "",
                              fontSize: 24,
                              color: Colors.black,
                            ),
                            const SizedBox(width: AppPadding.p5),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.s10), color: characterDetails?.alive != null && true? Colors.green: Colors.red),
                              width: AppSizes.s10,
                              height: AppSizes.s10,
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        TextUtils(text: characterDetails?.actor ?? "", fontSize: 14, color: Colors.black),
                        const SizedBox(height: 5),
                        TextUtils(text: characterDetails?.house ?? "", fontSize: 14, color: Colors.black),
                        const SizedBox(height: AppPadding.p20),
                        Row(
                          children: [
                            Container(color: Colors.grey, width: context.fullWidth() - 60, height: 1),
                          ],
                        ),
                        const SizedBox(height: AppPadding.p20),
                        Row(
                          children: [
                            const TextUtils(text: "Eye Color:", fontSize: 14, color: Colors.black),
                            const SizedBox(width: AppPadding.p5),
                            TextUtils(text: characterDetails?.eyeColour ?? "", fontSize: 14, color: Colors.black),
                          ],
                        ),
                        const SizedBox(height: AppPadding.p10),
                        Row(
                          children: [
                            const TextUtils(text: "Gender:", fontSize: 14, color: Colors.black),
                            const SizedBox(width: AppPadding.p5),
                            TextUtils(text: characterDetails?.gender ?? "", fontSize: 14, color: Colors.black),
                          ],
                        ),
                        const SizedBox(height: AppPadding.p10),
                        Row(
                          children: [
                            const TextUtils(text: "Date Of Birth:", fontSize: 14, color: Colors.black),
                            const SizedBox(width: AppPadding.p5),
                            TextUtils(text: characterDetails?.dateOfBirth ?? "", fontSize: 14, color: Colors.black),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
