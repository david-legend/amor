part of values;

class Data {
  static List<ExperienceData> educationData = [
    ExperienceData(
      title: StringConst.EDUCATION_1,
      titleUrl: StringConst.EDUCATION_1_URL,
      body: [
        StringConst.EDUCATION_1_DESC,
      ],
      location: StringConst.LOCATION_1,
      duration: StringConst.DURATION_1,
    ),
    ExperienceData(
      title: StringConst.EDUCATION_2,
      titleUrl: StringConst.EDUCATION_2_URL,
      body: [
        StringConst.EDUCATION_2_DESC,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
  ];
  static List<ExperienceData> experienceData = [
    ExperienceData(
      title: StringConst.WORK_1,
      subtitle: StringConst.WORK_1_POSITION,
      titleUrl: StringConst.WORK_1_URL,
      body: [
        StringConst.WORK_1_ROLE_1,
        StringConst.WORK_1_ROLE_2,
        StringConst.WORK_1_ROLE_3,
        StringConst.WORK_1_ROLE_4,
      ],
      location: StringConst.WORK_1_LOCATION,
      duration: StringConst.WORK_1_DURATION,
    ),
    ExperienceData(
      title: StringConst.WORK_2,
      subtitle: StringConst.WORK_2_POSITION,
      titleUrl: StringConst.WORK_2_URL,
      body: [
        StringConst.WORK_2_ROLE_1,
        StringConst.WORK_2_ROLE_2,
        StringConst.WORK_2_ROLE_3,
      ],
      location: StringConst.WORK_2_LOCATION,
      duration: StringConst.WORK_2_DURATION,
    ),
    ExperienceData(
      title: StringConst.WORK_3,
      subtitle: StringConst.WORK_3_POSITION,
      titleUrl: StringConst.WORK_3_URL,
      body: [
        StringConst.WORK_3_ROLE_1,
        StringConst.WORK_3_ROLE_2,
        StringConst.WORK_3_ROLE_3,
      ],
      location: StringConst.WORK_3_LOCATION,
      duration: StringConst.WORK_3_DURATION,
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
      title: StringConst.DATA_SCIENCE_CERT,
      url: " ",
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.UDACITY,
    ),
    CertificationData(
      title: StringConst.ASSOCIATE_ANDROID_DEV_CERT,
      url: " ",
      image: ImagePath.ASSOCIATE_ANDROID_DEV_CERT,
      imageSize: 0.30,
      awardedBy: StringConst.GOOGLE,
    )
  ];

  static List<PortfolioData> portfolioData = [
    PortfolioData(
      imageUrl: ImagePath.art_1,
      title: StringConst.DIGITAL_WALL_POSTER,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_2,
      title: StringConst.FREESTYLE,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_3,
      title: StringConst.AURORA_PISTON,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_4,
      title: StringConst.SPACE_STORY,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_5,
      title: StringConst.ABYSS,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_7,
      title: StringConst.STREET_ART,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_6,
      title: StringConst.MURAL_PRIDE,
    ),
    PortfolioData(
      imageUrl: ImagePath.art_8,
      title: StringConst.SOUL_TEARS,
    ),
  ];
}
