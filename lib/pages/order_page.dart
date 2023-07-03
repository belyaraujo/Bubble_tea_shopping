//import 'dart:js';

import 'package:bubble_tea_shop/models/drink.dart';
import 'package:bubble_tea_shop/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({
    super.key, 
    required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  // Customização do quanto de doce
  double sweetValue = 0.5;
  void customizeSweet(double newValue){
    setState(() {
      sweetValue = newValue;
    });
  }

  // Customização do quanto de gelo
  double iceValue = 0.5;
  void customizeIce(double newValue){
    setState(() {
      iceValue = newValue;
    });
  }

  // Customização do quanto de bubble
  double bubbleValue = 0.5;
  void customizeBubble(double newValue){
    setState(() {
      bubbleValue = newValue;
    });
  }

  // Adicionar ao carrinho
  // void addToCart(){
  //   Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

  //   Navigator.pop(context);

  //   showDialog(
  //     context: context, 
  //     builder: (context) => AlertDialog(
  //       title: Text("Adicionado ao carrinho!"),
  //     ),
  //     );
  // }
//   void addToCart(BuildContext context) {
//   Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

//   Navigator.pop(context);

//   showDialog(
//     context: context,
//     builder: (context) => AlertDialog(
//       title: Text("Adicionado ao carrinho!"),
//     ),
//   );
// }

void addToCart(BuildContext context) {
  Provider.of<BubbleTeaShop>(context, listen: false).addToCart(widget.drink);

  Navigator.pop(context);

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Adicionado ao carrinho!"),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.drink.name)),
      backgroundColor: Colors.brown[200],
      body: Column(
        children: [
          // Imagem da bebida
          Image.asset(widget.drink.imagePath),

          // Sliders para customizar as bebidas
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // Slider de docura
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const SizedBox(
                    
                    width: 100,
                    child: Text('Doce')
                    ),
                  Expanded(
                    child: Slider(
                    value: sweetValue,
                    label: sweetValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizeSweet(value),
                    ),
                  ),
                ],
                ),
          
                // Slider de gelo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const SizedBox(
                    
                    width: 100,
                    child: Text('Gelo')
                    ),
                  Expanded(
                    child: Slider(
                    value: iceValue,
                    label: iceValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizeIce(value),
                    ),
                  ),
                ],
                ),
          
                // Slider das bubble
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const SizedBox(
                    
                    width: 100,
                    child: Text('Bubble')
                    ),
                  Expanded(
                    child: Slider(
                    value: bubbleValue,
                    label: bubbleValue.toString(),
                    divisions: 4,
                    onChanged: (value) => customizeBubble(value),
                    ),
                  ),
                ],
                ),
          
              ],
            ),
          ),

          // Adicionar no carrinho
         MaterialButton(
          child: Text(
            "Adicionar ao carrinho",
            style: TextStyle(
              color: Colors.white,
              ),
              ),
            color: Colors.brown,
            onPressed: () => addToCart(context), // Chama a função addToCart com o contexto
),
        ],
        ),
    );
  }
}