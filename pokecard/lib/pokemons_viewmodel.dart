import 'package:flutter/material.dart';

import 'pokemons_model.dart';

class PokemonsViewModel extends ChangeNotifier {
  final Pokemons model = Pokemons();
  int indexActual = 0;

  Pokemon get pokemonActual => model.llista[indexActual];
  String get nomPokemon => pokemonActual.nom;
  int get numeroPokemonActual => pokemonActual.numero;
  String get urlImatge =>  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/versions/generation-i/red-and-green/$numeroPokemonActual.png";



  void seguent() {
    if (indexActual < model.llista.length - 1) {
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
