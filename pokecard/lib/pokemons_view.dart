import 'package:flutter/material.dart';

import 'pokemons_viewmodel.dart';

class Pokedex extends StatelessWidget {
  final pokedexViewModel = PokemonsViewModel();

  Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PokeCard(viewModel: pokedexViewModel),
              const Spacer(),
              PokePages(viewModel: pokedexViewModel),
            ],
          ),
        ),
      ),
    );
  }
}

class PokeCard extends StatelessWidget {
  final PokemonsViewModel viewModel;

  const PokeCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Card(
          color: viewModel.colorTipus,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  width: 300,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      viewModel.nomTipus.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Text(
                  viewModel.nomPokemon,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Image.network(viewModel.urlImatge, width: 300, height: 300),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PokePages extends StatelessWidget {
  final PokemonsViewModel viewModel;

  const PokePages({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: viewModel.anterior,
              child: const Icon(Icons.arrow_left),
            ),
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) =>
                  Text('${viewModel.numeroPokemonActual}'),
            ),
            ElevatedButton(
              onPressed: viewModel.seguent,
              child: const Icon(Icons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
