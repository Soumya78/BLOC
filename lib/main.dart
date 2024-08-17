import 'package:blocproject/api/actions/Loadaction.dart';
import 'package:blocproject/api/actions/Loadpersonsaction.dart';
import 'package:blocproject/bloc/personbloc.dart';
import 'package:blocproject/person/person.dart';

import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}
 extension Subscript <T> on Iterable<T>{
         T? operator[] (int index) => length > index ? elementAt(index):null ;
       }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (_) => Personbloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  late final Bloc bloc;
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      context
                          .read<Personbloc>()
                          .add(Loadpersonsaction( personloader:getperson, url: Person1url,));
                    },
                    child: Text("Load json 1")),
                TextButton(
                    onPressed: () {
                      context
                          .read<Personbloc>()
                          .add(Loadpersonsaction(personloader: getperson,url: Person2url));
                    },
                    child: Text("Load json 2")),
              ],
            ),
            BlocBuilder<Personbloc, Fetchresult?>(
                buildWhen: (previousresult, currentresult) {
              return previousresult?.person != currentresult?.person;
            }, builder: ((context, fetchresult) {
              final persons = fetchresult?.person;
              if (persons == null) {
                return SizedBox();
              } else {
                return Expanded(
                  child: ListView.builder(
                      itemCount: persons.length,
                      itemBuilder: (context, i) {
                        final person = persons[i]!;
                        return ListTile(title: Text(person.name));
                      }),
                );
              }
            }))
          ],
        ),
      ),
    );
  }
}
