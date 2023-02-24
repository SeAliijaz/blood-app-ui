import 'package:flutter/material.dart';

class WhoCanDonateBloodModel {
  final IconData iconData;
  final String title;

  WhoCanDonateBloodModel({
    required this.iconData,
    required this.title,
  });
}

List<WhoCanDonateBloodModel> whoCanDonateList = [
  WhoCanDonateBloodModel(
      iconData: Icons.person_outlined,
      title: "Individuals aged between 18 to 65 years"),
  WhoCanDonateBloodModel(
      iconData: Icons.line_weight_outlined,
      title: "Donors weighing at least 50 kilograms"),
  WhoCanDonateBloodModel(
      iconData: Icons.favorite_outlined,
      title: "Donors with hemoglobin level above a certain threshold"),
  WhoCanDonateBloodModel(
      iconData: Icons.warning_outlined,
      title:
          "People with a history of infectious diseases or recent surgeries may not be eligible temporarily"),
  WhoCanDonateBloodModel(
      iconData: Icons.airplanemode_active_outlined,
      title:
          "People who have traveled to certain countries or regions with high risk of infectious diseases may not be eligible temporarily"),
  WhoCanDonateBloodModel(
      iconData: Icons.pregnant_woman_outlined,
      title:
          "Pregnant women and individuals who have recently given birth are usually advised not to donate blood"),
  WhoCanDonateBloodModel(
      iconData: Icons.medical_services_outlined,
      title:
          "People with certain chronic medical conditions such as diabetes or hypertension may be eligible to donate blood but may need to meet additional requirements"),
  WhoCanDonateBloodModel(
      iconData: Icons.create_outlined,
      title:
          "People with tattoos or piercings may be able to donate blood depending on the timing and location of the procedure"),
  WhoCanDonateBloodModel(
      iconData: Icons.healing_outlined,
      title:
          "Donors are required to undergo a brief medical screening before donating blood to ensure safety for both donor and recipient"),
  WhoCanDonateBloodModel(
      iconData: Icons.assignment_ind_outlined,
      title:
          "Ultimately, eligibility to donate blood is determined by medical professionals based on the donor's medical and health history")
];
