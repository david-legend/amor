part of values;

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
    SkillData(skillLevel: 95, skillName: StringConst.PYTHON),
    SkillData(skillLevel: 70, skillName: StringConst.JAVA),
    SkillData(skillLevel: 78, skillName: StringConst.C_PLUS_PLUS),
    SkillData(skillLevel: 80, skillName: StringConst.JAVASCRIPT),
    SkillData(skillLevel: 70, skillName: StringConst.HTML),
    SkillData(skillLevel: 80, skillName: StringConst.CSS),
  ];
  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.IOT_CERT,
      url: " ",
      image: ImagePath.IOT_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.GOOGLE,
    )
  ];
}
