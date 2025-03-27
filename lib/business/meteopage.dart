import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app/business/meteocontroller.dart';

class Meteopage extends ConsumerWidget {  // Remplace StatefulWidget par ConsumerWidget
  @override
  Widget build(BuildContext context, WidgetRef ref) {  // Ajoute WidgetRef ref
    // On observe l'état avec ref.watch
    final state = ref.watch(paysProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Pays", style: TextStyle(color: Colors.deepOrange)),
        actions: [
          IconButton(
            onPressed: () => ref.read(paysProvider.notifier).getPays(),
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: _buildBody(state, ref),
    );
  }

  Widget _buildBody(PaysState state, WidgetRef ref) {
    if (state.isLoading) return Center(child: CircularProgressIndicator());
    if (state.errorMessage.isNotEmpty) return Center(child: Text(state.errorMessage));
    if (state.pays.isEmpty) return Center(child: Text("Aucun pays chargé"));

    return ListView.builder(
      itemCount: state.pays.length,
      itemBuilder: (context, index) {
        final country = state.pays[index];
        final flag = country["flag"] ?? "🏳️";
        final name = country["name"]?["common"] ?? "Nom inconnu";
        final capital = country["capital"]?.first ?? "Capitale inconnue";
        
        return ListTile(
          leading: country["flags"]?["png"] != null 
              ? Image.network(
                  country["flags"]["png"],
                  width: 50,
                  errorBuilder: (_, __, ___) => Text("🏳️", style: TextStyle(fontSize: 30)),
                )
              : Text(flag, style: TextStyle(fontSize: 30)),
          title: Text(name),
          subtitle: Text(capital),
        );
      },
    );
  }
}