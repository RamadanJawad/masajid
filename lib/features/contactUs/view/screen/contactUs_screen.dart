import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
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
import 'package:masajid/features/contactUs/view/screen/contact.dart';
import 'package:masajid/features/contactUs/view/widget/custom_text.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: ManagerColors.colorTwoGradient),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: ManagerHeight.h26,
                ),
              WidgetStack(
                visible: false,
                name: ManagerStrings.contactUs,
              ),
              Container(
                width: double.infinity,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ManagerHeight.h30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(ManagerStrings.burlington,
                                    style: getBoldTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color: ManagerColors.colorOneGradient)),
                                SvgPicture.asset(ManagerAssets.qoba),
                                Text(ManagerStrings.mosque,
                                    style: getBoldTextStyle(
                                        fontSize: ManagerFontSize.s20,
                                        color: ManagerColors.black)),
                              ],
                            ),
                            SizedBox(
                              height: ManagerHeight.h16,
                            ),
                            Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ManagerStrings.contactTitle,
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
                                      hintText: "John Doe",
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
                                      hintText: "example@example.com",
                                      textInputType: TextInputType.emailAddress,
                                      controller: controller.email,
                                      validator: (value) => FieldValidator()
                                          .validateEmail(value!)),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  const CustomTitle(
                                      title: ManagerStrings.mobileNumber),
                                  IntlPhoneField(
                                    onChanged: (phone) {
                                      controller.onChange(phone);
                                    },
                                    controller: controller.phone,
                                    languageCode: 'en',
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: ManagerHeight.h14,
                                        horizontal: ManagerWidth.w10,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          ManagerRadius.r4,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          ManagerRadius.r4,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      counterText: '',
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          ManagerRadius.r4,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          ManagerRadius.r4,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                    initialCountryCode: 'EN',
                                  ),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  const CustomTitle(
                                      title: ManagerStrings.reason),
                                  CustomDropdownWidget(
                                    hintText: "select reason",
                                    controller: controller.reason,
                                    items: controller.isLoading
                                        ? []
                                        : controller.item,
                                  ),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  const CustomTitle(
                                      title: ManagerStrings.message),
                                  textField(
                                      hintText: "Type here ....",
                                      controller: controller.message),
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      ManagerRadius.r10))),
                                      child: Text(
                                        ManagerStrings.sendMessage,
                                        style: getBoldTextStyle(
                                            fontSize: ManagerFontSize.s20,
                                            color: ManagerColors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ManagerHeight.h10,
                                  ),
                                  const ContactScreen()
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
