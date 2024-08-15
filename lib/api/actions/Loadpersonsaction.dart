import 'package:blocproject/api/actions/Loadaction.dart';
import 'package:flutter/widgets.dart';

@immutable class Loadpersonsaction implements Loadaction{
  final Personurl personurl ;

  Loadpersonsaction({required this.personurl});
}