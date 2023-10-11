import 'package:cmed_task2/core/extesnions/media_query_extension.dart';
import 'package:cmed_task2/presentation/character_details/widget/details_widget.dart';
import 'package:cmed_task2/presentation/widgets/common/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/services/service_locator.dart';

import '../../../core/utils/strings.dart';

import '../../../domain/entites/character_details.dart';
import '../controllers/character_detail/character_detail_cubit.dart';
import '../controllers/character_detail/character_detail_state.dart';
import '../widgets/common/custom_appbar.dart';

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
      child: characterDetails == null
          ? SizedBox(height: context.fullHeight(), child: const Center(child: TextUtils(text: "No Data Found")))
          : DetailsWidget(
              characterDetails: characterDetails,
            ),
    );
  }
}
