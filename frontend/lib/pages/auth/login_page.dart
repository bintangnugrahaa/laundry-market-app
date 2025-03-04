import 'package:d_button/d_button.dart';
import 'package:d_input/d_input.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/app_assets.dart';
import 'package:frontend/config/app_colors.dart';
import 'package:frontend/config/app_constants.dart';
import 'package:frontend/config/nav.dart';
import 'package:frontend/pages/auth/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  execute() {
    // bool validInput = formKey.currentState!.validate();
    // if (!validInput) return;

    // UserDatasources.register(
    //   edtUsername.text,
    //   edtEmail.text,
    //   edtPassword.text,
    // ).then((value) {
    //   String newStatus = '';
    //   value.fold((failure) {
    //     switch (failure.runtimeType) {
    //       case ServerFailure _:
    //         newStatus = 'Server Error';
    //         DInfo.toastError(newStatus);
    //         break;
    //       case NotFoundFailure _:
    //         newStatus = 'Error Not Found';
    //         DInfo.toastError(newStatus);
    //         break;
    //       case ForbiddenFailure _:
    //         newStatus = 'Yout don\'t have access';
    //         DInfo.toastError(newStatus);
    //         break;
    //       case BadRequestFailure _:
    //         newStatus = 'Bad Request';
    //         DInfo.toastError(newStatus);
    //         break;
    //       case InvalidInputFailure _:
    //         newStatus = 'Invalid Input';
    //         AppResponse.invalidInput(context, failure.message ?? '{}');
    //         break;
    //       case UnauthorisedFailure _:
    //         newStatus = 'Unauthorised';
    //         DInfo.toastError(newStatus);
    //         break;
    //       default:
    //         newStatus = 'Request Error';
    //         DInfo.toastError(newStatus);
    //         newStatus = failure.message ?? '-';
    //         break;
    //     }
    //   }, (result) {
    //     DInfo.toastSuccess('Register Success');
    //   });
    // });
  }

  @override
  void dispose() {
    edtEmail.dispose();
    edtPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAssets.bgAuth,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Text(
                        AppConstants.appName,
                        style: GoogleFonts.lato(
                          fontSize: 40,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        height: 5,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(128),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.email,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            DView.width(10),
                            Expanded(
                              child: DInput(
                                controller: edtEmail,
                                fillColor: Colors.white70,
                                hint: 'Email',
                                radius: BorderRadius.circular(10),
                                validator: (input) =>
                                    input == '' ? "Don't empty" : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.height(16),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Material(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                child: const Icon(
                                  Icons.key,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            DView.width(10),
                            Expanded(
                              child: DInputPassword(
                                controller: edtPassword,
                                fillColor: Colors.white70,
                                hint: 'Password',
                                radius: BorderRadius.circular(10),
                                validator: (input) =>
                                    input == '' ? "Don't empty" : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DView.height(),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: DButtonFlat(
                                onClick: () {
                                  Nav.push(context, const RegisterPage());
                                },
                                padding: const EdgeInsets.all(0),
                                radius: 10,
                                mainColor: Colors.white70,
                                child: const Text(
                                  'REG',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DView.width(10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () => execute(),
                                style: const ButtonStyle(
                                  alignment: Alignment.centerLeft,
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
