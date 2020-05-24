import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
// import '../providers/products.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../widgets/app_drawer.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorite = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context,listen: false).fetchAndSetProducts();
    //                 OR
    //  Future.delayed(Duration.zero).then((_){
    //    Provider.of<Products>(context).fetchAndSetProducts();
    //  });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  //  productsContainer.showFavouritesOnly();
                  _showOnlyFavorite = true;
                } else {
                  //    productsContainer.showAll();
                  _showOnlyFavorite = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  ),
              child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              )),
        ],
      ),
      body: _isLoading ? Center(child: CircularProgressIndicator(),) : ProductsGrid(_showOnlyFavorite),
    );
  }
}
