import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

// 1. Création d'une classe pour gérer l'état
class PaysState {
  final List pays;
  final bool isLoading;
  final String errorMessage;

  PaysState({
    this.pays = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  // Méthode pour copier l'état avec des nouvelles valeurs
  PaysState copyWith({
    List? pays,
    bool? isLoading,
    String? errorMessage,
  }) {
    return PaysState(
      pays: pays ?? this.pays,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

// 2. Création du StateNotifier qui contiendra la logique
class PaysNotifier extends StateNotifier<PaysState> {
  final Dio dio;

  PaysNotifier(this.dio) : super(PaysState());

  // Méthode pour charger les pays
  Future<void> getPays() async {
    // Met à jour l'état pour indiquer le chargement
    state = state.copyWith(isLoading: true, errorMessage: '');

    try {
      final response = await dio.get("https://restcountries.com/v3.1/all");
      // Met à jour l'état avec les nouveaux pays
      state = state.copyWith(pays: response.data, isLoading: false);
    } catch (e) {
      // En cas d'erreur, met à jour le message d'erreur
      state = state.copyWith(
        errorMessage: 'Erreur de chargement: ${e.toString()}',
        isLoading: false,
      );
    }
  }
}

// 3. Création du Provider qui expose notre StateNotifier
final paysProvider = StateNotifierProvider<PaysNotifier, PaysState>((ref) {
  return PaysNotifier(Dio());
});