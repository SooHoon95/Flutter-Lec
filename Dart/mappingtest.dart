import 'dart:convert';

void main(List<String> args) {
  String jsonString = """
  {
	"type": "AddLmBarcode", 
	"totalLmSticker": 7,
	"addedLmSticker": 0,
	"lmSticker": []
}
  """;

  print(jsonString);
  Map<String, dynamic> lmBarcodeInfo = jsonDecode(jsonString);

  print(lmBarcodeInfo);
  print('${lmBarcodeInfo['totalLmSticker']}');
}
