
import 'package:app_pokedexx/pokemon.dart';
import 'package:flutter/material.dart';

class Detalhe extends StatelessWidget {
  final Pokemon pokemon;
  const Detalhe({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name ?? '')),
      body: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Image.network(
                    pokemon.thumbnailImage ?? '',
                   height: 150,),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('#${pokemon.number}'),
                  ),
              ],
            ),
            Column(
              children: [
                Text(   
                        pokemon.description ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                          ),
                      ),
              ],
            ),
                   Padding(
                    
                    padding: const EdgeInsets.all(30.0),
                    child: Text('#${pokemon.type}',
                    
                    ),
                   
                    
                  ),
                   Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('#${pokemon.weakness}'),
                  ),
                  
          ],
            
          ),
      ),
    );
  }
}