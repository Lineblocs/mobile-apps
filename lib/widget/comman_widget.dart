import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_colors.dart';
import '../utils/app_font.dart';
import '../utils/assets_images.dart';


Widget buildCircleButton(IconData icon, Color iconColor, Color bgColor,String text,{BorderRadiusGeometry? borderRadius,Color textColor = AppColor.white,double iconSize = 30.0,double ,textSize = 15.0}) {
  return Column(
    children: [
      Container(
        // height: 18.w,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius:borderRadius??BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        ),
      ),
      SizedBox(height: 5),
      Text(
          text,
          style: AppFonts.mediumTextStyle(
            fontSize: textSize,
            color: textColor,
          )
      ),
    ],
  );
}

BoxDecoration getBoxDecorationLinearGradient(
    Color gradientColor, Color gradientColor1) {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          gradientColor,
          gradientColor.withOpacity(0.8),
          gradientColor1
        ]),
    shape: BoxShape.circle,
  );
}

Widget textFieldContainer(String hintText, {Function()? onTap}) {
  late BoxDecoration getBoxDeco = getDecoration();
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 100.w,
      height: 15.w,
      decoration: getBoxDeco,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, top: 6.w,right: 4.w),
        child: Text(
          hintText,
          style: AppFonts.semiBoldTextStyle(
            fontSize: 14.0,
            color: AppColor.grey,
          ),
        ),
      ),
    ),
  );
}

BoxDecoration getDecoration() {
  return BoxDecoration(
    color: AppColor.grey1,
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration getBoxDecoration() {
  return BoxDecoration(
    color: AppColor.primaryColor1.withOpacity(0.50),
    shape: BoxShape.circle,
  );
}

Widget logoImage() {
  return Center(
    child: SizedBox(
      height: 10.w,
      width: 40.w,
      child: const Image(
        image: AssetImage(AppImages.logo),
      ),
    ),
  );
}

ButtonStyle getButtonShape(Color color) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all(color),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget dottedLine() {
  return Row(
    children: List.generate(
        150 ~/ 2,
        (index) => Expanded(
              child: Container(
                color:
                    index % 2 == 0 ? Colors.transparent : AppColor.dividerColor,
                height: 1,
              ),
            )),
  );
}

Widget moreItem(Color iconColor, Color color,String text, String icon, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      color: AppColor.white,
      child: Row(
        children: [
          Container(
            height: 12.w,
            width: 12.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color),
            child: Padding(
              padding: EdgeInsets.all(3.5.w),
              child: Image.asset(
                icon,
                height: 10.w,
                width: 10.w,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Text(
            text,
            style: AppFonts.semiBoldTextStyle(
                color: AppColor.textColor2, fontSize: 14.0),
          ),
        ],
      ),
    ),
  );
}

showSnackBars(BuildContext context, String error, Color color,
    {bool isIcon = false,int duration = 2}) {
  final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(30.0),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      duration:  Duration(seconds: duration),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isIcon
              ? const Icon(
                  Icons.done,
                  color: AppColor.white,
                )
              : Container(),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
              child: Text(
            error.toString(),
            style: AppFonts.semiBoldTextStyle(
                color: AppColor.white, fontSize: 16.0),
          )),
        ],
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget otpTextFieldWidget({
  required TextEditingController controller,
  bool isValidation = false,
  String validation = "",
  ValueChanged<String>? onChanged,
  TextInputType textInputType = TextInputType.text,
  TextInputAction? textInputAction,
  ValueChanged<String>? onSubmitted,
  FocusNode? focusNode,
}) {
  return Padding(
    padding: EdgeInsets.all(1.3.w),
    child: Container(
      width: 11.w,
      height: 13.w,
      decoration: BoxDecoration(
        color: isValidation == true ? AppColor.white : AppColor.dividerColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: isValidation == true ? AppColor.red : AppColor.dividerColor,
        ),
      ),
      child: TextField(
        maxLength: 1,
        cursorColor: AppColor.primaryColor,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        focusNode: focusNode,
        textInputAction: textInputAction,
        style: AppFonts.boldTextStyle(
          fontSize: 24.0,
          color: isValidation == true ? AppColor.red : AppColor.textColor2,
        ),
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: EdgeInsets.only(top: 2.w),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}



Widget addressTextField(
    {required String label,
    required TextEditingController controller,
    required IconData icon,
    Function()? onTap,
    Function()? onTapIcon,
    Function()? onTapSave,
    Color iconColor = AppColor.textColor2,
    Color textColor = AppColor.textColor2,
    required int maxLines}) {
  return Padding(
    padding: EdgeInsets.only(top: 2.w),
    child: TextField(
      controller: controller,
      style: AppFonts.boldTextStyle(color: textColor, fontSize: 16.0),
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: AppFonts.regularTextStyle(
            color: AppColor.textColor, fontSize: 14.0),
        prefixIcon: Container(
            height: 45.w,
            width: 10.w,
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 3.w, bottom: 4.w),
              child: Icon(
                icon,
                color: iconColor,
              ),
            )),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.primaryColor, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grey2),
        ),
      ),
    ),
  );
}

Widget editTextFieldPassword(
    {required String label,
    required TextEditingController controller,
    required String icon,
    required FocusNode focusNode,
    required int maxLines}) {
  return TextField(
    focusNode: focusNode,
    onTap: () {
      focusNode.unfocus();
    },
    controller: controller,
    style: AppFonts.boldTextStyle(color: AppColor.textColor2, fontSize: 16.0),
    maxLines: maxLines,
    readOnly: true,
    decoration: InputDecoration(
      labelText: label,
      labelStyle:
          AppFonts.semiBoldTextStyle(color: AppColor.textColor, fontSize: 14.0),
      prefixIcon: Container(
          height: 10.w,
          width: 10.w,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 4.w, right: 3.w, bottom: 4.w),
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
            ),
          )),
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 2.w, top: 2.w),
        child: SizedBox(
            height: 3.w,
            width: 3.w,
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: AppColor.textColor,
            )),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle:
          AppFonts.regularTextStyle(color: AppColor.textColor, fontSize: 14.0),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColor.grey2),
      ),
    ),
  );
}

Widget textFieldWidget({
  required TextEditingController controller,
  bool isPassword = false,
  bool isValidation = false,
  double? iconSize = 20.0,
  FormFieldValidator? validator,
  required IconData prefixIcon,
  required String labelText,
  GestureTapCallback? onTapSuffixIcon,
  TextInputType textInputType = TextInputType.text,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
  TextInputAction? textInputAction,
  ValueChanged<String>? onSubmitted,
  bool isEmailIcon = false,
  bool isFocusNode = false,
  final FocusNode? focusNode,
  int maxLines = 1,
}) {
  return  TextFormField(
    controller: controller,
    keyboardType: textInputType == TextInputType.text ? TextInputType.multiline : textInputType,
    obscureText: isPassword,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: labelText,
      hintStyle: AppFonts.regularTextStyle(
          fontSize: 3.w, color: AppColor.grey),
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColor.primaryColor),
      ),
    ),
    validator: validator,
  );
}

Widget commonLoading() {
  return Container(
    height: 90.h,
    width: 100.w,
    color: Colors.white.withOpacity(0.5),
    child: Center(
      child: Container(
          decoration: BoxDecoration(
              color: AppColor.primaryColor, shape: BoxShape.circle),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(color: AppColor.white),
          )),
    ),
  );
}

Widget barListItem(
    {required String title,
    required String status,
    required Color colorStatus,
    required String image,
    required Color color,
    required BoxDecoration decoration,
    required Color textColor,
    Function()? onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 3,
        child: Container(
          height: 15.w,
          width: 38.w,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: AppFonts.boldTextStyle(
                        color: textColor, fontSize: 16.0),
                  ),
                  Container(
                    width: 9.w,
                    height: 9.w,
                    decoration: decoration,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        image,
                        width: 5.w,
                        height: 7.w,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                status,
                style: AppFonts.semiBoldTextStyle(
                    color: colorStatus, fontSize: 12.0),
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}

Widget commonDot({Color color = AppColor.textColor}) {
  return Padding(
    padding: const EdgeInsets.only(top: 2.0),
    child: Container(
      height: 3,
      width: 3,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    ),
  );
}

Widget galleryWidget(
    {required String title, required String icon, required Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        children: [
          SizedBox(
            height: 6.w,
            width: 6.w,
            child: Image.asset(
              icon,
              fit: BoxFit.cover,
              color: AppColor.textColor3,
            ),
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            title,
            style: AppFonts.semiBoldTextStyle(
                color: AppColor.textColor2, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
