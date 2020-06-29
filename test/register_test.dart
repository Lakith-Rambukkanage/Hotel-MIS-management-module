import 'package:flutter/material.dart';
import 'package:flutter_learn/models/user.dart';
import 'package:flutter_learn/pages/authenticate/register.dart';
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

  testWidgets('Register with invalid details does not call firebase', (WidgetTester tester) async{

    MockAuth mockAuth = MockAuth();
    Register register = Register();
    await tester.pumpWidget(makeTestableWidget(register,mockAuth));

    await tester.tap(find.byKey(Key('register-button')));

    verifyNever(mockAuth.registerNewUser('','','','',''));
  });

  testWidgets('Register test valid details are entered', (WidgetTester tester) async{
    MockAuth mockAuth = MockAuth();
    Register register = Register();
    await tester.pumpWidget(makeTestableWidget(register,mockAuth));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'test@gmail.com');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'test123');

    Finder nameField = find.byKey(Key('name'));
    await tester.enterText(nameField, 'First Last');

    Finder contactField = find.byKey(Key('contact'));
    await tester.enterText(contactField, '0711234567');

    await tester.tap(find.byKey(Key('register-button')));

    expect(find.text('test@gmail.com'), findsOneWidget);
    expect(find.text('test123'), findsOneWidget);
    expect(find.text('First Last'), findsOneWidget);
    expect(find.text('0711234567'), findsOneWidget);
    //verify(mockAuth.signInWithEmailAndPassword('test@gmail.com', 'test123')).called(1);
  });

  testWidgets('Register test toggle callback', (WidgetTester tester) async{

    MockAuth mockAuth = MockAuth();
    bool toggle = true;
    Register page = Register(toggleView: ()=>toggle=false,);
    await tester.pumpWidget(makeTestableWidget(page,mockAuth));

    await tester.tap(find.byKey(Key('toggle')));
    expect(toggle, false);
  });
}
