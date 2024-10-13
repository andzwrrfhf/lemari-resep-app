import 'package:flutter/material.dart';
import 'package:lemari_resep_app/model/popular-recipe.dart';
import 'package:lemari_resep_app/widget/app_bar.dart';
import 'package:lemari_resep_app/recipe-detail-screen.dart';
import 'package:lemari_resep_app/layout/recipe-card.dart';

class RecipeListScreen extends StatelessWidget {
  final String title;
  final List<Recipe> recipes;

  const RecipeListScreen({super.key, required this.title, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final isWebsite = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      appBar: isWebsite
          ? const CustomAppBar()
          : AppBar(
              title: Text(title),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isWebsite ? 4 : 2;
              final cardWidth = isWebsite 
                  ? (constraints.maxWidth - 64) / 4 
                  : (constraints.maxWidth - 48) / 2; 
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: cardWidth / 280, 
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: cardWidth,
                    child: RecipeCard(
                      recipe: recipes[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(recipe: recipes[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}