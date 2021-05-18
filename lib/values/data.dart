part of values;

class ExperienceData {
  ExperienceData({
    required this.title,
    required this.titleUrl,
    required this.subtitle,
    required this.body,
    required this.location,
    required this.duration,
  });

  final String title;
  final String titleUrl;
  final String location;
  final String duration;
  final String subtitle;
  final List<String> body;
}

class Data {
  static List<ExperienceData> experienceData = [
    ExperienceData(
      title: StringConst.EDUCATION_1,
      subtitle: StringConst.POSITION_1,
      titleUrl: StringConst.EDUCATION_1_URL,
      body: [
        StringConst.EDUCATION_1_ROLE_1,
        StringConst.EDUCATION_1_ROLE_2,
        StringConst.EDUCATION_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceData(
      title: StringConst.EDUCATION_1,
      subtitle: StringConst.POSITION_1,
      titleUrl: StringConst.EDUCATION_1_URL,
      body: [
        StringConst.EDUCATION_1_ROLE_1,
        StringConst.EDUCATION_1_ROLE_2,
        StringConst.EDUCATION_1_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceData(
      title: StringConst.EDUCATION_3,
      subtitle: StringConst.POSITION_3,
      titleUrl: StringConst.EDUCATION_3_URL,
      body: [
        StringConst.EDUCATION_3_ROLE_1,
        StringConst.EDUCATION_3_ROLE_2,
        StringConst.EDUCATION_3_ROLE_3,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
  ];
}
