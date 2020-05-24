import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drwaer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabScreen(this.favouriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
     _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favouriteMeals), 'title': 'Favourite'},
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favourite'),
          ),
        ],
      ),
    );
  }
}

//Followind Used For UPWARD TAB BAR

// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     //initialIndex: 0,
//     child: Scaffold(
//       appBar: AppBar(
//         title: Text('Meals'),
//         bottom: TabBar(
//         //  indicator: UnderlineTabIndicator(
//         //    borderSide: BorderSide(width: 5.0),
//         //    insets: EdgeInsets.symmetric(horizontal: 0.0),
//         //  ),
//           tabs: <Widget>[
//           Tab(
//             icon: Icon(Icons.category,),
//             text: 'Categories',
//           ),
//           Tab(
//             icon: Icon(Icons.star),
//             text: 'Favourite',
//           ),
//         ],),
//       ),
//       body: TabBarView(children: <Widget>[
//         CategoriesScreen(),
//         FavouriteScreen(),
//       ],),
//     ),
//   );
// }
