import 'package:flomreadapp/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(), // intialize with the Controller
      builder: (_) => Scaffold(
        //DOS COLUMNAS
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            header(context, _),
            tabs(_, context),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => _.indexSegment.value == 0
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                child: lista(context, "Josue"),
                                onTap: () => {print(index)});
                          }),
                    )
                  : _.indexSegment.value == 1
                      ? Expanded(
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return lista(context, "Xavier");
                              }),
                        )
                      : Expanded(
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index) {
                                return lista(context, "Luis");
                              }),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabs(value, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: DefaultTabController(
          length: 3,
          child: Builder(builder: (BuildContext context) {
            DefaultTabController.of(context)?.addListener(() {
              value.indexSegment.value =
                  (DefaultTabController.of(context)!.index);
            });
            return const SegmentedTabControl(
              backgroundColor: Color.fromARGB(255, 227, 227, 227),
              indicatorColor: Color.fromARGB(255, 255, 142, 12),
              tabTextColor: Color.fromARGB(255, 55, 55, 55),
              tabs: [
                SegmentTab(label: "Mis libros"),
                SegmentTab(label: "Leidos"),
                SegmentTab(label: "Sin leer")
              ],
            );
          })),
    );
  }

  Widget header(context, controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 230,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            //HEADER
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Nombres
                      Text('${controller.lector.nombres} ${controller.lector.apellidos}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.08)),
                      const SizedBox(height: 20),
                      const Text(
                        'Nivel',
                        style: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
                      //Nivel
                      Text('Becario',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035)),
                      const SizedBox(height: 20),
                      const Text(
                        'Institución',
                        style: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
                      Text(controller.lector.institucion.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035)),
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                width: MediaQuery.of(context).size.width * 0.4,
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
    );
  }

  Widget lista(context, lector) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        width: Get.width * 0.9,
        color: Color.fromARGB(255, 236, 235, 235),
        child: Row(
          //HEADER
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://img.freepik.com/foto-gratis/feliz-joven-estudiante-sosteniendo-cuadernos-cursos-sonriendo-camara-pie-ropa-primavera-sobre-fondo-azul_1258-70161.jpg?w=2000'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(lector, style: TextStyle(fontWeight: FontWeight.bold)),
                const Text('Becario',
                    style:
                        TextStyle(color: Color.fromARGB(255, 104, 104, 104))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
