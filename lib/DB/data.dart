class Student {
  final String? student_password;
  final int? student_id;
  final String? student_name;
  final int? major_id;
  final String? address;

  Student(
      {this.student_id,
      this.student_password,
      required this.student_name,
      required this.major_id,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      'password':student_password,
      'id': student_id,
      'name': student_name,
      'major_id': major_id,
      'adress': address,
    };
  }
}

class Dactor {
  final String? doctor_password;
  final int? doctor_job_number;
  final String? doctor_name;
  final String? doctor_qualification;
  final String? address;

  Dactor(
      {this.doctor_password,
      this.doctor_job_number,
      required this.doctor_name,
      required this.doctor_qualification,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      'password': doctor_password,
      'doctor_job': doctor_job_number,
      'name': doctor_name,
      'doctor_qualification': doctor_qualification,
      'address': address,
    };
  }
}

