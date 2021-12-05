import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peliculas/startapp/widgets.dart';
import 'package:peliculas/widgets/dialogCustom.dart';
import 'package:peliculas/widgets/styles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuario = TextEditingController();
  var pass = TextEditingController();
  bool visiblePass = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 60,
              left: 10,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Movie App',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28),
                    ),
                    Text(
                      'Bienvenidos',
                      style: titleLoginStyle,
                    ),
                    SizedBox(height: 150),
                    InputTransparent(
                        size: size,
                        text: 'Usuario',
                        icon:
                            FaIcon(FontAwesomeIcons.user, color: Colors.white),
                        controller: usuario),
                    Container(
                      width: size.width - 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            width: size.width - 100,
                            child: TextFormField(
                                controller: pass,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: visiblePass,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: 'Contraseña',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintStyle: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    icon: FaIcon(FontAwesomeIcons.lock,
                                        color: Colors.white))),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                visiblePass = !visiblePass;
                              });
                            },
                            child: Container(
                                width: 50,
                                alignment: Alignment.center,
                                child: FaIcon(
                                  visiblePass
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                         
                          final tempPass = pass.text;
                          if ( tempPass.isNotEmpty) {
                            if ( tempPass == 'hola') {
                              Future.delayed(
                                  Duration(milliseconds: 2500),
                                  () => {
                                        Navigator.pushNamedAndRemoveUntil(
                                            context, 'home', (route) => false)
                                      });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox('Oh no!',
                                        'Tu contraseña es incorrecta 😢', 'OK');
                                  });
                            }
                          } else {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialogBox(
                                      'Error',
                                      'Complete los campos de Email y Contraseña 🤨',
                                      'OK');
                                });
                          }
                        },
                        child: ButtonTransparent(text: 'Iniciar Sesion'))
                  ],
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/it2.gif'),
              colorFilter: ColorFilter.mode(Colors.white70, BlendMode.modulate),
              fit: BoxFit.fitHeight),
        ),
      ),
    );
  }
}
