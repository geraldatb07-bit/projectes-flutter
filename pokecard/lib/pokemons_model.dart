class Pokemon{
  final String nom;
  final int numero;

  Pokemon(this.nom, this.numero);
}

class Pokemons {
  List<Pokemon> llista = [
    Pokemon("bulbasaur", 1),
    Pokemon("ivysaur", 2),
    Pokemon("venusaur", 3),
    Pokemon("charmander", 4),
    Pokemon("charmeleon", 5),
    Pokemon("charizard", 6),
    Pokemon("squirtle", 7),
    Pokemon("wartortle", 8),
    Pokemon("blastoise", 9),
    Pokemon("caterpie", 10),
    Pokemon("metapod", 11),
    Pokemon("butterfree", 12),
    Pokemon("weedle", 13),
    Pokemon("kakuna", 14),
    Pokemon("beedrill", 15),
  ];    
}