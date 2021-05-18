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

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
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

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: StringConst.FLUTTER),
    SkillData(skillLevel: 70, skillName: StringConst.JAVA),
    SkillData(skillLevel: 78, skillName: StringConst.ANDROID),
    SkillData(skillLevel: 70, skillName: StringConst.KOTLIN),
    SkillData(skillLevel: 80, skillName: StringConst.JAVASCRIPT),
    SkillData(skillLevel: 80, skillName: StringConst.PHP),
    SkillData(skillLevel: 80, skillName: StringConst.LARAVEL),
    SkillData(skillLevel: 80, skillName: StringConst.SQL),
    SkillData(skillLevel: 90, skillName: StringConst.WORDPRESS),
    SkillData(skillLevel: 80, skillName: StringConst.BOOTSTRAP),
    SkillData(skillLevel: 80, skillName: StringConst.HTML_CSS),
  ];
}
