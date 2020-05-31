import 'package:flutter/material.dart';
import 'package:flutter_learn/services/auth.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: LinearProgressIndicator(
      backgroundColor: Colors.grey[800],),
    );
  }
}


class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/pearl_logo.png'),
                //radius: 200.0,
                backgroundColor: Colors.transparent,
                maxRadius: 210.0,
                minRadius: 200.0,
              ),
              Text('Loading...',style: TextStyle(color: Colors.grey,fontSize: 15.0),),
            ],
          ),
        ),
      ),
    );
  }
}


class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/pearl_logo.png'),
                  //radius: 200.0,
                  backgroundColor: Colors.transparent,
                  maxRadius: 110.0,
                  minRadius: 100.0,
                ),
                Card(
                    margin: EdgeInsets.all(30.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.warning),
                      ),
                      title: Text('This Account Is not a valid staff account',style: TextStyle(color: Colors.red),),
                      subtitle: Text('Tap to Login with a valid account',),
                      onTap: ()async{
                        await _auth.signOut();
                      },
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class LandingDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/background2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/pearl_logo.png'),
                  //radius: 200.0,
                  backgroundColor: Colors.transparent,
                  maxRadius: 110.0,
                  minRadius: 100.0,
                ),
                Card(
                    margin: EdgeInsets.all(30.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.warning,color: Colors.amber),
                      ),
                      title: Text('This Account Is not yet Authorized'),
                      subtitle: Text('Please Contact your Supervisor',),
                    )
                ),
                RaisedButton(
                  child: Text('Log out', style: TextStyle(color: Colors.white),),
                  color: Colors.cyan.withOpacity(0.7),
                  onPressed: () async {
                    await _auth.signOut();
                  }
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

