import 'package:flutter/material.dart';

import 'pokemons_viewmodel.dart';

class PokemonView extends StatelessWidget {
  final viewModel = PokemonsViewModel();

  PokemonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              PokemonCard(viewModel: viewModel),
              const Spacer(),
              PokemonPages(viewModel: viewModel),
            ],
          ),
        ),
      ),
    );
  }
}

class PokemonCard extends StatelessWidget {
  final PokemonsViewModel viewModel;

  const PokemonCard({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Card(
          color: Colors.lightGreen,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
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

class PokemonPages extends StatelessWidget {
  final PokemonsViewModel viewModel;

  const PokemonPages({required this.viewModel, super.key});

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
