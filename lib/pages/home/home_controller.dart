import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_place_core/core/model/categoria_model.dart';
import 'package:my_place_core/core/model/promocao_model.dart';

class HomeController {
  final _promocoesRef = FirebaseFirestore.instance.collection('promocoes');
  final _categoriasRef = FirebaseFirestore.instance.collection('categorias');

  Future<List<PromocaoModel>> getPromocoes() async {
    final querySnapshot = await _promocoesRef.get();
    return List.generate(
        querySnapshot.docs.length,
        (i) => PromocaoModel.fromJson(
          querySnapshot.docs[i].id,
            querySnapshot.docs[i].data()));
  }
  
  Future<List<CategoriaModel>> getCategorias() async {
    final querySnapshot = await _categoriasRef.get();
    return List.generate(
        querySnapshot.docs.length,
        (i) => CategoriaModel.fromJson(
          querySnapshot.docs[i].id,
            querySnapshot.docs[i].data()));
  }
}
