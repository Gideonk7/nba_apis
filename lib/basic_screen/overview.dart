import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nba_api/api%20constant/apiConstant.dart';
import 'package:http/http.dart' as http;
import 'package:nba_api/models/nbaModel.dart';

class Overview extends StatelessWidget {
   Overview({Key? key}) : super(key: key);

  List<Team> teams = [];

  Future getTeam() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'),);
    var jsondata = jsonDecode(response.body);

    for (var eachTeam in jsondata["data"]){
      final team = Team(
        abbreviation : eachTeam['abbreviation'],
        city:eachTeam['city'],
      );
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
      future: getTeam(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: teams.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: const BoxDecoration(color:Colors.grey,),
                child: ListTile(
                  title: Text(teams[index].abbreviation ),
                  subtitle: Text(teams[index].city),
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    
  }
}
