import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_place_core/core/model/promocao_model.dart';


class Promocoes extends StatelessWidget {
  Promocoes(this.promocoes, {Key key}) : super(key: key);

  List<PromocaoModel> promocoes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Promoções',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CarouselSlider(
          items: promocoes
              .map(
                (promocao) => ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.network(
                        promocao.urlImagem,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Colors.red[400],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${promocao.desconto.toStringAsFixed(0)}% OFF',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
          options: CarouselOptions(
            disableCenter: true,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            height: 200,
          ),
        ),
      ],
    );
  }
}
