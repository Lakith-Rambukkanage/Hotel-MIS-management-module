import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/signin.dart';
import 'package:flutter_learn/services/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockAuth extends Mock implements AuthService{}

void main(){
  //helper function to make widget testable
  Widget makeTestableWidget(Widget child,AuthService auth){
    return StreamProvider<User>.value(
      value: auth.user,
      child: MaterialApp(
        home: child,
      ),
    );
  }

  testWidgets('Sign in test invalid details does not call firebase', (WidgetTester tester) async{

    MockAuth mockAuth = MockAuth();
    SignIn signInPage = SignIn();
    await tester.pumpWidget(makeTestableWidget(signInPage,mockAuth));

    await tester.tap(find.text('Login'));

    verifyNever(mockAuth.signInWithEmailAndPassword('', ''));
  });

  testWidgets('Sign in test toggle callback', (WidgetTester tester) async{

    MockAuth mockAuth = MockAuth();
    bool toggle = false;
    SignIn signInPage = SignIn(toggleView: ()=>toggle=true,);
    await tester.pumpWidget(makeTestableWidget(signInPage,mockAuth));

    await tester.tap(find.byKey(Key('toggle')));
    expect(toggle, true);
  });

  testWidgets('Sign in test valid details are entered', (WidgetTester tester) async{
    MockAuth mockAuth = MockAuth();
    SignIn signInPage = SignIn();
    await tester.pumpWidget(makeTestableWidget(signInPage,mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'test@gmail.com');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'test123');

    //await tester.tap(find.text('Login'));
    expect(find.text('test@gmail.com'), findsOneWidget);
    expect(find.text('test123'), findsOneWidget);
    //verify(mockAuth.signInWithEmailAndPassword('test@gmail.com', 'test123')).called(1);
  });
}
