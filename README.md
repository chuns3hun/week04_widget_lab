# 4주차 과제: 위젯을 조합한 모바일 화면

## 과제 개요

Flutter 위젯을 조합해 클릭 수를 관리하는 모바일 화면을 구현했습니다. 증가 버튼을 누르면 클릭 수가 1씩 올라가고 기록 목록에 결과가 추가됩니다. 초기화 버튼은 클릭 수를 0으로 바꾸고 초기화 기록을 남깁니다.

## 화면과 동작

- 상단에 AppBar 제목을 표시합니다.
- 터치 아이콘과 현재 클릭 수를 한 줄에 보여 줍니다.
- 증가 버튼(`ElevatedButton.icon`)은 카운트와 기록을 갱신합니다.
- 새로고침 아이콘 버튼(`IconButton`)은 카운트를 0으로 초기화하고 기록을 추가합니다.
- 기록이 없으면 안내 문구를, 기록이 있으면 스크롤 가능한 목록을 표시합니다.

## 위젯 선택표

| 기능 | 위젯 분류 | 선택 위젯 | 선정 이유 |
|---|---|---|---|
| 화면의 기본 틀과 상단 제목 | 화면 구조 | Scaffold, AppBar | Material 화면의 본문 영역과 상단 앱 바를 구성합니다. |
| 현재 클릭 수, 목록 제목, 안내 문구 표시 | 보여 주기 | Text | 상태 값인 클릭 수와 안내 문구를 사용자가 읽을 수 있게 표시합니다. |
| 터치·증가·초기화·기록 아이콘 | 보여 주기 | Icon | 각 기능을 시각적으로 나타냅니다. |
| 기록 한 줄 표시 | 보여 주기 | Card, ListTile | 아이콘과 기록 문구를 한 항목으로 묶어 표시합니다. |
| 아이콘+클릭 수 텍스트 배치, 증가·초기화 버튼 배치 | 배치 | Row (2개) | 첫 번째 Row는 아이콘과 클릭 수를, 두 번째 Row는 두 버튼을 각각 한 줄로 묶습니다. |
| 본문 섹션을 세로로 배치 | 배치 | Column | 클릭 수, 버튼, 구분선, 기록 제목, 목록을 위에서 아래로 배치합니다. |
| 기록 목록의 높이 확정 | 배치 | Expanded | Column 안에서 ListView에 남은 높이를 할당합니다. |
| 기록 목록 표시 | 배치/스크롤 | ListView.builder | 기록 항목을 세로 스크롤 목록으로 만들고 필요할 때 항목을 구성합니다. |
| 카운트 증가 및 기록 추가 | 동작/상태 | ElevatedButton.icon, StatefulWidget, setState() | 사용자 입력에 따라 바뀌는 카운트와 기록을 관리하고 화면을 다시 그립니다. |
| 초기화 및 기록 추가 | 동작/상태 | IconButton, StatefulWidget, setState() | 클릭 수를 초기화하면서 그 결과도 UI에서 확인할 수 있게 합니다. |

## 결정 근거표

| 공식 문서 위치 | 문서에서 읽은 내용 | 직접 확인한 내용 | 현재 화면에 적용한 이유 |
|---|---|---|---|
| [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html) | Material Design 화면의 기본 시각 구조이며 appBar, body 슬롯을 제공합니다. | AC1 캡처에서 상단 바와 본문 영역이 나뉘어 표시됩니다. | 상단 제목과 본문을 나누는 큰 틀로 사용했습니다. |
| [AppBar](https://api.flutter.dev/flutter/material/AppBar-class.html) | Material Design 앱 바이며 일반적으로 Scaffold.appBar에 배치됩니다. | AC1~AC3 캡처 상단에 "4주차 위젯 조합 화면" 제목이 표시됩니다. | 화면 제목을 상단에 고정해 표시합니다. |
| [Text](https://api.flutter.dev/flutter/widgets/Text-class.html), [Icon](https://api.flutter.dev/flutter/widgets/Icon-class.html) | Text는 스타일이 있는 문자열을, Icon은 아이콘 글리프를 표시합니다. | AC2 캡처에서 "현재 클릭 수: 5"가 아이콘과 함께 표시됩니다. | 상태 값과 기능 의미를 읽기 쉽게 보여 줍니다. |
| [StatefulWidget](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html), [setState](https://api.flutter.dev/flutter/widgets/State/setState.html) | 상태가 변하면 setState()로 프레임워크에 변경을 알려 UI를 갱신할 수 있습니다. | 증가 버튼을 5번 누르자 클릭 수와 기록 목록이 함께 갱신됩니다(AC2). | 카운트와 기록 목록이 버튼 입력으로 바뀌므로 StatefulWidget에 상태를 두고 두 핸들러에서 setState()를 호출합니다. |
| [ElevatedButton.icon](https://api.flutter.dev/flutter/material/ElevatedButton/ElevatedButton.icon.html), [IconButton](https://api.flutter.dev/flutter/material/IconButton-class.html) | ElevatedButton.icon은 아이콘과 라벨이 있는 버튼을, IconButton은 아이콘만 있는 누를 수 있는 버튼을 만듭니다. | 증가 버튼으로 클릭 수가 증가하고(AC2), 초기화 아이콘 버튼으로 클릭 수가 0이 됩니다(AC3). | 증가는 의미가 드러나도록 라벨이 있는 버튼으로, 초기화는 보조 동작이므로 아이콘 버튼으로 구분했습니다. |
| [Row](https://api.flutter.dev/flutter/widgets/Row-class.html) | 자식 위젯을 가로 방향으로 배치합니다. | 캡처에서 아이콘+클릭 수 텍스트가 한 줄, 증가·초기화 버튼이 다른 한 줄에 표시됩니다. | 관련 요소를 한 줄씩 가로로 묶기 위해 Row 2개를 사용했습니다. |
| [Column](https://api.flutter.dev/flutter/widgets/Column-class.html) | 자식 위젯을 세로 방향으로 배치합니다. | 캡처에서 클릭 수, 버튼, 구분선, 기록 제목, 목록이 위에서 아래 순서로 표시됩니다. | 화면 본문의 여러 영역을 세로로 구성합니다. |
| [Expanded](https://api.flutter.dev/flutter/widgets/Expanded-class.html) | Row, Column, Flex의 자식이 사용 가능한 공간을 채우도록 확장합니다. | Expanded를 제거하고 실행했을 때의 결과) | Column 안의 ListView에 남은 높이를 할당하기 위해 사용했습니다. |
| [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html) | 항목을 필요할 때 구성하는 스크롤 가능한 선형 목록을 만듭니다. | AC2 캡처에서 기록 5개가 목록으로 표시됩니다. | 기록이 여러 개 쌓여도 스크롤할 수 있도록 사용합니다. |
| [Card](https://api.flutter.dev/flutter/material/Card-class.html), [ListTile](https://api.flutter.dev/flutter/material/ListTile-class.html) | Card는 Material 카드를, ListTile은 아이콘과 텍스트가 있는 고정 높이 행을 만듭니다. | AC2 캡처에서 각 기록이 아이콘과 문구가 있는 한 줄 카드로 표시됩니다. | 기록 한 줄을 읽기 쉬운 항목으로 보여 줍니다. |

## AC1~AC3 실행 결과 및 증빙

아래 결과는 저장소에 제공된 실행 캡처에서 확인한 내용입니다. 과제의 AC별 원문 문구와 별개로, 캡처에 나타난 실제 상태를 기록했습니다.

### AC1 — 초기 상태

앱의 초기 화면에서 클릭 수 0과 빈 기록 상태("기록이 없습니다.")를 확인했습니다.

<img width="1907" height="911" alt="ac1" src="https://github.com/user-attachments/assets/46e0e482-c20e-47c3-9dfc-4633e244354d" />


### AC2 — 증가 동작

증가 버튼을 다섯 번 누른 화면에서 클릭 수 5와 `카운트 증가: 1~5` 기록 5개를 확인했습니다.

<img width="1916" height="906" alt="ac2" src="https://github.com/user-attachments/assets/9ad67e0a-c56c-4311-8bb3-ccad0f55be0b" />


### AC3 — 초기화 동작

AC2 상태에서 초기화 버튼을 2번 눌러 클릭 수가 0으로 변경되고 `카운트 초기화` 기록이 2개 추가되어 기록이 총 7개가 된 것을 확인했습니다. 초기화는 클릭 수가 이미 0이어도 기록을 추가하도록 구현했습니다.

<img width="1910" height="821" alt="ac3" src="https://github.com/user-attachments/assets/751b74ae-40af-47a4-8199-448063573658" />


## 요구사항 자체 점검

| 제출 전 확인 항목 | 결과 | 근거 |
|---|---|---|
| Scaffold와 AppBar 사용 | 확인 | lib/main.dart에서 화면 구조에 사용합니다. |
| Text, Icon 또는 Image 중 두 가지 이상 사용 | 확인 | Text와 Icon을 사용합니다. |
| Row, Column, ListView 중 두 가지 이상으로 배치 | 확인 | 세 위젯을 모두 사용합니다. |
| 버튼을 누르면 화면 결과가 바뀜 | 확인 | 카운트와 기록 목록이 갱신되며 AC 캡처로 확인했습니다. |
| 선택표 항목과 실제 코드 연결 | 확인 | 선택표의 각 행이 lib/main.dart의 위젯과 대응합니다(Row 2개, ElevatedButton.icon, Expanded, Card, ListTile 포함). |
| 공식 문서 위치와 직접 확인한 내용 구분 | 확인 | 결정 근거표에서 문서 URL, 문서에서 읽은 내용, 직접 확인한 내용을 열로 나눴습니다. |
| flutter analyze 오류·경고 없음 | 확인 | 아래 실행 결과 참고 |
| 민감정보 미포함 | 저장소에서 확인 가능한 범위에서 확인 | 코드와 제출 문서에서 비밀번호·토큰 등은 확인되지 않았습니다. 전체 저장소 이력의 모든 정보까지 보증하는 의미는 아닙니다. |

## 정적 분석 결과

실제 프로젝트 루트에서 `flutter analyze`를 실행했습니다.

```
Analyzing week04_widget_lab...
No issues found! (ran in 6.8s)
```

분석 종료 코드는 0입니다. 패키지 해결 단계에서 현재 버전 제약보다 높은 업데이트 가능 버전이 있다는 안내가 있었으나, 분석 결과 오류나 경고는 없었습니다.

## Git 커밋

최종 제출 커밋 ID: **[git log -1 --format=%H 실행 결과 40자리 해시]**
