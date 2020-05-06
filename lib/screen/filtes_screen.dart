import 'package:ffluttertraning/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltesScreen extends StatefulWidget {
  static const routerName = '/filters';
  final Function saveFilters;
 final Map<String,bool> currentFilters;
  FiltesScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltesScreenState createState() => _FiltesScreenState();
}

class _FiltesScreenState extends State<FiltesScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _lactoseFree=widget.currentFilters['lactose'];
    _vegan=widget.currentFilters['vegan'];
    _vegetarian=widget.currentFilters['vegetarian'];
    super.initState();
  }
  Widget _buildSwichListTitle(String tile, String Description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(tile),
        value: currentValue,
        subtitle: Text(Description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectFilters={
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.saveFilters(selectFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwichListTitle(
                      'Gluten-Free',
                      'Only include gluten-free meals.',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwichListTitle(
                      'Lactose-free',
                      'Only include lactose-free meals.',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwichListTitle('Vegetarian',
                      'Only include vegetaran meals.', _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwichListTitle(
                      'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
