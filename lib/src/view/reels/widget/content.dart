// // ignore_for_file: unnecessary_null_comparison

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:instagram/src/view/reels/widget/options.dart';
// import 'package:stacked/stacked.dart';
// import '../reels_viewmodel.dart';

// class ReelsContentView extends StatelessWidget {
//   final String src;
//   const ReelsContentView({super.key, required this.src});

//   @override
//   Widget build(BuildContext context) {
//     return ViewModelBuilder.reactive(
//       viewModelBuilder: () => ReelsViewModel(),
//       onViewModelReady: (viewModel) {
//         viewModel.init();
//       },
//       builder: (context, viewModel, child) {
//         return Scaffold(
//           body: Stack(
//             fit: StackFit.expand,
//             children: [
//               viewModel.chewieController != null &&
//                       viewModel.chewieController.videoPlayerController.value
//                           .isInitialized
//                   ? Chewie(controller: viewModel.chewieController)
//                   : const SizedBox(),
//               const OptionsView(),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
