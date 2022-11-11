import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/dialog_type.dart';
import 'package:mi_learning/app/common/presentation/widgets/dialog/w_dialog.dart';
import 'package:mi_learning/app/common/presentation/widgets/w_text_field.dart';
import 'package:mi_learning/app/setting/domain/usecases/update_user_profie_use_case.dart';
import 'package:mi_learning/app/setting/presentation/providers/edit_profile_page_provider.dart';
import 'package:mi_learning/app/user/domain/entities/basic_user_info.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateful.dart';
import 'package:mi_learning/base/presentation/pages/p_loading_stateless.dart';
import 'package:mi_learning/config/colors.dart';
import 'package:mi_learning/config/dimens.dart';
import 'package:mi_learning/utils/date_time_helper.dart';
import 'package:mi_learning/utils/extensions/context_extension.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends PageLoadingStateful<EditProfilePageProvider, EditProfilePage> {
  late final TextEditingController nameController;
  late final TextEditingController occupationController;
  late final TextEditingController birthdayControlller;

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Profile',
          style: context.textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.neutral.shade900,
          ),
          onPressed: () => navigator.pop(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SvgPicture.asset(
              'assets/images/edit-profile.svg',
              height: 0.3.sh,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.largeWidthDimens,
              ),
              child: Column(
                children: [
                  Text(
                    'Update your attractive profile',
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleLarge,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'Name',
                    icon: Icons.person,
                    controller: nameController,
                    inputType: TextInputType.name,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'Occupation',
                    icon: Icons.work,
                    controller: occupationController,
                  ),
                  SizedBox(height: AppDimens.extraLargeHeightDimens),
                  WTextField(
                    label: 'Birthday',
                    icon: Icons.cake,
                    controller: birthdayControlller,
                  ),
                  SizedBox(height: AppDimens.largeHeightDimens),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        showLoading(context, true);
                        final result = await provider.updateUserProfile(
                          UpdateUserProfileParams(
                            name: nameController.text,
                            occupation: occupationController.text,
                            birthday: birthdayControlller.text,
                          ),
                        );
                        showLoading(context, false);
                        String? message = result.fold(
                          (failure) => failure.message,
                          (value) => 'Update profile success',
                        );

                        showDialog(
                          context: context,
                          builder: (ctx) => WDialog(
                            dialogType: result.isRight()
                                ? DialogType.success
                                : DialogType.error,
                            content: message ?? "",
                            onActions: message == null
                                ? [
                                    () {
                                      navigator.pop();
                                    }
                                  ]
                                : [],
                          ),
                        );
                      },
                      child: const Text(
                        'Update profile',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void beforeBuild(BuildContext context) {
    super.beforeBuild(context);

    final arguments = context.getArgument<BasicUserInfo>();
    nameController = TextEditingController(text: arguments?.name);
    occupationController = TextEditingController(text: arguments?.occupation);
    birthdayControlller = TextEditingController(
      text: DateTimeHelper.format(
        arguments?.birthday ?? DateTime.now(),
      ),
    );
  }
}
