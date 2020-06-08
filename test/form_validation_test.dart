import 'package:flutter_learn/shared/validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('empty email returns error string', () {

    final result = EmailFieldValidator.validate('');
    expect(result, 'Enter Your Email');
  });

  test('non-empty invalid email error string', () {

    final result = EmailFieldValidator.validate('sampleemail');
    expect(result, 'Enter valid Email');
  });

  test('non-empty valid email returns null', () {

    final result = EmailFieldValidator.validate('sample@gmail.com');
    expect(result, null);
  });

  test('empty password returns error string', () {

    final result = PasswordFieldValidator.validate('');
    expect(result, 'Enter Your Password');
  });

  test('non-empty weak password returns error string', () {

    final result = PasswordFieldValidator.validate('12345');
    expect(result, 'Password should be at least 6 characters long');
  });

  test('non-empty valid password returns null', () {

    final result = PasswordFieldValidator.validate('test123');
    expect(result, null);
  });

  test('empty name returns error string', () {

    final result = NameFieldValidator.validate('');
    expect(result, 'Enter Your Name');
  });

  test('non-empty name returns null', () {

    final result = NameFieldValidator.validate('First Last');
    expect(result, null);
  });
  test('empty  contact returns error string', () {

    final result = ContactFieldValidator.validate('');
    expect(result, 'Enter valid Contact No');
  });
  test('invalid contact returns error string', () {

    final result = ContactFieldValidator.validate('12345');
    expect(result, 'Enter valid Contact No');
  });
  test('valid contact returns null', () {

    final result = ContactFieldValidator.validate('0711234567');
    expect(result, null);
  });
}