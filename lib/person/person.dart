import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';

@immutable 
class Person{
final String name ;
final int age ;

  Person({required this.name, required this.age});

  Person.fromJson(Map<String , dynamic>json)
  :name = json["name"] as String,
    age = json["age"] as int ;
    }

    Future<Iterable<Person>>getperson(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close()) //This gives us req
    .then((res)=> res.transform(utf8.decoder).join()) //This gives us response
    .then((str) => json.decode(str) as List<dynamic>)//Response become list here 
    .then((list) =>list.map((e) => Person.fromJson(e))); // List become iterable of Persons whos result is Future

      