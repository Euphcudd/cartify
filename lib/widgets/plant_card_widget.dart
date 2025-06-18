import 'package:flutter/material.dart';
import '../models/plant_model.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.green[50],
      ),
      child: Column(
        children: [
          Expanded(child: Image.network(plant.imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text(
                  plant.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('₹${plant.price}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
