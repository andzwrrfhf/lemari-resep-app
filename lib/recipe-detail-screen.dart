import 'package:flutter/material.dart';
import 'package:lemari_resep_app/model/popular-recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool isSaved = false;
  bool isLoved = false;

  @override
  Widget build(BuildContext context) {
    final isWebsite = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      extendBodyBehindAppBar: !isWebsite,
      appBar: isWebsite
          ? AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.recipe.name),
                    ],
                  ),
                ),
              ),
            )
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                margin: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              actions: [
                _buildActionButton(Icons.favorite, isLoved, () {
                  setState(() => isLoved = !isLoved);
                }),
                _buildActionButton(Icons.bookmark, isSaved, () {
                  setState(() => isSaved = !isSaved);
                }),
              ],
            ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.recipe.image,
                  width: double.infinity,
                  height: isWebsite ? 600 : 300,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(isWebsite ? 16.0 : 8.0), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.recipe.name,
                        style: isWebsite
                            ? Theme.of(context).textTheme.headlineMedium
                            : Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.recipe.country ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 8),
                          Text('${widget.recipe.cookingTime} minutes'),
                          const SizedBox(width: 16),
                          const Icon(Icons.person),
                          const SizedBox(width: 8),
                          Text('${widget.recipe.serving ?? "N/A"} servings'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Ingredients',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.recipe.ingredients.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text('${index + 1}. ${widget.recipe.ingredients[index]}'),
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Instructions',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.recipe.steps.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text('${index + 1}. ${widget.recipe.steps[index]}'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
      IconData icon, bool isActive, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isActive ? Colors.red : Colors.grey,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
