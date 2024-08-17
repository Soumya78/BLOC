import 'package:blocproject/person/person.dart';
import 'package:flutter/widgets.dart';

@immutable abstract class Loadaction{
  const Loadaction();

}
const Person1url = 'http://10.0.2.2:5500/lib/api/person1.json';
const Person2url = 'http://10.0.2.2:5500/lib/api/person2.json';

typedef Personloader = Future<Iterable<Person>> Function(String url );


 

