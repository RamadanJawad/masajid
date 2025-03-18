import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masajid/core/resources/manager_assets.dart';
import 'package:masajid/core/resources/manager_colors.dart';
import 'package:masajid/core/resources/manager_fonts.dart';
import 'package:masajid/core/resources/manager_sizes.dart';
import 'package:masajid/core/resources/manager_strings.dart';
import 'package:masajid/core/resources/manager_styles.dart';
import 'package:masajid/core/validator/validator.dart';
import 'package:masajid/core/widget/custom_dropdown.dart';
import 'package:masajid/core/widget/textfield.dart';
import 'package:masajid/core/widget/widget_stack.dart';
import 'package:masajid/features/contactUs/controller/contactUs_controller.dart';
import 'package:masajid/features/contactUs/view/widget/custom_text.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(color: ManagerColors.colorTwoGradient),
          child: Column(
            children: [
              const WidgetStack(
                visible: false,
                name: ManagerStrings.contactUs,
              ),
              Expanded(
                  child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(ManagerRadius.r50),
                    topRight: Radius.circular(ManagerRadius.r50),
                  ),
                ),
                child: GetBuilder<ContactUsController>(
                    init: ContactUsController(),
                    builder: (controller) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
                        child: SingleChildScrollView(
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(ManagerStrings.burlington,
                                        style: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s20,
                                            color: ManagerColors
                                                .colorOneGradient)),
                                    SvgPicture.asset(ManagerAssets.qoba),
                                    Text(ManagerStrings.mosque,
                                        style: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s20,
                                            color: ManagerColors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                Text(
                                    ManagerStrings.contactTitle,
                                    textAlign: TextAlign.center,
                                    style: getBoldTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color: ManagerColors.black)),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                const CustomTitle(
                                    title: ManagerStrings.fullName),
                                textField(
                                    textInputType: TextInputType.text,
                                    controller: controller.name,
                                    validator: (value) => FieldValidator()
                                        .validateFullName(value!)),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                const CustomTitle(
                                    title: ManagerStrings.emailAddress),
                                textField(
                                  textInputType: TextInputType.emailAddress,
                                    controller: controller.email,
                                    validator: (value) =>
                                        FieldValidator().validateEmail(value!)),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                const CustomTitle(
                                    title: ManagerStrings.mobileNumber),
                                textField(
                                    textInputType: TextInputType.number,
                                    controller: controller.phone,
                                    validator: (value) => FieldValidator()
                                        .validatePhoneNumber(value!)),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                const CustomTitle(title: ManagerStrings.reason),
                                CustomDropdownWidget(
                                  controller: controller.reason,
                                  items: controller.isLoading
                                      ? []
                                      : controller.item,
                                ),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                const CustomTitle(title: ManagerStrings.message),
                                textField(controller: controller.message),
                                SizedBox(
                                  height: ManagerHeight.h10,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: ManagerHeight.h50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.sendToContact();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ManagerColors.colorTwoGradient,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                ManagerRadius.r10))),
                                    child: Text(
                                      ManagerStrings.sendMessage,
                                      style: getBoldTextStyle(
                                          fontSize: ManagerFontSize.s20,
                                          color: ManagerColors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
