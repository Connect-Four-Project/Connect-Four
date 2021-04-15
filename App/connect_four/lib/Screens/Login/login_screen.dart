import 'package:connect_four/Screens/Login/login_body.dart';
import 'package:connect_four/background/background_widget.dart';

class LoginScreen extends MyDynamicStateful {
  LoginScreen() : super(statelessWidget: LoginBody(), moveFromUpToDown: true);
}
