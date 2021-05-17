part of values;

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    required this.companyUrl,
  });

  final String company;
  final String companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class Data {
  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.EDUCATION_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.EDUCATION_1_URL,
      roles: [
        StringConst.EDUCATION_1_ROLE_1,
        StringConst.EDUCATION_1_ROLE_2,
        StringConst.EDUCATION_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceData(
      company: StringConst.EDUCATION_1,
      position: StringConst.POSITION_1,
      companyUrl: StringConst.EDUCATION_1_URL,
      roles: [
        StringConst.EDUCATION_1_ROLE_1,
        StringConst.EDUCATION_1_ROLE_2,
        StringConst.EDUCATION_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceData(
      company: StringConst.EDUCATION_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.EDUCATION_3_URL,
      roles: [
        StringConst.EDUCATION_3_ROLE_1,
        StringConst.EDUCATION_3_ROLE_2,
        StringConst.EDUCATION_3_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
