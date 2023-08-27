import 'package:farmfeeders/Utils/colors.dart';
import 'package:farmfeeders/common/custom_appbar.dart';
import 'package:farmfeeders/common/custom_button_curve.dart';
import 'package:farmfeeders/Utils/sized_box.dart';
import 'package:farmfeeders/Utils/texts.dart';
import 'package:farmfeeders/common/CommonTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyYourIdentity extends StatefulWidget {
  const VerifyYourIdentity({super.key});

  @override
  State<VerifyYourIdentity> createState() => _VerifyYourIdentityState();
}

class _VerifyYourIdentityState extends State<VerifyYourIdentity> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincode = TextEditingController();
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: customAppBar(text: "Verify Your Identity"),

        // backgroundColor: Color(0xFFF5F8FA),
        elevation: 0,
        // shadowColor: Colors.black,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // customAppBar(text: "Verify Your Number",),
          
                // Lottie.asset("assets/lotties/verifyYourIdentity.json",
                //   width: 200.w,
                //   height: 200.w
                // ),
                sizedBoxHeight(10.h),
          
                textBlack16(
                    "Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry."),
          
                sizedBoxHeight(50.h),
          
                SizedBox(
                  width: 270.w,
                  child: textBlack16W5000(
                      "Please enter the 4 digit code sent to 0249522174"),
                ),
          
                sizedBoxHeight(45.h),
          
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PinCodeTextField(
                    showCursor: true,
                    cursorColor: const Color(0xFF143C6D),
                    textStyle: TextStyle(fontSize: 18.sp, color: AppColors.black),
                    errorTextSpace: 30.h,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please Enter verification code";
                      } else if (value != null && value.length < 4) {
                        return "Please Enter 4 digit otp";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      selectedFillColor: AppColors.greyF1F1F1,
                      inactiveFillColor: AppColors.greyF1F1F1,
                      inactiveColor: AppColors.greyF1F1F1,
                      activeColor: AppColors.greyF1F1F1,
                      selectedColor: AppColors.greyF1F1F1,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.h),
                          topRight: Radius.circular(4.h)),
                      fieldHeight: 65.h,
                      fieldWidth: 50.w,
                      activeFillColor: AppColors.greyF1F1F1,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: pincode,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {});
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
          
                      return true;
                    },
                    appContext: context,
                  ),
                ),
          
                sizedBoxHeight(30.h),
          
                Text(
                  "Resend Code",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.sp,
                      color: AppColors.buttoncolour,
                      fontWeight: FontWeight.w500),
                ),
          
                sizedBoxHeight(150.h),
                // 130
                customButtonCurve(
                  text: "Verify",
                  onTap: () {
                    final isValid = _form.currentState?.validate();
                    if (isValid!) {
                      Get.toNamed('/letsSetUpYourFarm');
                    } 
                    // Get.toNamed("/letsSetUpYourFarm");
                  }
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
