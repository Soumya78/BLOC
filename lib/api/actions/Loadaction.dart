import 'package:flutter/widgets.dart';

@immutable abstract class Loadaction{
  const Loadaction();

}
enum Personurl{
  Person1 ,
  Person2,
}
extension UrlString on Personurl{
  String get urlString{
         switch(this){

           case Personurl.Person1:
           return 'http://10.0.2.2:5500/lib/api/person1.json';
            
           case Personurl.Person2:
           return 'http://10.0.2.2:5500/lib/api/person2.json';
             
  }
  }
 
}