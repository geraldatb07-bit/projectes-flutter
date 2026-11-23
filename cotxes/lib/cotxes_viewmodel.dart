import 'package:flutter/material.dart';
import 'cotxes_model.dart';

class CotxesViewModel extends ChangeNotifier {
  int indexActual = 0;
  
  String get marcaCotxe => cotxes[indexActual]['marca'];
  String get modelCotxe => cotxes[indexActual]['model'];
  int get cavallsCotxe => cotxes[indexActual]['cavalls'];
  int get iniciProduccioCotxe => cotxes[indexActual]['iniciProduccio'];
  int get fiProduccioCotxe => cotxes[indexActual]['fiProduccio'];
  String get traccioCotxe => cotxes[indexActual]['traccio'];
  String get urlImatge => cotxes[indexActual]['urlFoto'];
  
  void seguent() {
    if (indexActual < cotxes.length - 1) {
      indexActual++;
      notifyListeners();
    }
  }

  void anterior() {
    if (indexActual > 0) {
      indexActual--;
      notifyListeners();
    }
  }
}
