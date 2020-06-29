import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/add_item_popup.dart';
import 'package:flutter_learn/custom_widgets/itemcard.dart';

class AddOfferItemsBody extends StatefulWidget {
  final List categoryListFiltered;
  final List itemList;

  const AddOfferItemsBody({Key key, this.categoryListFiltered, this.itemList}) : super(key: key);
  @override
  _AddOfferItemsBodyState createState() => _AddOfferItemsBodyState();
}

class _AddOfferItemsBodyState extends State<AddOfferItemsBody> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCategory;
  
  @override
  Widget build(BuildContext context) {
    void _showAddItemPopup(List selectedItems){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 450.0,
            //padding: EdgeInsets.all(30.0),
            child:AddItemPopup(selectedItems:selectedItems),
          ),
        );
      }).then((_)=>setState((){}));
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text('Select Items to add',style: TextStyle(fontSize: 22.0),),
          SizedBox(height: 10.0,),
          Text('Filter By Category',style: TextStyle(fontSize: 15.0),),
          Form(
            key: _formKey,
            child: Container(
              child: DropdownButtonFormField(
                value: _selectedCategory,
                //validator: (val) =>val=='Select Job Title'? 'Enter Your Job Title':null,
                isDense: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.grey,),
                ),
                items: widget.categoryListFiltered.map((category){
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(()=> _selectedCategory=value );
                },
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Container(
            height: 300.0,
            child: ListView.builder(
                itemCount: widget.itemList.where((e)=>e.category==_selectedCategory).toList().length,
                itemBuilder: (context,index){
                  return ItemCard(item : widget.itemList.where((e)=>e.category==_selectedCategory).toList()[index]);
                }
            ),
          ),
          RaisedButton(
              child: Text(
                'Show Selected Item',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.cyan,
              onPressed: () {
                List selectedItems = widget.itemList.where((i)=>i.quantity>0).toList();
                print(selectedItems);
                _showAddItemPopup(selectedItems);
              }
          ),
        ],
      ),
    );
  }
}
