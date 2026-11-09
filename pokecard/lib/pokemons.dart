void main(){
  var pokemons = Pokemons();
  
  imprimeixPokemon(pokemons);
  pokemons.seguent();
  imprimeixPokemon(pokemons);
  pokemons.anterior();

}


void imprimeixPokemon(Pokemons p){
  print(p.pokemonActual);
  print(p.numActual);
  print(p.urlImatge);
  print("");
}

class Pokemons {
  List<String> llista = [
    "bulbasaur",
    "ivysaur",
    "venusaur",
    "charmander",
    "charmeleon",
    "charizard",
    "squirtle",
    "wartortle",
    "blastoise",
    "caterpie",
    "metapod",
    "butterfree",
    "weedle",
    "kakuna",
    "beedrill",
  ];
  
  int indexActual = 0;
  

  String get pokemonActual {
    return llista[indexActual];  
  }
  int get numActual {
    return indexActual + 1;
  }
  String get urlImatge {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/versions/generation-i/red-and-green/${indexActual+1}.png";
  }
  void seguent(){
    if(indexActual<16){
      indexActual++;
    }
  }
  void anterior(){
    if(indexActual>0){
      indexActual--;
    }
  }
    
}