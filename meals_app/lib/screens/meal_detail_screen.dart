import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal-detail';

  final Function toggleFavourite;
  final Function isFavourite;

  MealDetailScreen(this.toggleFavourite,this.isFavourite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: MediaQuery.of(context).size.width - 50,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${selectedMeal.title}',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              context,
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index])),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}',style: TextStyle(fontWeight: FontWeight.bold,),
                        ),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(
        child: Icon(
           isFavourite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavourite(mealId),
         // child: Icon(Icons.delete),
        // onPressed: (){
        //   Navigator.of(context).pop(mealId);
        // },
      ),
    );
  }
}

       
       
    