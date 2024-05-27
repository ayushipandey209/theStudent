class Student {
  int id;
  String name;
  String address;

  Student({
    required this.id,
    required this.name,
    required this.address,
  });

factory Student.fromJson(Map<String, dynamic> json) {
  return Student(
    id: json['rno'] , 
    name: json['name'] ,
    address: json['address']
  );
}

}
