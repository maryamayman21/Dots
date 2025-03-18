class AppUser{
  String? id;
  String? fullName;
  String? userName;
  String? userEmail;

 AppUser({this.id, this.fullName, this.userEmail, this.userName});

  Map<String, dynamic> toFireStore(){
    return {
      'id' : id,
      'fullName' : fullName,
      'userName' : userName,
      'userEmail': userEmail
    };
  }



  AppUser.fromFireStore(Map<String, dynamic>? data) : this (
     id: data?['id'],
    fullName: data?['fullName'],
    userName: data?['userName'],
    userEmail: data?['userEmail']
  );
}

