import 'package:blocproject/person/person.dart';
import 'package:flutter/widgets.dart';

@immutable 
class Fetchresult{
  final Iterable<Person> person ;
  final bool isRetretrivedfromcache ;

  Fetchresult({required this.person, required this.isRetretrivedfromcache});

  @override
 String toString() => 'FetchResult(isretrivedfromcache = $isRetretrivedfromcache , persons = $person)';
}