# Flutter-Lec
---
### 01. Flutter 구분선 넣기
       Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5, // 두께
              
#### 02. TextField PW 처리
       TextField(
                         controller: PWController,
                         decoration: InputDecoration(labelText: '패스워드를 입력하세요.'),
                         // 텍스트필드 암호화
                         keyboardType: TextInputType.text,
                         obscureText: true,
                       ),

#### 03. SnackBar 띄우기    
       void _showErrorForID(BuildContext context) {
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text('Id를 입력해주세요!'),
             duration: Duration(seconds: 2),
             backgroundColor: Colors.red,
           ),
         );
       }
