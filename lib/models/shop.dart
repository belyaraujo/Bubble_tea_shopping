import 'package:flutter/material.dart';

import 'drink.dart';

class BubbleTeaShop extends ChangeNotifier{
  // Lista de bebidas à venda

  final List<Drink> _shop = [
    //Pearl milk tea
    Drink(name: "Taiwan Original", 
          price: "15.00",
          imagePath: "lib/images/milk_tea.png",
          ),

     Drink(name: "Nutty Caramel", 
          price: "18.00",
          imagePath: "lib/images/nutty.png",
          ),

    Drink(name: "Sunset Tea", 
          price: "15.00",
          imagePath: "lib/images/pink_tea.png",
          ),

    Drink(name: "Macha Tea", 
          price: "16.00",
          imagePath: "lib/images/macha.png",
          ),

      Drink(name: "Maracuchá", 
          price: "16.00",
          imagePath: "lib/images/maracuchá.png",
          ),
    
  ];

  // Lista de bebibas no carrinho do usuário
  final List<Drink> _userCart = [];

  // Pegar bebidas à venda
  List<Drink> get shop => _shop;

  // Pegar carrinho do usuário
  List<Drink> get cart => _userCart;

  // Adicionar bebida no carrinho
  void addToCart(Drink drink){
    _userCart.add(drink);
    notifyListeners();
  }

  // Remover bebida do carrinho
  void removeFromCart(Drink drink){
    _userCart.remove(drink);
    notifyListeners();
  }
}