import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemons_model.dart';

class PokemonsViewModel extends ChangeNotifier {
  final Pokemons model = Pokemons();
  int indexActual = 0;
  String nomTipus = "";

  PokemonsViewModel(){
    extreureTipus();
  }

  Pokemon get pokemonActual => model.llista[indexActual];
  String get nomPokemon => pokemonActual.nom;
  int get numeroPokemonActual => pokemonActual.numero;
  String get urlImatge =>
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/versions/generation-i/red-and-green/$numeroPokemonActual.png";
  String get urlTipus =>
      "https://pokeapi.co/api/v2/pokemon/$numeroPokemonActual/";

  Future<void> extreureTipus() async {
    final resposta = await http.get(
      Uri.parse(urlTipus),
    ); // // Converteix l'adreça en Uri i espera la resposta de l'API.
    final dades = jsonDecode(
      resposta.body,
    ); // Converteix el text JSON de la resposta en dades consultables.
    final tipus = dades['types'][0]['type']['name'];
    nomTipus = tipus;
    notifyListeners();
  }

  Color get colorTipus {
    switch (nomTipus) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.orange;
      case 'water':
        return Colors.blue;
      case 'bug':
        return Colors.lightGreen;
      default:
        return Colors.grey;
    }
  }

  void seguent() {
    if (indexActual < model.llista.length - 1) {
      indexActual++;
      extreureTipus();
      notifyListeners();
    }
  }

  void anterior() {
    if (indexActual > 0) {
      indexActual--;
      extreureTipus();
      notifyListeners();
    }
  }
}
