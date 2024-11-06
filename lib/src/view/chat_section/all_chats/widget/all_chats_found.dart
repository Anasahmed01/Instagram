import 'package:flutter/material.dart';
import '../../../../model/home_post_model.dart';
import '../../../../reuseable_widget/app_textfield.dart';
import '../../../../reuseable_widget/custom_text.dart';
import '../../../../reuseable_widget/toole_tip.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/images.dart';
import '../all_chats_viewmodel.dart';

Widget allChatsFound(
    {required AllChatsViewModel viewModel, required HomePostModel model}) {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                flex: 10,
                child: SizedBox(
                  height: 50,
                  child: CustomTextFields.aAppTextField(
                      textInputAction: TextInputAction.search,
                      onChanged: (value) => viewModel.runFilter(value),
                      prefixIcon: Icons.circle_outlined,
                      prefixIconColor: Colors.blue.shade400,
                      hintText: 'Ask Meta AI or Search'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: popUp(
                  popUpIcon: CustomText.customSizedText(
                      text: 'Filter',
                      color: Colors.blue.shade400,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.me),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText.customSizedText(
                    text: 'Your note', color: AppColors.greyColor, size: 12),
              ],
            ),
          ),
          SizedBox(
            height: 35,
            width: double.infinity,
            child: ListView.builder(
              itemCount: viewModel.tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        viewModel.paymentSelection(index: index);
                      },
                      child: Container(
                        width: 90,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                            color: viewModel.selectedTab == index
                                ? AppColors.white
                                : const Color.fromARGB(255, 46, 46, 46),
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomText.customSizedText(
                            text: viewModel.tabs[index],
                            size: 12,
                            minFontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: viewModel.selectedTab == index
                                ? AppColors.blackColor
                                : AppColors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          viewModel.foundUsers.isNotEmpty
              ? ListView.builder(
                  itemCount: viewModel.foundUsers.length,
                  //  model.data.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => viewModel.navigateToChatsView(
                        userName: viewModel.foundUsers[index]['name'],
                        // model.data[index].userName,
                        userImage: model.data[index].profilePicture,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Card(
                          color: AppColors.blackColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            model.data[index].profilePicture),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText.customSizedText(
                                            text: model.data[index].userName,
                                            size: 14),
                                        CustomText.customSizedText(
                                            text: 'Hello',
                                            color: AppColors.greyColor,
                                            size: 12),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              // popUp(
                              //   popUpIcon: Icon(
                              //     Icons.camera_alt_outlined,
                              //     color: AppColors.greyColor,
                              //     size: 28,
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () => viewModel.navigateToCameraView(),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  color: AppColors.greyColor,
                                  size: 28,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: CustomText.customSizedText(
                      text: 'User not found',
                    ),
                  ),
                ),
        ],
      ),
    ),
  );
}
