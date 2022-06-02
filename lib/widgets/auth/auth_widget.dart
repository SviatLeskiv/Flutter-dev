import 'package:flutter/material.dart';
import 'package:v_temi/consts.dart';


class AuthMenu extends StatelessWidget {
  const AuthMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange[700],
        centerTitle: true,
        title: const Image(image: AssetImage(MyImages.logoMain),
          height: 50,
        ),
      ),
      body: ListView(
        children: const [
          _FormWidget()
        ]
      ),
    );
  }
}
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {

  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  void _auth(){
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login =='' && password ==''){
      final navigator = Navigator.of(context);
      navigator.pushReplacementNamed('/myPage');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom:50, top: 100),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(MyImages.logo), width: 125),
            const SizedBox(height: 50),
            const Text('Вхід:', style: MyFonts.onBlack),
            const SizedBox(height: 30),
            TextField(
              cursorColor: Colors.orange,
              decoration: MyTextField.textFieldDecor(' Номер телефону'), style: MyFonts.onBlack, controller: _loginTextController),
            const SizedBox(height: 20),
            TextField(
              cursorColor: Colors.orange,
              obscureText: true, decoration: MyTextField.textFieldDecor(' Пароль'), style: MyFonts.onBlack, controller: _passwordTextController),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                onPressed:_auth, 
                style: MyButtons.fillOrange,
                child: const Text('Увійти')),
                const SizedBox(width: 20),
                TextButton(
                onPressed:() {}, 
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.orange)
                ),
                child: const Text('Забули пароль?')),
              ],
            ),
            const SizedBox(height: 80),
            TextButton(
                onPressed:() {}, 
                style: MyButtons.fillOrange,
                child: const Text('Реєстрація')),
          ],
        ),
      ),
    );
  }
}
