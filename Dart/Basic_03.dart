import 'dart:convert';

void main() {
  // List threeKingdoms = [];
  // threeKingdoms.add("위");
  // threeKingdoms.add("촉");
  // threeKingdoms.add("오");

  // print(threeKingdoms);

  // threeKingdoms[0] = "We";
  // print(threeKingdoms);

  // threeKingdoms.remove("We");
  // print(threeKingdoms);

  // threeKingdoms.removeAt(0);
  // print(threeKingdoms);
  // print(threeKingdoms.length); // 갯 수 파악

  // threeKingdoms.add(1);
  // threeKingdoms.add(2);
  // print(threeKingdoms);

  List<String> threeKingdoms2 = [];
  // threeKingdoms2.add("위");
  // threeKingdoms2.add("촉");
  threeKingdoms2.add('${'"' + '이게되나?' + '"'}');
  threeKingdoms2.add('${'"' + '이게된다' + '"'}');
  print(threeKingdoms2);

  var list = ['1', '2', '3', '4'];
  String json = jsonEncode(list);
  print(json);

  // List list2 = jsonDecode(json);
  // print(list2);
  // List<String> threeKingdoms3 = ['위', '촉', '오'];
  // print(threeKingdoms3);

  // Map<String, int> fruitPrice = {
  //   'apple': 1000,
  //   'grape': 2000,
  //   'waterMelon': 3000
  // };

  // print(fruitPrice['apple']);

  // //Optional : Null Safety
  // int num1 = 10;

  // int? num2 = null;
  // num2 ??= 8;
  // print(num2);

  // List<int> list1 = [1, 3, 5, 7, 9];
  // int sum = 0;
  // for (int i in list1) {
  //   sum += i;
  // }

  // print("합계 : $sum");
}
