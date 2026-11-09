import 'package:flutter/material.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                pokeCard(),
                Spacer(),
                pokePages()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class pokeCard extends StatelessWidget {
  const pokeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.lightGreen,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "Bulbasur",
                style: Theme.of(context).textTheme.titleLarge
              ),
              Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/versions/generation-i/red-and-green/2.png",
                width: 300,
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class pokePages extends StatelessWidget {
  const pokePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_left)
            ),
            const Text("1"),
            ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_right)
            ),
          ],
        ),
      ),
    );
  }
}
