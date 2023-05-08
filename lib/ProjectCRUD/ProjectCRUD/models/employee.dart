class Post{
  String? uid;
  String? name;
  String? projectname;
  String? collaboratorsneeded;
  //required String Collaborators,
  //required String ProjectStatus,
  String? area;
  String? email;
  String? AmountDue;
  String? AmountEarned;
  String? experience;
  String? paihay;
  String? projectdescription;
  String? requirements;
  String? responsibilities;

  Post({this.uid,this.name,this.projectname,this.collaboratorsneeded,this.area,this.experience,this.email,this.AmountDue,this.AmountEarned,this.responsibilities,this.requirements,this.projectdescription,this.paihay});
}

class Profile{
  String? uid;
  String? name;
  String? from;
  String? linkedin;
  //required String Collaborators,
  //required String ProjectStatus,
  String? field;
  String? email;
  String? ongoingprojects;
  String? projectscompleted;

  Profile({this.uid,this.name,this.linkedin,this.projectscompleted,this.ongoingprojects,this.from,this.email,this.field});
}