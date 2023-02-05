import 'dart:developer';

import 'package:app_pokedexx/detalhe.dart';
import 'package:app_pokedexx/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonWidget({super.key, required this.pokemon});

  Widget build(BuildContext context){
    log(pokemon.thumbnailImage.toString());
    return Card(
            child: InkWell(
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Detalhe(
                    pokemon: pokemon,
                    );
               }));
              },
              child: Row(
                children: [
                  Image.network(pokemon.thumbnailImage ?? '',
                  height: 100,
                  ),
                  const SizedBox(
                    width: 16,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(
                    pokemon.number ?? '',
                    
                  ),
                  Text(
                    pokemon.name ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                      ),
                  ),
                      ],
                    )
                ],
                  ),
            ),
            );
  }
}