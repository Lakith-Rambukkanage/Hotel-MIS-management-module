import 'package:flutter/material.dart';
import 'package:flutter_learn/custom_widgets/screen.dart';
import 'package:flutter_learn/custom_widgets/send_notification_form.dart';
import 'package:flutter_learn/pages/home/accountrequests.dart';
import 'package:flutter_learn/pages/home/management.dart';

class ViewStaff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSendPanel(){
      showDialog(context: context, builder: (context){
        return Center(
          child: Container(
            height: 450.0,
            padding: EdgeInsets.all(30.0),
            child:SendBroadcastForm(),
          ),
        );
      });
    }
    return ReusableScreen(
      propic: 'dummypropic.png',
      appBarTitle: 'Staff',
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new Management())
                );
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.business_center),
              ),
              title: Text('Management'),
              subtitle:Text('View Management Staff'),
            ),
          ),
        SizedBox(height: 20.0,),
        //TODO: On tap do the following
        Card(
            child: ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications,),
                ),
              title: Text('Send Broadcast'),
              subtitle: Text('Notify to all staff members'),
              onTap: ()=>_showSendPanel(),
            ),
        ),
          SizedBox(height: 20.0,),
          Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.spellcheck,),
            ),
              title: Text('Review Account Requests'),
              subtitle: Text('Assign sections to Allow access'),
              onTap: (){
                Navigator.push(context,new MaterialPageRoute(
                    builder: (context)=>
                    new AccountRequests())
                );
              },
          ),
        ),
      ]
      ));
  }
}