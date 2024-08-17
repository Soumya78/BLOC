import 'package:blocproject/api/actions/Loadaction.dart';
import 'package:flutter/widgets.dart';

@immutable class Loadpersonsaction implements Loadaction{
  final String url ;
  final Personloader personloader ;

  Loadpersonsaction({required this.personloader ,required this.url, });
}