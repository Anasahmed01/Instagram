import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/utils/images/images.dart';
import 'package:instagram/src/view/home/home.dart';
import 'package:instagram/src/view/navigation/navigation_viewmodel.dart';
import 'package:instagram/src/view/post_section/post/post.dart';
import 'package:instagram/src/view/user/profile/profile.dart';
import 'package:instagram/src/view/reels/reels.dart';
import 'package:instagram/src/view/search_section/search.dart';
import 'package:stacked/stacked.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => NavigationViewModel(),
      builder: (context, viewModel, child) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: AppColors.blackColor,
            currentIndex: viewModel.bottombar,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(AppImages.home),
                ),
              ),
              const BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.reel)),
              ),
              BottomNavigationBarItem(
                icon: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      AppImages.me,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            activeColor: AppColors.white,
          ),
          tabBuilder: (context, index) {
            late final CupertinoTabView returnValue;
            switch (index) {
              case 0:
                returnValue = CupertinoTabView(builder: (context) {
                  return CupertinoTabView(
                    builder: (context) {
                      return const HomeView();
                    },
                  );
                });
                break;
              case 1:
                returnValue = CupertinoTabView(
                  builder: (context) {
                    return const SearchView();
                  },
                );
                break;
              case 2:
                returnValue = CupertinoTabView(
                  builder: (context) {
                    return const PostView();
                  },
                );
                break;
              case 3:
                returnValue = CupertinoTabView(
                  builder: (context) {
                    return const ReelsView();
                  },
                );
              case 4:
                returnValue = CupertinoTabView(
                  builder: (context) {
                    return const ProfileView();
                  },
                );
            }
            return returnValue;
          },
        );
      },
    );
  }
}
