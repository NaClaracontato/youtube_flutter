import 'package:flutter/material.dart';

class Customsearchdelegate extends SearchDelegate<String> {
  @override
  //Botão de limpar pesquisa
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

//Botão para voltar para tela de inicio
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

//Captura a pesquisa realizada
  @override
  Widget buildResults(BuildContext context) {
    //print('resultado: pesquisa realizada');
    close(context, query);
    return Container();
  }

//palavra digitada
  @override
  Widget buildSuggestions(BuildContext context) {
    //print('resultado: digitado $query');
    return Container();
    /*
    List<String> lista;

    if (query.isNotEmpty) {
      lista = ['Pica-pau', 'cachorro', 'Episódios Antigos']
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                close(context, index.toString());
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text('nenhum resultado para a pesquisa'),
      );
    }
     */
  }
}
