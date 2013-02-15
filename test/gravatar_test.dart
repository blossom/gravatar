import 'package:unittest/unittest.dart';
import 'package:gravatar/gravatar.dart';

main() {
  group('imageUrl', () {
    Gravatar gravatar;
    setUp((){
      gravatar = new Gravatar("hello@blossom.io");
    });
    test('basic call', () {
      expect(gravatar.imageUrl(), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b'));
    });
    test('size parameter', () {
      expect(gravatar.imageUrl(size: 40), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=40'));
    });
    test('defaultImage parameter', () {
      expect(gravatar.imageUrl(defaultImage: "monsterid"), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?d=monsterid'));
    });
    test('forceDefault parameter', () {
      expect(gravatar.imageUrl(forceDefault: true), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?f=y'));
    });
    test('rating parameter', () {
      expect(gravatar.imageUrl(rating: "pg"), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?r=pg'));
    });
    test('multiple parameters', () {
      expect(gravatar.imageUrl(size: 20, rating: "pg"), equals('https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=20&r=pg'));
    });
  });
  group('getters', () {
    Gravatar gravatar;
    setUp((){
      gravatar = new Gravatar("hello@blossom.io");
    });
    test('email', () {
      expect(gravatar.email, equals('hello@blossom.io'));
    });
    test('hash', () {
      expect(gravatar.hash, equals('658b1158409b348bb2cb3e5bef734d1b'));
    });
  });

}