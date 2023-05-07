
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {

  String? UiniqueCode; //profile.uid / userCredentials.uid (both the same)


  List<String> defaultFeedTypes = [];//[Team_Cricket, Event_CricketTournament, Post_WonCricketMatch]
  List<String> allowedMenuActions=[]; //[Action_MyTeams, CreateTeam, CreateEvent etc]
  List<String> allowedPostTypes=[]; //[Post_MusicNight, Post_PlayedFootballMatch]
  List<String> allowedEventTypes=[];//[Event_CricketTournament, Event_FootballMatch]
  List<String> allowedTeamTypes=[];//[Team_Cricket, Team_Football]

  Session();
  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);


}