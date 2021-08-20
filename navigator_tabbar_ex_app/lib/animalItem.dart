class Animal {
  late String imagePath;
  late String animalName;
  late String kind;
  late bool flyExist;

  // 생성자 만들어 주기 반드시 만들어야한다.

  Animal({
    // required >> 반드시 들어와야한다. 이거 없으면 에러 난다는 뜻.
    // Beam type
    required this.animalName,
    required this.kind,
    required this.imagePath,
    required this.flyExist,
  });
}
