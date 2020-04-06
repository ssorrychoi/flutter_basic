## Flutter 입문

---

### 개발환경 구축

- Flutter 설치
- Android Studio 설치
  - Android SDK 설치
- Xcode 설치

![image](https://user-images.githubusercontent.com/43080040/78420463-52816e80-768a-11ea-9d0e-56e401ccbff0.png)

- 위와같은 에러가 났는데 `Android license status unknown` 인 에러를 처리하기 위해선 다음과 같이 진행하면 된다.

  1. open sdk manager

  2. under sdk tools uncheck hide obsolete packages at the bottom

  3. then you should see an option called `Android Sdk Tools (Obsolete)` 

     -> 지금은 `Android SDK Command-line Tools` 로 바뀜.

![image](https://user-images.githubusercontent.com/43080040/78420502-adb36100-768a-11ea-81eb-7dce37851500.png)

---

### 에뮬레이터 설치 및 데모 앱 실행

- AVD Manager (핸드폰버튼)을 클릭한 후 에뮬레이터를 설치한다.

---

### Flutter 기초 지식

**프로젝트 구조**

```
Flutter_basic
├── android
├── ios
├── lib
     ├── main.dart
├── test
├── .gitignore
├── .metadata
,,,
```

소스코드는 main.dart에서 작성하면 된다.



**Scaffold, AppBar**

main.dart

```dart
import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // StatelessWidget 클래스를 상속받는다.
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { // build라는 method가 있다.
    return MaterialApp(	// Material Design을 사용하겠다.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        //수정한다.
        //home: MyHomePage(title: 'Flutter Demo Home Page')
        home: Text('헬로 월드')
    );
  }
}
```

- Scaffold의 단축키는 `option+Enter`

  - `Scaffold(body : Text('헬로월드'))` 

  - ```dart
    home : Scaffold(
            appBar : AppBar(
              title: Text('헬로월드'),
              ),
            body: Text('헬로월드', style: TextStyle(fontSize: 30)),
          );
    ```



**StatelessWidget**

```dart
import 'package:flutter/material.dart';
import 'cupertino_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { // StatelessWidget 클래스를 상속받는다.
  @override
  Widget build(BuildContext context) { // build라는 method가 있다.
    return MaterialApp(	// Material Design을 사용하겠다.
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        //수정한다.
        //home: MyHomePage(title: 'Flutter Demo Home Page')
        home: Text('헬로 월드')
    );
  }
}
```

- StatefulWidget 단축키는 `stful`
  - StatefulWidget 기본 구조

```dart
class HelloPage extends StatefulWidget { // StatefulWidget클래스를 상속받는다.이 클래스는 state를 갖는다.
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

- StatefulWidget 

```dart
class HelloPage extends StatefulWidget { 
  final String title;
  
  HelloPage(this.title); // generate 생성
  
  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
		//실제 화면을 그리는 부분
    return Scaffold(
        appBar : AppBar(
          title: Text('헬로월드'),
          ),
        body: Text('헬로월드', style: TextStyle(fontSize: 30)),
      );
  }
}
```

- main.dart

  ```dart
  import 'package:flutter/material.dart';
  import 'cupertino_page.dart';
  
  void main() => runApp(MyApp());
  
  class MyApp extends StatelessWidget { 
    @override
    Widget build(BuildContext context) { 
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HelloPage('Hello World')
      );
    }
  }
  ```

**상태 변경하기**

```dart
class HelloPage extends StatefulWidget { 
  final String title;

  HelloPage(this.title); // generate 생성

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    //실제 화면을 그리는 부분
    return Scaffold(
      floatingActionButton:
      FloatingActionButton(onPressed: () => print('잘 눌리나')),
      appBar : AppBar(
        title: Text('헬로월드'),
      ),
      body: Text('헬로월드', style: TextStyle(fontSize: 30)),
    );
  }
}
```

=> 콘솔창에 print 된다.

```dart
class HelloPage extends StatefulWidget { 
  final String title;

  HelloPage(this.title); // generate 생성

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    //실제 화면을 그리는 부분
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('잘 눌리나')),
      appBar : AppBar(
        title: Text('헬로월드'),
      ),
      body: Text('헬로월드', style: TextStyle(fontSize: 30)),
    );
  }
}
```

floatingActionButton이 생성되고 + icon이 생성된다.

```dart
class HelloPage extends StatefulWidget { 
  final String title;

  HelloPage(this.title);

  @override
  _HelloPageState createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  String _message = 'Hello World'; // 변수 생성

  @override
  Widget build(BuildContext context) {
    //실제 화면을 그리는 부분
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _changeMessage)), // 버튼을 누르면 method호출
      appBar : AppBar(
        title: Text('헬로월드'),
      ),
      body: Text('헬로월드', style: TextStyle(fontSize: 30)),
    );
  }
    void _changeMessage(){ // method 생성
    setState(() {
      _message = '헬로 월드';
    })
	}
}
```