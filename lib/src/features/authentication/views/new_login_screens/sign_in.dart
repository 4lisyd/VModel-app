import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vmodel/src/core/cache/local_storage.dart';
import 'package:vmodel/src/features/authentication/views/forgot_password_view.dart';
import 'package:vmodel/src/features/authentication/views/new_login_screens/sign_up.dart';
import 'package:vmodel/src/features/dashboard/dash/dashboard_ui.dart';
import 'package:vmodel/src/res/icons.dart';
import 'package:vmodel/src/res/res.dart';
import 'package:vmodel/src/shared/appbar/appbar.dart';
import 'package:vmodel/src/shared/buttons/primary_button.dart';
import 'package:vmodel/src/shared/buttons/text_button.dart';
import 'package:vmodel/src/shared/loader/full_screen.dart';
import 'package:vmodel/src/shared/rend_paint/render_svg.dart';
import 'package:vmodel/src/shared/text_fields/login_text_field.dart';
import 'package:vmodel/src/vmodel.dart';
import '../../../../core/api/graphql_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/api/signupnotifier.dart';
// final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   final graphQLService = GraphQlService();
//   return AuthNotifier(graphQLService);
// });


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isObscure = true;
  bool checkboxValue = false;
  TextEditingController _usermail = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // final GraphQlService _graphQLService = GraphQlService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VWidgetsAppBar(
        backgroundColor: VmodelColors.white,
        appbarTitle: "",
        elevation: 0,
      ),
      body:ProgressHUD(
         child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child:  SingleChildScrollView(
              padding: const VWidgetsPagePadding.horizontalSymmetric(18),
              child: Column(
                children: [
                  Text(
                    "Sign in",
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: VmodelColors.primaryColor),
                  ),
                  addVerticalSpacing(25),
                  VWidgetsLoginTextField(
                    hintText: "Email or username",
                    controller: _usermail,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Email is required";
                      }
                      return null;
                    },
                  ),
                  VWidgetsLoginTextField(
                    hintText: "Password",
                    controller: _password,
                    obscureText: _isObscure,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {
                          _togglePasswordView();
                        },
                        icon: Icon(_isObscure
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded)),
                  ),
                  addVerticalSpacing(15),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigateToRoute(context,  ForgotPasswordView());
                        },
                        child: Text(
                          "Forgot Password ?",
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: VmodelColors.primaryColor),
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(40),
                  VWidgetsPrimaryButton(
                      buttonTitle: "Sign in",
                      enableButton: true,
                      onPressed: () async{
                        final progress = ProgressHUD.of(context);
                        if(_formKey.currentState!.validate() == false){
                          Fluttertoast.showToast(
                              msg: "Please fill all the fields",
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: VmodelColors.error.withOpacity(0.6),
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }else{
                          _formKey.currentState?.save();
                          progress?.show();

                          final authNotifier = ref.read(authProvider.notifier);
                          if(_usermail.text.isEmail){
                            await authNotifier.login(_usermail.text.toLowerCase().trim(), _password.text.trim());

                          }else {
                            await authNotifier.loginUsername(_usermail.text.capitalizeFirst!.trim(), _password.text.trim());

                          }
                          if(authNotifier.state.status == AuthStatus.authenticated){
                            progress?.dismiss();
                            // print(authNotifier.state.token);
                            await VModelSharedPrefStorage().putInt('pk', authNotifier.state.pk);
                                navigateToRoute(context, const DashBoardView());
                                print(authNotifier.state.token);
                                if(checkboxValue == true){
                                  await VModelSharedPrefStorage().putString('token', authNotifier.state.token);
                                }
                          }else {
                              progress?.dismiss();
                              Fluttertoast.showToast(
                                  msg: 'Please enter valid credentials',
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: VmodelColors.error.withOpacity(0.6),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                          }
                          // if(authNotifier.state.status == AuthStatus.authenticated){
                          // // if (_graphQLService.succ == false){
                          //   progress?.dismiss();
                          //   Fluttertoast.showToast(
                          //       msg: _graphQLService.err,
                          //       gravity: ToastGravity.TOP,
                          //       timeInSecForIosWeb: 1,
                          //       backgroundColor: VmodelColors.error.withOpacity(0.6),
                          //       textColor: Colors.white,
                          //       fontSize: 16.0
                          //   );
                          // }else {
                          //   progress?.dismiss();
                          //   if(mounted) {
                          //     print(_graphQLService.token);
                          //     navigateToRoute(context, const DashBoardView());
                          //     if(checkboxValue == true){
                          //       await VModelSharedPrefStorage().putString('token', _graphQLService.token);
                          //     }
                          //   }
                          // }

                        }
                      }),
                  addVerticalSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Remember login',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: VmodelColors.primaryColor),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: VmodelColors.primaryColor),
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          activeColor: VmodelColors.primaryColor,
                          checkColor: VmodelColors.white,
                          value: checkboxValue,
                          onChanged: (bool? value) {
                            setState(() {
                              checkboxValue = !checkboxValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  addVerticalSpacing(25),
                  Text(
                    "or",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: VmodelColors.primaryColor.withOpacity(0.5),
                    ),
                  ),
                  addVerticalSpacing(20),
                  OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                        child: Row(
                          children: [
                            const NormalRenderSvg(svgPath: VIcons.facebookIcon),
                            addHorizontalSpacing(5),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Text(
                                "Sign in with facebook",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: VmodelColors.primaryColor.withOpacity(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  addVerticalSpacing(10),
                  OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                        child: Row(
                          children: [
                            Image.asset(
                              VIcons.googleIcon,
                              height: 26,
                              width: 26,
                            ),
                            addHorizontalSpacing(5),
                            Padding(
                              padding: const EdgeInsets.only(left: 58.0),
                              child: Text(
                                "Sign in with Google",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: VmodelColors.primaryColor.withOpacity(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  addVerticalSpacing(10),
                  OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                        child: Row(
                          children: [
                            const NormalRenderSvg(svgPath: VIcons.appleIcon),
                            addHorizontalSpacing(5),
                            Padding(
                              padding: const EdgeInsets.only(left: 60.0),
                              child: Text(
                                "Sign in with Apple",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: VmodelColors.primaryColor.withOpacity(1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  addVerticalSpacing(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: VmodelColors.primaryColor.withOpacity(0.5),
                        ),
                      ),
                      VWidgetsTextButton(
                        text: "Sign Up",
                        onPressed: () {
                          navigateToRoute(context, const SignUpPage());
                        },
                        textStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      )
    ),
    );
  }

  /// Logic for switching password view
  void _togglePasswordView() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }
}
