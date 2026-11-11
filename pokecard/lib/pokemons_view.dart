import 'package:flutter/material.dart';
import 'pokemons_viewmodel.dart';


class Pokedex extends StatelessWidget {
    final pokedexViewModel = PokemonsViewModel(); // Pokedex crea l'objecte una sola vegada
    Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                PokeCard(viewModel: pokedexViewModel), // El passa a PokeCard
                Spacer(),
                PokePages(viewModel: pokedexViewModel) // El passa a Pages
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PokeCard extends StatelessWidget {
  final PokemonsViewModel viewModel; // Rep el ViewModel de Pokedex 

  PokeCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.lightGreen,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, child){
                    return Column(
                      children: [
                        Text(viewModel.nomPokemon, style: Theme.of(context).textTheme.titleLarge),
                        Image.network(viewModel.urlImatge, width: 300, height: 300),
                      ],
                    ); 
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PokePages extends StatelessWidget {
  final PokemonsViewModel viewModel; // Rep el mateix ViewModel 

  PokePages({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {viewModel.anterior();},
              child: Icon(Icons.arrow_left)
            ),
            ListenableBuilder(
                listenable: viewModel,
                builder: (context, child){
                    return Text('${viewModel.numeroPokemonActual}');
                }
            ),
            ElevatedButton(
              onPressed: () {viewModel.seguent();},
              child: Icon(Icons.arrow_right)
            ),
          ],
        ),
      ),
    );
  }
}
