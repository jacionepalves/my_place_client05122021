import 'package:flutter/material.dart';
import 'package:my_place_admin/pages/home/widgets/promocoes.dart';
import 'package:my_place_core/core/model/categoria_model.dart';
import 'package:my_place_core/core/model/promocao_model.dart';
import 'package:my_place_core/widgets/mp_app_bar.dart';
import 'package:my_place_core/widgets/mp_button_icon.dart';
import 'package:my_place_core/widgets/mp_loading.dart';
import 'package:my_place_core/widgets/mp_logo.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController();

  Future<List<PromocaoModel>> futurePromocoes;
  Future<List<CategoriaModel>> futureCategorias;

  @override
  void initState() {
    futurePromocoes = _controller.getPromocoes();
    futureCategorias = _controller.getCategorias();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPAppBar(
        title: MPLogo(
          fontSize: 24,
        ),
        actions: [
          MPButtonIcon(
            iconData: Icons.shopping_cart,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              children: [
                FutureBuilder<List<PromocaoModel>>(
                  future: futurePromocoes,
                  builder: ( _, snapshot) {
                    if (snapshot.hasData) {
                      return Promocoes(snapshot.data);
                    } else {
                      return SizedBox(
                        height: 200,
                        child: MPLoading(),
                      );
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
