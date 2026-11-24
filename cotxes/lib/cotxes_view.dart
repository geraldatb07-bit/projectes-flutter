import 'package:flutter/material.dart';

import 'cotxes_viewmodel.dart';

class CotxesView extends StatelessWidget {
  final carViewModel = CotxesViewModel();

  CotxesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [Expanded(child: CarPages(viewModel: carViewModel))],
          ),
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final CotxesViewModel viewModel;

  const CarCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 600,
              height: 400,
              child: Column(
                children: [
                  Text(
                    viewModel.marcaCotxe.toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(viewModel.modelCotxe),
                  Image.network(viewModel.urlImatge, width: 400, height: 350),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Cavalls:'),
                            Text('${viewModel.cavallsCotxe}'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Producció:'),
                            Text(
                              '${viewModel.iniciProduccioCotxe} - '
                              '${viewModel.fiProduccioCotxe ?? 'Actualitat'}',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Tracció:'),
                            Text(viewModel.traccioCotxe),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CarPages extends StatelessWidget {
  final CotxesViewModel viewModel;

  const CarPages({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: viewModel.anterior,
          icon: const Icon(Icons.arrow_left),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarCard(viewModel: viewModel),
              const SizedBox(height: 8),
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, child) => Text('${viewModel.indexActual}'),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: viewModel.seguent,
          icon: const Icon(Icons.arrow_right),
        ),
      ],
    );
    
  }
}
