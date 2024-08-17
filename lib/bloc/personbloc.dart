import 'package:blocproject/api/actions/Loadaction.dart';
import 'package:blocproject/api/actions/Loadpersonsaction.dart';
import 'package:blocproject/person/person.dart';

import 'package:flutter/widgets.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class Fetchresult {
  final Iterable<Person> person;
  final bool isRetretrivedfromcache;

  Fetchresult({required this.person, required this.isRetretrivedfromcache});

  @override
  String toString() =>
      'FetchResult(isretrivedfromcache = $isRetretrivedfromcache , persons = $person)';
  @override
  bool operator ==(covariant Fetchresult other) =>
      person.isequalignoring(other.person) &&
      isRetretrivedfromcache == other.isRetretrivedfromcache;

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(person, isRetretrivedfromcache);
}

extension isequalignoringOdering<T> on Iterable<T> {
  bool isequalignoring(Iterable<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}

class Personbloc extends Bloc<Loadaction, Fetchresult?> {
  final Map<String, Iterable<Person>> _cache = {};
  Personbloc() : super(null) {
    on<Loadpersonsaction>(
      (event, emit) async {
        final url = event.url;
        if (_cache.containsKey(url)) {
          final cacheperson = _cache[url];
          final result =
              Fetchresult(person: cacheperson!, isRetretrivedfromcache: true);
          emit(result);
        } else {
          final loader = event.personloader ;
          final person = await loader(url);
          _cache[url] = person;
          final result =
              Fetchresult(person: person, isRetretrivedfromcache: false);
          emit(result);
        }
      },
    );
  }
}
