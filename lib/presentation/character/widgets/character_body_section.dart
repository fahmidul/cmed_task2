// import 'package:cmed_task_02/presentation/controllers/character/character_detail_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../controllers/character/character_cubit.dart';
//
// // class CharacterBodySection extends StatelessWidget {
// //
// //
// //   CharacterBodySection({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return characterList(context);
// //   }
// //
// //   Widget characterList(BuildContext context) {
// //     CharacterCubit characterCubit = getIt<CharacterCubit>();
// //     characterCubit.getCharacters();
// //     return BlocBuilder<CharacterCubit, CharacterState>(
// //       bloc: characterCubit,
// //       builder: (context, state) {
// //         switch (state) {
// //           case CharacterLoading():
// //             return const SizedBox(
// //               height: 500,
// //               child: Center(
// //                 child: CircularProgressIndicator(
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             );
// //           case CharacterLoaded():
// //             return SingleChildScrollView(
// //               child: ListView.builder(
// //                 itemCount: characterCubit.characters.length,
// //                 shrinkWrap: true,
// //                 scrollDirection: Axis.vertical,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 itemBuilder: (context, index) {
// //                   final character = characterCubit.characters[index];
// //                   return InkWell(
// //                     onTap: () {},
// //                     child: Container(
// //                       padding: const EdgeInsets.only(bottom: 15),
// //                       decoration: const BoxDecoration(),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             character.name ?? "",
// //                             style: const TextStyle(fontSize: 16, color: Colors.black),
// //                           ),
// //                           const SizedBox(height: 5),
// //                           Text(
// //                             character.actor ?? "",
// //                             style: const TextStyle(fontSize: 14, color: Colors.black),
// //                           ),
// //                           const SizedBox(height: 15),
// //                           Container(color: Colors.grey, height: 1),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             );
// //           case CharacterFailure():
// //             return const Text('Something went wrong!');
// //           default:
// //             return const Text('Unknown ErroErrorreer');
// //         }
// //       },
// //     );
// //     // ,
// //     //
// //     // ListView.builder(
// //     // shrinkWrap: true,
// //     // scrollDirection: Axis.vertical,
// //     // itemCount: 12,
// //     // itemBuilder: (BuildContext context, int index) {
// //     // return TextUtils(text: "Test");
// //     // },
// //     // );
// //   }
// // }
//
// class CharacterBodySection extends StatelessWidget {
//   const CharacterBodySection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CharacterCubit, CharacterState>(
//       builder: (context, state) {
//         switch (state) {
//           case CharacterLoading():
//             return const SizedBox(
//               height: 500,
//               child: Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.black,
//                 ),
//               ),
//             );
//           case CharacterLoaded():
//             return characterList(context);
//           case CharacterFailure():
//             return const Text('Something went wrong!');
//           default:
//             return const Text('Unknown ErroErrorreer');
//         }
//       },
//     );
//   }
//
//   Widget characterList(BuildContext context) {
//     final characterCubit = BlocProvider.of<CharacterCubit>(context);
//     characterCubit.getCharacters();
//
//     return SingleChildScrollView(
//       child: ListView.builder(
//         itemCount: characterCubit.characters.length,
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           final character = characterCubit.characters[index];
//           return InkWell(
//             onTap: () {},
//             child: Container(
//               padding: const EdgeInsets.only(bottom: 15),
//               decoration: const BoxDecoration(),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     character.name ?? "",
//                     style: const TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     character.actor ?? "",
//                     style: const TextStyle(fontSize: 14, color: Colors.black),
//                   ),
//                   const SizedBox(height: 15),
//                   Container(color: Colors.grey, height: 1),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }