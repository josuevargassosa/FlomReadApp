import 'package:flomreadapp/pages/auth/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const NetworkImage(
                  'https://img.freepik.com/fotos-premium/estudiantes-felices-leyendo-libro-biblioteca-juntos_123211-2200.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/img/logo.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Center(
                child: Text(
                  'Ingrese su correo y clave',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 188, 188, 188),
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
              ),
              //CORREO
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  children: const [
                    Text(
                      'CORREO',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: CupertinoTextField(
                  onChanged: _.onInputCorreoChanged,
                ),
              ),

              //CLAVE
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Row(
                  children: const [
                    Text(
                      'CLAVE',
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 40,
                child: CupertinoTextField(
                  onChanged: _.onInputClaveChanged,
                ),
              ),
              const SizedBox(height: 30),
              Text(_.loginMessageFail,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 0, 0),
                  )),
              const SizedBox(height: 30),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CupertinoButton(
                    onPressed: _.goToBackWithData,
                    child: const Text(
                      'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),

              Text(_.mensajeError),
            ],
          ),
        ),
      ),
    );
  }
}
