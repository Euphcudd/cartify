import 'package:cartify/models/carTtem_model.dart';
import 'package:cartify/models/plant_model.dart';
import 'package:cartify/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void addPlantToCart(BuildContext context, Plant plant) {
  final cart = Provider.of<CartProvider>(context, listen: false);

  final cartItem = CartItem(
    id: plant.id,
    plantId: plant.id,
    name: plant.name,
    imageUrl: plant.fallbackImage1,
    price: plant.price,
    quantity: 1,
    varietyName: null,
  );

  cart.addItem(cartItem);

  //show snackbar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Added to cart!'),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      animation: CurvedAnimation(
        parent: kAlwaysCompleteAnimation,
        curve: Curves.easeOut,
      ),
    ),
  );
}

void addVarietyToCart(BuildContext context, Plant plant, PlantVariety variety) {
  final cart = Provider.of<CartProvider>(context, listen: false);

  final id = plant.id + variety.name.replaceAll(' ', ''); // unique id

  final cartItem = CartItem(
    id: id,
    plantId: plant.id,
    name: plant.name,
    imageUrl: variety.thumbnailImage ?? variety.image1,
    price: variety.price,
    quantity: 1,
    varietyName: variety.name,
  );
  //show snackbar

  cart.addItem(cartItem);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Added to cart!'),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      animation: CurvedAnimation(
        parent: kAlwaysCompleteAnimation,
        curve: Curves.easeOut,
      ),
    ),
  );
}
