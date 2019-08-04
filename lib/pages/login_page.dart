import 'package:flutter/material.dart';
import '../blocs/bloc_login.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/widget/dialog/error_dialog.dart';
import 'package:login/widget/single_line_textfield.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  LoginBloc _loginBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 4), _login);
    });
  }


  Future _login() async{
    setState((){
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loginBloc=LoginBloc();

  }

  @override
  void dispose() {

    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xff243b55),
                  Color(0xff141e30),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child:_loading ? _progressLayoutWidget() :_inputForm(context),
                ),
              ),
            ),
          )
        ),
    );
  }
  _inputForm(context){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlutterLogo(
          size: 96,
          duration: Duration(seconds: 3),
          curve: Curves.easeInOut,
        ),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SingleLineTextField(
                controller: emailController,
                validator: (email) {
                  if(email.isEmpty)
                    return  "Email can't be empty";
                },
                title: 'Email',
                inputType: TextInputType.emailAddress,
              ),
              SingleLineTextField(
                controller: passwordController,
                validator: (password) {
                  if(password.isEmpty)
                    return "Password can't be empty";
                },
                title:'Password',
                isPassword: true,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 15,
              ),
              LoginButton(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                title: 'Login',
                onTap: () async {
                  if(_formKey.currentState.validate()){
                    _onLoading();
                    final result = await _loginBloc.login(emailController.text, passwordController.text);
                    if (result != null) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                    }
                    else{
                      _showErrorDialog(context);
                      _login();
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
  _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ErrorDialog(
        onPress: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
  Widget _progressLayoutWidget() {
    return StreamBuilder<bool>(
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData)
          return Container(
            height: 50,
            width: 50,
            child: Center(
              child: new CircularProgressIndicator()
            ),
          );
        else
          return Container();
      },
    );
  }
}
class LoginButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  final EdgeInsetsGeometry margin;

  LoginButton({
    this.title = '',
    @required this.onTap,
    this.margin = const EdgeInsets.only(top: 20, bottom: 15),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: double.infinity,
      width: 260,
      height: 45,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            Colors.blue,
            Colors.blueGrey
          ],
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            )),
      ),
    );
  }
}
