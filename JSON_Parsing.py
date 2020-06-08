#import urllib
import urllib.request
import json
from pprint import pprint

ServiceKey = "s7e8%2Fpw6Mq6hPJQaZ%2FeoZut5oBCIO6%2BBYAiN%2FgVGUnAchb%2BCg9vdyzFc857nkJ0oU9MiNLJEKKzMIPsdrzd0oA%3D%3D"
url = "http://apis.data.go.kr/1611000/ArchPmsService/getApWclfInfo?serviceKey=" + ServiceKey + "&sigunguCd=11680&bjdongCd=10300&platGbCd=0&bun=0012&ji=0004&numOfRows=10&pageNo=1&_type=json"
request = urllib.request.Request(url)
response = urllib.request.urlopen(request)
rescode = response.getcode()
if(rescode==200):
    file = open('json_parsing.txt', 'w', -1, 'UTF-8')
    response_body = response.read()
    print(response_body.decode('utf-8'))
    file.write(response_body.decode('utf-8'))
    file.close()
    file2 = open('json_parsing2.txt', 'w', -1, 'UTF-8')
    dict = json.loads(response_body.decode('utf-8'))
    pprint(dict)
    #file2.write(dict + '\n')
    file2.write(str(dict))
    file2.close()
else:
    print("Error Code:" + rescode)