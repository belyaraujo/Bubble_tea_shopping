import 'package:bubble_tea_shop/components/drink_tile.dart';
import 'package:bubble_tea_shop/models/drink.dart';
import 'package:bubble_tea_shop/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  // Remover do carrinho
  void removeFromCart(Drink drink){
    Provider.of<BubbleTeaShop>(context, listen: false).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Heading
            const Text("Carrinho", 
            style: TextStyle(fontSize: 20),),

            const SizedBox(height: 10),
      
            // Lista de itens do carrinho
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  Drink drink = value.cart[index];

                  return DrinkTile(
                    drink: drink, 
                    onTap: () => removeFromCart(drink), 
                    trailing: Icon(Icons.delete));
                }
                ,
                ),
                ),
      
            // Botão de pagamento
            MaterialButton(
              child: Text('Pagamento', style: TextStyle(color: Colors.white),),
              color: Colors.brown,
              onPressed: () {},
              )
          ],
        ),
      ),
    ),
    );
  }
}