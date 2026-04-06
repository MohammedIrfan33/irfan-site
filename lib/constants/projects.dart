class ProjectModel {
  final String title;
  final String imagePath;
  final String? appIcon;
  final String? stateManagement;
  final String? technologies;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final bool isContribution;

  const ProjectModel({
    required this.title,
    required this.imagePath,
    this.appIcon,
    this.stateManagement,
    this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.isContribution = false,
  });
}

final List<ProjectModel> myProjects = [
  ProjectModel(
    title: "Drkcare",

    imagePath:
        "https://github.com/MohammedIrfan33/irfan-site/blob/main/assets/image.png",
    appStoreUrl: "https://apps.apple.com/sa/app/drkcare/id6755625727",
    stateManagement: "Bloc",
    technologies: "Flutter,Larvel-api,clean arch",
    appIcon:
        'https://is1-ssl.mzstatic.com/image/thumb/PurpleSource211/v4/8c/a9/8a/8ca98a3b-245a-4645-7cc2-97a5022eba1d/Placeholder.mill/400x400bb-75.webp',
  ),
  ProjectModel(
    title: "Etracker Go",
    imagePath:
        "https://play-lh.googleusercontent.com/Neo5u2q5748Ntu4I0BWlu8ge57Eei6S-dOotYGQ6Wz4DbFFkScONGyqCdungcD-BKldbjMFFXiXcWty9nQ_E5A=w832-h470-rw",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.workmate.election_app&hl=en_IN",
    appStoreUrl: "https://apps.apple.com/in/app/etrack-go/id6755888577",

    stateManagement: "Getx",
    technologies: "Flutter,PHP",
    appIcon:
        'https://play-lh.googleusercontent.com/hCRQH44g32pzUOUgpdaX_psloulTdYlV-BaoIg_P6vu6JFwT0ZRyqd4Gow4NUU6OPomeefbhNJRwoS_C9L7E=w480-h960-rw',
  ),
  ProjectModel(
    title: "PTH Palathingal",
    imagePath:
        "https://play-lh.googleusercontent.com/ZP2FnZOy4SQ10x5tlo70wQvIgRvue4meYKfVl7artTImM5WGhyxhk84xi3uUOuZ73zloePcI9gLo2QO2FVmafkI=w832-h470-rw",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.workmate.pthpalathingal&hl=en_IN",
    appStoreUrl: "https://apps.apple.com/in/app/pth-palathingal/id6758400151",
    appIcon:
        "https://play-lh.googleusercontent.com/VgThNeRQQv83gFiVt-J1Kl5P5gOGCOFjcfuRl0mFSDj4FTC-IeadIe567aVRGRtgr5NNOe7z_A8nVEcyIT6kX_Q=w480-h960-rw",
    stateManagement: "Getx",
    technologies: "Flutter , PHP , Omniware paymentgatway",
  ),
  ProjectModel(
    title: "PTH Chembra,",
    imagePath:
        "https://play-lh.googleusercontent.com/aawzcWG0o6BYvXog8wi6Myw8Pgc8ZA3ggtUKbE8nale8kljFRvM33F0CyiabGK-CWEjZLiLmF22NX6gZpIDMzg=w832-h470-rw",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.workmate.pthchembra&hl=en_IN",
    appStoreUrl: "https://apps.apple.com/in/app/pth-chembra/id6758417129",
    appIcon:
        'https://play-lh.googleusercontent.com/j6dgEC2TzP-EwLstJKrdLZ5E72wqlBKAYX5fePzjuV5HVEb9-uvd8jKDItm8Rour8bKlR3LWjVj6GujLGyV-ico=w480-h960-rw',
    stateManagement: "Getx",
    technologies: "Flutter,PHP, Omniware paymentgatway",
  ),
  ProjectModel(
    title: "CH Center Thennala",
    imagePath:
        'https://play-lh.googleusercontent.com/pVBDGYMQ1Nkl96bmjzxBG6tO4lEqVjINuxCH8blz9jUhziMsZazH1DpCrlVzXUhwzzA=w832-h470-rw',
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.workmate.chcenterthennala&hl=en_IN",
    appStoreUrl:
        "https://apps.apple.com/in/app/ch-center-thennala/id6740895362",
    appIcon:
        'https://play-lh.googleusercontent.com/dN0oN9qJaQpST3GXh6GcuxGnIe56Xhv0S5baRuR8ZXAj6rjT0Sn_-iigffYwvlAct4M=w480-h960-rw',
    stateManagement: "Getx",
    technologies: "Flutter,PHP, Omniware paymentgatway",
  ),
  ProjectModel(
    title: "SAFE COC",
    imagePath:
        "https://play-lh.googleusercontent.com/i4DyAi1vp-83S3kwMSiwx5fBRn90YGdQzoPOnOqUz8Q6rVUvmyU0H-htBpwntIAp7cc=w832-h470-rw",
    playStoreUrl:
        "https://play.google.com/store/apps/details?id=com.workmate.safechallenge&hl=en_IN",
    appStoreUrl: "https://apps.apple.com/in/app/safe-coc/id6740491989",
    appIcon:
        'https://play-lh.googleusercontent.com/3vja4Xx_qpHIvMXd44oCOa-dGe6y_7Wr8tZCQ3JL4-xnzbKy9llgtIqAigom-2U_gg=w480-h960-rw',
    isContribution: true,
    stateManagement: "Getx",
    technologies: "Flutter,PHP, Omniware paymentgatway",
  ),
  ProjectModel(
    title: "GEL Cargo",
    imagePath:
        'https://play-lh.googleusercontent.com/bqV0eZah_Ydp1EBNz6FyWoDmUGPJPNYP7FTKi0C7niITKUvIWmIJxSyQONsSY0jToHc=w832-h470-rw',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.gelcargo_app&hl=en_IN',
    appStoreUrl: 'https://apps.apple.com/in/app/gel-cargo/id1641654606',
    isContribution: true,
    appIcon:
        'https://play-lh.googleusercontent.com/YGyN1rFyPij6wupD8EXOwCrCtgJZgCcmqd1rg6RvMEp32IhMeNCZRGVVrxJamN1alkI=w480-h960-rw',
    stateManagement: "Set state",
    technologies: "Flutter,PHP-LARAVEL,",
  ),
];
