class UserModelTwo {
  int? userId;
  int? id;
  String? title, error;
  bool? completed;

  UserModelTwo({this.userId, this.id, this.title, this.completed, this.error});

  UserModelTwo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    error = json["error"];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data["error"] = this.error;
    data['completed'] = this.completed;
    return data;
  }

  UserModelTwo.withError(String message) {
    error = message;
  }

}
