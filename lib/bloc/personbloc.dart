import 'package:blocproject/api/actions/Loadaction.dart';
import 'package:blocproject/api/actions/Loadpersonsaction.dart';
import 'package:blocproject/person/person.dart';
import 'package:blocproject/state/fetchresultstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Personbloc extends Bloc<Loadaction, Fetchresult?>{
  final Map<Personurl,Iterable<Person>>_cache = {};
  Personbloc():super(null)
  {
    on<Loadpersonsaction>((event, emit) async{
           final  url = event.personurl ;
           if(_cache.containsKey(url)){
            final cacheperson = _cache[url];
            final result = Fetchresult(person: cacheperson!, isRetretrivedfromcache: true);
            emit(result);
           }else{
                 final person = await getperson(url.urlString);
                 _cache[url] = person ;
                 final result = Fetchresult(person: person, isRetretrivedfromcache: false);
                 emit(result);
                 
           }
    },);
  }

}