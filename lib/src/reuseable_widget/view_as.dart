import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:instagram/src/utils/colors/app_colors.dart';
import 'package:instagram/src/view/user/edit_profile/edit_profile_viewmodel.dart';

Widget viewAsDropDown({required EditProfileViewModel viewModel}) {
  return Container(
    padding: const EdgeInsets.only(left: 0),
    child: DropdownButtonFormField2(
      style: TextStyle(color: AppColors.white),
      isExpanded: true,
      decoration: InputDecoration(
        // fillColor: AppColors.blackColor, filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding: const EdgeInsets.only(left: 0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white, width: 2),
        ),
        // Add more decoration..
      ),
      hint: Text(
        'Select Your Gender',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.white,
        ),
      ),
      items: viewModel.genderItems
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {},
      onSaved: (value) {
        viewModel.selectedValue = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.white),
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
          //  padding: EdgeInsets.symmetric(horizontal: 16),
          ),
    ),
  );
}
