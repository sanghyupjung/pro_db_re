# Building_Approval


## building_approval.py
### 1. def call_url(api_server_url_name = None, sigunguCd_val = None, bjdongCd_val = None, rnum = 5000)
* 건축인허가와 관련된 데이터들이 있는 17개의 URL들을 구한다.
* 건축인허가와 관련된 각각의 서비스 이름, 시군구 코드, 법정동코드의 값들을 통해 url들을 구한다.
* 이 때 'rnum = 5000'을 통해서 URL 페이지의 데이터 줄 수를 5000개로 제한한다.

### 2. def get_data(server_name, url='')
* call_url 함수를 통해 받아온 URL들의 데이터들을 파싱한다.
* 이 때 update_db.py의 update_db() 함수를 호출하여 json 데이터들을 파싱한다
* 컨테이너의 MariaDB 서버와 연결하여 json 데이터들을 update_db() 함수 안에서 설정한 컬럼들에 맞게끔 데이터들을 적재한다.
* 만약 한 페이지의 데이터 줄 수가 500개를을 넘어갈 경우 get_data_more() 함수를 호출한다.

### 3. def get_data_more(server_name, url='')
* 데이터 줄 수가 5000개보다 넘는 페이지에 한해서 초과되는 데이터들을 추가적으로 파싱한다.

### 4. def main()
* 건축인허가와 관련된 데이터들을 17개의 데이터베이스로 구축한다.
* 위 3개의 함수들을 통해서 데이터들을 파싱하여 컨테이너의 MariaDB의 데이터베이스로 구축한다.

## update_db.py
* 컨테이너의 MariaDB 서버와 연결하여 데이터들을 mairadb로 데이터들을 구축한다.

## sql파일들
* 건축인허가 데이터들을 데이터베이스로 구축하기 위한 sql문들이다.

## code.txt
* 모든 시군구 코드와 법정동 코드가 들어 있는 텍스트 파일이다.

## modules
* json
* update_db
* pickle
* time
* pprint

## python packages
* pymysql
* requests