import 'dart:convert';
import 'dart:developer';

import 'package:app_pokedexx/pokemon.dart';
import 'package:app_pokedexx/pokemon_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Pokemon> pokemonList = [];

bool carregando = true;

@override
  void initState() {
    _getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
               return PokemonWidget(
                pokemon: pokemonList[index],
               );
            },
          ),
          if(carregando) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _getPokemons() async{

    try {
    var response = await Dio().get('http://104.131.18.84/pokemon/');

    if(response.statusCode == 200){
     
     setState(() {
       pokemonList = (response.data['data'] as List).map(
      (json) {
          return Pokemon.fromJson(json);
      },
      ).toList();

        carregando = false;
     });
    }else{
      print('Falha ao obter os pokemons');
    }
  } catch (e) {
    print(e);
  }
  }
}