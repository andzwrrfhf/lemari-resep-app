import 'package:flutter/material.dart';
import 'package:lemari_resep_app/layout/recipe-card.dart';
import 'package:lemari_resep_app/layout/responsive-layout.dart';
import 'package:lemari_resep_app/model/popular-recipe.dart';
import 'package:lemari_resep_app/widget/app_bar.dart';
import 'package:lemari_resep_app/widget/search_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required RecipeData recipeData});

  Future<RecipeData> fetchRecipes() async {
    await Future.delayed(const Duration(seconds: 2)); 
    return RecipeData(
      popularRecipes: dataResep.popularRecipes,
      koreanRecipes: dataResep.koreanRecipes,
      affordRecipes: dataResep.affordRecipes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return FutureBuilder<RecipeData>(
              future: fetchRecipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading recipes'));
                } else if (snapshot.hasData) {
                  return MobileLayout(recipeData: snapshot.data!);
                } else {
                  return const Center(child: Text('No recipes available'));
                }
              },
            );
          } else {
            return FutureBuilder<RecipeData>(
              future: fetchRecipes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading recipes'));
                } else if (snapshot.hasData) {
                  return WebsiteLayout(recipeData: snapshot.data!);
                } else {
                  return const Center(child: Text('No recipes available'));
                }
              },
            );
          }
        },
      ),
    );
  }
}

class WebsiteLayout extends StatelessWidget {
  final RecipeData recipeData;

  const WebsiteLayout({super.key, required this.recipeData});
  
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSearchBar(),
                const SizedBox(height: 12),
                RecipeCardList(title: 'Resep Populer', recipes: recipeData.popularRecipes),
                RecipeCardList(title: 'Resep Korea', recipes: recipeData.koreanRecipes),
                RecipeCardList(title: 'Resep Terjangkau', recipes: recipeData.affordRecipes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  final RecipeData recipeData;

  const MobileLayout({super.key, required this.recipeData});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomSearchBar(),
            ),
            const SizedBox(height: 8),
            RecipeCardList(title: 'Resep Populer', recipes: recipeData.popularRecipes),
            RecipeCardList(title: 'Resep Korea', recipes: recipeData.koreanRecipes),
            RecipeCardList(title: 'Resep Terjangkau', recipes: recipeData.affordRecipes),
          ],
        ),
      ),
    );
  }
}
