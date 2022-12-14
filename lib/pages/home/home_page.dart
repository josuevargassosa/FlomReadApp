import 'package:flomreadapp/pages/auth/login_page.dart';
import 'package:flomreadapp/pages/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      // intialize with the Controller
      builder: (_) => Scaffold(
        //DOS COLUMNAS
        backgroundColor: const Color.fromARGB(255, 236, 235, 235),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () => {_.refrescarDatos()},
                    icon: const Icon(Icons.refresh,
                        color: Colors.black, size: 30)),
                IconButton(
                    onPressed: () => {cambiarClave()},
                    icon: const Icon(Icons.key, color: Colors.black, size: 30)),
                IconButton(
                    onPressed: () => {Get.offAll(const LoginPage())},
                    icon: const Icon(Icons.logout,
                        color: Colors.black, size: 30)),
              ],
            ),
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
                      itemCount: _.prestamos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return lista(context, _.prestamos[index], _);
                      },
                    ))
                  : _.indexSegment.value == 1
                      ? Expanded(
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: _.prestamosLeidos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return lista(
                                    context, _.prestamosLeidos[index], _);
                              }),
                        )
                      : Expanded(
                          child: ListView.builder(
                              physics: AlwaysScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(8),
                              itemCount: _.prestamosSin.length,
                              itemBuilder: (BuildContext context, int index) {
                                return lista(context, _.prestamosSin[index], _);
                              }),
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(context, controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
                      Text(
                          '${controller.lector.nombres} ${controller.lector.apellidos}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.06)),
                      const SizedBox(height: 20),
                      const Text(
                        'Nivel',
                        style: TextStyle(
                            color: Color.fromARGB(255, 111, 111, 111)),
                      ),
                      //Nivel
                      Text(controller.lector.grado,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.width * 0.035)),
                      const SizedBox(height: 20),
                      const Text(
                        'Instituci??n',
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
              GestureDetector(
                onTap: () => {
                  controller.cambiarFoto(),
                },
                child: Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(controller.lector.fotoPerfil != '' &&
                              controller.lector.fotoPerfil != null
                          ? controller.lector.fotoPerfil
                          : 'https://previews.123rf.com/images/dolgachov/dolgachov1711/dolgachov171101175/89513306-ni%C3%B1o-estudiante-feliz-escribiendo-en-el-cuaderno-en-casa.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
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

  Widget lista(context, prestamo, HomeController homeController) {
    return GestureDetector(
      onTap: () => {
        homeController.loadComentario(prestamo.id),
        comentario(context, prestamo),
      },
      child: Container(
        width: Get.width * 0.9,
        color: const Color.fromARGB(255, 236, 235, 235),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(prestamo.libro.fotoPortada != ''
                          ? prestamo.libro.fotoPortada
                          : 'https://img.freepik.com/foto-gratis/feliz-joven-estudiante-sosteniendo-cuadernos-cursos-sonriendo-camara-pie-ropa-primavera-sobre-fondo-azul_1258-70161.jpg?w=2000'),
                      fit: BoxFit.cover,
                      scale: 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(prestamo.libro.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(prestamo.libro.autor,
                      style:
                          TextStyle(color: Color.fromARGB(255, 104, 104, 104))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  comentario(context, prestamo) {
    showModalBottomSheet<void>(
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          1),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<HomeController>(
            init: HomeController(),
            builder: (_) => Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 247, 247),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: Get.height * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(prestamo.libro.nombre.toString(),
                            style: TextStyle(
                                fontSize: Get.width * 0.08,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: Get.height * 0.02),
                        CupertinoTextField(
                          textInputAction: TextInputAction.next,
                          onChanged: (value) => {_.setDescripcion(value)},
                          controller: _.descripcionController,
                          maxLength: 900,
                          minLines: 20,
                          placeholder: 'Comentario',
                          maxLines: 20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MaterialButton(
                              color: Colors.red,
                              shape: ShapeBorder.lerp(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  1),
                              child: Row(
                                children: const [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text(
                                      'Cancelar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  Icon(Icons.cancel, color: Colors.white),
                                ],
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            !!_.showButton
                                ? MaterialButton(
                                    color: Colors.green,
                                    shape: ShapeBorder.lerp(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        1),
                                    child: Row(
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            'Comentar',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        Icon(Icons.check, color: Colors.white),
                                      ],
                                    ),
                                    onPressed: () => {
                                      _.postComentario(prestamo),
                                      Navigator.pop(context),
                                    }
                                      
                                  )
                                : Text('')
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
      },
    );
  }

  void cambiarClave() {
    final homeController = Get.put(HomeController());

    Get.defaultDialog(
      barrierDismissible: false,
      title: 'Cambiar clave',
      content: Column(
        children: [
          CupertinoTextField(
            textInputAction: TextInputAction.next,
            controller: homeController.claveController,
            maxLength: 900,
            minLines: 1,
            placeholder: 'Clave',
            maxLines: 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
                color: Colors.red,
                shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    1),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.cancel, color: Colors.white),
                  ],
                ),
                onPressed: () => {
                      Get.back(),
                      homeController.claveController.text = '',
                    }),
            MaterialButton(
              color: Colors.green,
              shape: ShapeBorder.lerp(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  1),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'Cambiar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(Icons.check, color: Colors.white),
                ],
              ),
              onPressed: () => {
                homeController.cambiarClave(),
                Get.back(),
              },
            )
          ],
        )
      ],
    );
  }
}
