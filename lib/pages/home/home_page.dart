import 'package:flomreadapp/pages/home/home_controller.dart';
import 'package:flomreadapp/pages/home/widgets/home_label.dart';
import 'package:flomreadapp/pages/home/widgets/home_list.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            //DOS COLUMNAS
            backgroundColor: const Color.fromARGB(255, 236, 235, 235),
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 230,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        //HEADER
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Gabriela Bermeo',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                Text('Becario'),
                                Text('Colegio'),
                              ],
                            ),
                          ),
                          Container(
                            // child: Image.network('https://img.freepik.com/foto-gratis/feliz-joven-estudiante-sosteniendo-cuadernos-cursos-sonriendo-camara-pie-ropa-primavera-sobre-fondo-azul_1258-70161.jpg?w=2000',
                            //   width: 250,
                            //   height: 250,
                            // ),
                            height: 220,
                            width: 180,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: NetworkImage(
                                    'https://img.freepik.com/foto-gratis/feliz-joven-estudiante-sosteniendo-cuadernos-cursos-sonriendo-camara-pie-ropa-primavera-sobre-fondo-azul_1258-70161.jpg?w=2000'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: DefaultTabController(
                      length: 3,
                      child: SegmentedTabControl(
                        tabs: [
                          SegmentTab(
                            label: "Mis libros",
                          ),
                          SegmentTab(
                            label: "Leidos",
                          ),
                          SegmentTab(
                            label: "Sin leer",
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    //HEADER
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/foto-gratis/feliz-joven-estudiante-sosteniendo-cuadernos-cursos-sonriendo-camara-pie-ropa-primavera-sobre-fondo-azul_1258-70161.jpg?w=2000'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Gabriela Bermeo',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Becario', style: TextStyle(color: Color.fromARGB(255, 104, 104, 104))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
