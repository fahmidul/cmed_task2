import 'package:cached_network_image/cached_network_image.dart';
import 'package:cmed_task2/core/extesnions/media_query_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/routes/routes.dart';
import '../../../config/services/service_locator.dart';
import '../../../domain/entites/character.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/strings.dart';
import '../../core/utils/values.dart';

import '../controllers/character/character_cubit.dart';
import '../controllers/character/character_detail_state.dart';
import '../widgets/common/custom_appbar.dart';
import '../widgets/common/text_utils.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  CharacterCubit characterCubit = getIt<CharacterCubit>();

  @override
  void initState() {
    characterCubit.getCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => characterCubit,
      child: Scaffold(
        appBar: const CustomAppbar(title: AppStrings.characterList),
        body: SafeArea(child: BlocBuilder<CharacterCubit, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              return SizedBox(
                height: context.setWidth(.5),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                ),
              );
            } else if (state is CharacterLoaded) {
              return _buildCharacterList(characterCubit.characters);
            } else if (state is CharacterFailure) {
              return const Text('Something went wrong!');
            } else {
              return const Text('Unknown Error');
            }
          },
        )),
      ),
    );
  }

  Widget _buildCharacterList(List<Character> characters) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p15, horizontal: AppPadding.p15),
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: characters.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final character = characters[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.characterDetails, arguments: character.id);
              },
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
              ),
            );
          },
        ),
      ),
    );
  }
}
