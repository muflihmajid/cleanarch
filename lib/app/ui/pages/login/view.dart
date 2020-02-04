import 'package:attendance_mobile/app/infrastructures/app_component.dart';
import 'package:attendance_mobile/app/ui/pages/login/controller.dart';
import 'package:attendance_mobile/app/ui/pages/profile/controller.dart';
import 'package:attendance_mobile/app/ui/res/generated/i18n.dart';
import 'package:attendance_mobile/app/ui/widgets/button.dart';
import 'package:attendance_mobile/app/ui/widgets/loading.dart';
import 'package:attendance_mobile/app/ui/widgets/text_input.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class LoginPage extends View {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState(
      AppComponent.getInjector().getDependency<LoginController>());
}

class _LoginPageState extends ViewState<LoginPage, LoginController>
    with WidgetsBindingObserver {
  _LoginPageState(LoginController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget buildPage() {
    return new Scaffold(
      key: globalKey,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Image(
                image: AssetImage('lib/app/ui/assets/images/logo.png'),
              ),
              height: 162,
              width: 162,
            ),
            Container(
              child: CommonTextInput(
                isDense: true,
                isError: controller.errorMessage.employeecode?.isNotEmpty ?? false,
                errorText: controller.errorMessage.employeecode,
                controller: controller.employeeNumberInput,
                placeholder: S.of(context).input_placeholder_employee,
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
              child: CommonTextInput(
                isPassword: true,
                isDense: true,
                textObscured: controller.isObscured,
                onVisibilityPressed: () {
                  controller.toggleVisibility();
                },
                isError: false,
                controller: controller.passwordInput,
                placeholder: S.of(context).input_placeholder_password,
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage('lib/app/ui/assets/icons/vpn_key_icon.png'),
                    size: 20,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              child: CommonButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 48,
                isDisabled: false,
                buttonText: 
                    S.of(context).label_enter.toUpperCase(),
                onPressed: () {
                  _onLoginButtonPressed();
                },
              ),
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.06, 20, 0),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    controller.login();
  }
}
