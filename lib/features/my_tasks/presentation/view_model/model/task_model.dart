class TaskModel {
  final String image;
  final String title;
  final String description;
  final String priority; // Can be 'low', 'medium', or 'high'
  final DateTime dueDate;

  TaskModel({
    required this.image,
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
  });

  // // Factory constructor to create a TaskModel object from JSON
  // factory TaskModel.fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //     image: json['image'] ?? '',
  //     title: json['title'] ?? '',
  //     description: json['desc'] ?? '',
  //     priority: json['priority'] ?? 'low',
  //     dueDate: DateTime.parse(json['dueDate']),
  //   );
  // }


  // Map<String, dynamic> toJson() {
  //   return {
  //     'image': image,
  //     'title': title,
  //     'desc': description,
  //     'priority': priority,
  //     'dueDate': dueDate,
  //   };
  // }

}
