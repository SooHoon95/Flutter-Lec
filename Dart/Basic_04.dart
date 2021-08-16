void main() {
  checkVersion();
  print('end process');
}

// 비동기 함수 >> 어씽크
checkVersion() async {
  print("---------------");
  // lookUp이라는 함수를 끝날때까지 대기한다.
  var version = await lookUpVersion(); // async는 await가 있다.
  print(version);
}

int lookUpVersion() {
  return 12;
}
