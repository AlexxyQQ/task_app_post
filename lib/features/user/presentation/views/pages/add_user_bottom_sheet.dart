import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../../../config/constants/colors/primitive_colors.constant.dart';
import '../../../../../config/constants/size/app_size.constant.dart';
import '../../../../../config/theme/components_theme/text_form_field.theme.dart';
import '../../../../../core/common/presentation/extensions/form_validator_extension.dart';
import '../../../../../core/common/presentation/extensions/size.extension.dart';
import '../../../../../core/common/presentation/views/widgets/app_bottom_sheet.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_button.widget.dart';
import '../../../../../core/common/presentation/views/widgets/app_text_field.widget.dart';
import '../../../data/models/user.model.dart';

class AddUserBottomSheet extends StatefulWidget {
  const AddUserBottomSheet({super.key, required this.onAdd});

  // 2. UPDATED CALLBACK SIGNATURE
  final Function(UserModel data) onAdd;

  @override
  State<AddUserBottomSheet> createState() => _AddUserBottomSheetState();

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String description,
    // 3. UPDATED STATIC METHOD SIGNATURE
    required void Function(UserModel data) onAdd,
  }) {
    return AppBottomSheet.show(
      backgroundColor: PrimitiveColors.white,
      context: context,
      padding: 16.allPadding,
      containItems: true,
      child: AddUserBottomSheet(onAdd: onAdd),
    );
  }
}

class _AddUserBottomSheetState extends State<AddUserBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  ValueNotifier<bool> isAccountFormValid = ValueNotifier(false);

  @override
  void dispose() {
    _fullNameController.dispose();
    _userNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    isAccountFormValid.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // 4. CREATE USERMODEL INSTEAD OF A MAP
      final now = DateTime.now();
      final user = UserModel(
        // Generate a new unique ID for the user
        id: const Uuid().v4(),
        fullName: _fullNameController.text,
        username: _userNameController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        email: _emailController.text,
        createdAt: now,
        updatedAt: now,
        // email and image are not in this form, so they will be null
      );

      widget.onAdd(user);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () {
          isAccountFormValid.value = _formKey.currentState?.validate() ?? false;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add New User',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            AppTextField.custom(
              controller: _fullNameController,
              titleText: 'Full Name',
              validator: (value) {
                final result = value!.validateName();
                return result.fold((l) => l, (r) => null);
              },
            ),
            12.verticalGap,

            AppTextField.custom(
              controller: _emailController,
              titleText: 'Email',
              validator: (value) {
                final result = value!.validateEmail();
                return result.fold((l) => l, (r) => null);
              },
            ),
            12.verticalGap,
            AppTextField.custom(
              controller: _userNameController,
              titleText: 'Username',
              validator: (value) {
                final result = value!.validateName();
                return result.fold((l) => l, (r) => null);
              },
            ),
            12.verticalGap,
            AppTextField.custom(
              controller: _phoneController,
              titleText: 'Phone Number',
              theme: const FormFieldTheme(keyboardType: TextInputType.phone),
              validator: (value) {
                final result = value!.validatePhoneNumber();
                return result.fold((l) => l, (r) => null);
              },
            ),
            12.verticalGap,
            AppTextField.custom(
              controller: _addressController,
              titleText: 'Address',
              theme: const FormFieldTheme(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
              ),
              validator: (value) {
                final result = value!.validateNotEmpty('Address');
                return result.fold((l) => l, (r) => null);
              },
            ),
            const SizedBox(height: 24),
            ValueListenableBuilder<bool>(
              valueListenable: isAccountFormValid,
              builder: (context, isValid, child) {
                return AppButton.primary(
                  onPressed: _submitForm,
                  isDisabled: !isValid,
                  label: 'Add User',
                );
              },
            ),
            12.verticalGap,
          ],
        ),
      ),
    );
  }
}
