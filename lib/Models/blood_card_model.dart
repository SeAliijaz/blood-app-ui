class BloodCardModel {
  String? donatedBy;
  String? patientName;
  String? date;
  String? location;
  String? bloodType;
  bool? isSubmitted = false;
  String? submittedBy;

  BloodCardModel({
    this.donatedBy,
    this.patientName,
    this.date,
    this.location,
    this.bloodType,
    this.isSubmitted,
    this.submittedBy,
  });
}

List<BloodCardModel> bloodCardModel = [
  BloodCardModel(
    patientName: "Johnson",
    date: "19/2/2023",
    location: "New York",
    bloodType: "A+",
    isSubmitted: true,
    submittedBy: "Amjad",
  ),
  BloodCardModel(
    patientName: "Jameel",
    date: "22/2/2023",
    location: "Karachi",
    bloodType: "B+",
    isSubmitted: false,
  ),
  BloodCardModel(
    patientName: "Tariq",
    date: "25/2/2023",
    location: "Islamabad",
    bloodType: "A-",
    isSubmitted: true,
    submittedBy: "Razaq",
  ),
  BloodCardModel(
    patientName: "Ali",
    date: "27/2/2023",
    location: "Sahiwal",
    bloodType: "B-",
    isSubmitted: false,
  ),
  BloodCardModel(
    patientName: "Hassaan",
    date: "5/3/2023",
    location: "Lahore",
    bloodType: "O+",
    isSubmitted: true,
    submittedBy: "Hamza Jameel",
  ),
  BloodCardModel(
    patientName: "Usman",
    date: "10/3/2023",
    location: "Faisalabad",
    bloodType: "O-",
    isSubmitted: false,
  ),
];
