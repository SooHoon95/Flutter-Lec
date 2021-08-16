import 'Basic_04.dart';

void main() async {
  await getVersionName().then((value) => {print(value)}); // getVersionName이 끝나면 ~~                                   
  print("end process");
}

Future<String> getVersionName() async {
  var versionName = await lookUpVersionName();
  return versionName;
}

String lookUpVersionName() {
  return "Flutter";
}
