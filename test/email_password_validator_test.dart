import 'package:flutter_test/flutter_test.dart';
import 'package:test/validation.dart';

void main() {
  group('Name', () {
    test('Empty - Name validator', () {
      var resultEmptyName = Validation.validateName('');
      expect(resultEmptyName, 'Please enter your name!');
    });
    test('NotEmpty - Name validator', () {
      var resultNotEmptyName = Validation.validateName('Salma');
      expect(resultNotEmptyName, null);
    });
    test('Name of length < 3 validator', () {
      var resultNameLessLength = Validation.validateName('SS');
      expect(resultNameLessLength, 'Name must be more than 2 characters');
    });
  });
  group('Email', () {
    test('Empty - Email validator', () {
      var resultEmptyEmail = Validation.validateEmail('');
      expect(resultEmptyEmail, 'Your email address is required!');
    });
    test('NotEmpty and valid - Email validator', () {
      var resultNotEmptyEmail = Validation.validateEmail('Salma@gmail.com');
      expect(resultNotEmptyEmail, null);
    });
    test('Email Not Valid', () {
      var resultEmailNotValid = Validation.validateEmail('salma.com');
      expect(resultEmailNotValid, 'Please provide a valid email address!');
    });
  });
  group('Age', () {
    test('age is number and not empty', () {
      var result = Validation.validateAge('25');
      expect(result, null);
    });
    test('age < 120', () {
      var result = Validation.validateAge('125');
      expect(result, 'Invalid age');
    });
    test('age is empty', () {
      var result = Validation.validateAge('');
      expect(result, 'Your age is required!');
    });
  });
  group('Phone', () {
    test('Empty - Phone validator', () {
      var result = Validation.validatePhone('');
      expect(result, 'Your phone number is required!');
    });
    test('NotEmpty - Phone validator and (11) number', () {
      var result = Validation.validatePhone('01141939077');
      expect(result, null);
    });
    test('Phone not valid', () {
      var result = Validation.validatePhone('Sc0209i0nnS');
      expect(result, 'Please provide a valid phone number!');
    });
  });
  group('Jop', () {
    test('Empty - Jop validator', () {
      var result = Validation.validateJob('');
      expect(result, 'Your job is required!');
    });
    test('NotEmpty - Jop and not valid', () {
      var result = Validation.validateJob('01141939077');
      expect(result, 'Please provide a valid job');
    });
    test('Jop is valid', () {
      var result = Validation.validateJob('Developer');
      expect(result, null);
    });
  });
  group('Password', () {
    test('password is empty', () {
      var result = Validation.validatePassword('');
      expect(result, 'Your password is required!');
    });
    test('password < 6 char', () {
      var result = Validation.validatePassword('da90');
      expect(result, 'Your password must be at least 6 characters!');
    });
    test('password > 32 char', () {
      var result = Validation.validatePassword(
          'da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90da90');
      expect(result, 'Your password must be at most 32 characters!');
    });
    test('password is valid', () {
      var result = Validation.validatePassword('Salma011E');
      expect(result, null);
    });
  });
  group('Confirm Password', () {
    test('Confirm Password is empty', () {
      var result = Validation.validateConfirmPassword('', 'SalmaEssam');
      expect(result, 'Your confirm password is required!');
    });
    test('Confirm Password is not valid', () {
      var result = Validation.validateConfirmPassword('da90', 'SalmaEssam');
      expect(result, 'Your confirm password is not valid!');
    });
    test('Confirm Password is valid', () {
      var result =
          Validation.validateConfirmPassword('SalmaEssam', 'SalmaEssam');
      expect(result, null);
    });
  });
}
