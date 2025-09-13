import 'package:flutter/material.dart';
import 'package:fruits_e_commerce/core/theming/app_colors.dart';

class SignupValidators {
  /// Handles the signup process with checkbox validation
  static void handleSignup(
    BuildContext context,
    bool isCheckboxChecked,
    VoidCallback onSuccess,
  ) {
    if (isCheckboxChecked) {
      // Checkbox is checked, execute success callback
      onSuccess();
    } else {
      // Show error message
      showTermsErrorDialog(context);
    }
  }

  /// Shows error dialog when terms are not accepted
  static void showTermsErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning, color: Colors.orange, size: 24),
              SizedBox(width: 8),
              Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          content: const Text(
            'يرجى الموافقة على الشروط والأحكام للمتابعة',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'حسناً',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// Shows error snackbar when terms are not accepted (Alternative to dialog)
  static void showTermsErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'يرجى الموافقة على الشروط والأحكام للمتابعة',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  /// Navigates to home screen after successful signup
  static void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
    // Alternative direct navigation:
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
  }

  /// Complete signup validation with form validation
  static void validateAndSignup({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    required bool isTermsAccepted,
    required VoidCallback onFormValid,
    required VoidCallback onFormInvalid,
  }) {
    if (formKey.currentState!.validate()) {
      if (isTermsAccepted) {
        onFormValid();
      } else {
        showTermsErrorSnackBar(context);
      }
    } else {
      onFormInvalid();
    }
  }
}
