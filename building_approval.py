import requests
import json
import update_db
import pymysql
import pickle
import time
from pprint import pprint

db = pymysql.connect(host='127.0.0.1', port = 3306, user = 'user', passwd ='password', db = 'building_approval', charset = 'utf8')

cursor = db.cursor()

def call_url(api_server_url_name = None, sigunguCd_val = None, bjdongCd_val = None, rnum = 5000):
    url = 'http://apis.data.go.kr/1611000/ArchPmsService/' + api_server_url_name
    service_key = 's7e8%2Fpw6Mq6hPJQaZ%2FeoZut5oBCIO6%2BBYAiN%2FgVGUnAchb%2BCg9vdyzFc857nkJ0oU9MiNLJEKKzMIPsdrzd0oA%3D%3D'
    queryParams = '?' + 'ServiceKey=' + service_key \
                  + '&sigunguCd=' + str(sigunguCd_val) \
                  + '&bjdongCd=' + str(bjdongCd_val) \
                  + "&_type=json" \
                  + '&numOfRows=' + str(rnum)
    url = url + queryParams
    return url

def get_data(server_name, url=''):
    recode = requests.get(url).json()
    total= int(recode["response"]["body"]["totalCount"])
    page_num= int(total/5000)
    
    try:
        li = []
        if isinstance(recode["response"]["body"]["items"], dict):
            for elem in recode["response"]["body"]["items"]["item"]:
                if isinstance(elem, dict):
                    li.append(elem)
        if li:
            update_db.update_db(server_name, li)
            if (page_num>0):
                for x in range(page_num):
                    get_data_more(server_name, url+'&pageNo={}'.format(x+1))
                    
    except requests.Timeout:
        pass

def get_data_more(server_name, url=''):
    recode = requests.get(url).json()
    try:
        li = []
        if isinstance(recode["response"]["body"]["items"], dict):
            for elem in recode["response"]["body"]["items"]["item"]:
                if isinstance(elem, dict):
                    li.append(elem)
        if li:
            update_db.update_db(server_name, li)
    except requests.Timeout:
        pass

def main():
    server_name_list = ['getApBasisOulnInfo', 'getApDongOulnInfo', 'getApFlrOulnInfo', 'getApHoOulnInfo', 'getApImprprInfo', 'getApHdcrMgmRgstInfo', 'getApDemolExtngMgmRgstInfo', 'getApTmpBldInfo', 'getApWclfInfo', 'getApPklotInfo', 'getApAtchPklotInfo', 'getApExposPubuseAreaInfo', 'getApHoExposPubuseAreaInfo', 'getApJijiguInfo', 'getApRoadRgstInfo', 'getApPlatPlcInfo', 'getApHsTpInfo']

    with open('code.txt', 'rb') as fp:
        arc = pickle.load(fp)

    for name in server_name_list:
        query = open('{}.sql'.format(name), 'r').read()
        cursor.execute(query)
        cursor.execute('SELECT sigunguCd, bjdongCd FROM {} ORDER BY sigunguCd DESC LIMIT 1;'.format(name))
        data = cursor.fetchone()
        
        if data == None:
            last_code = 0
        else:
            last_code = ''.join(data[0:2])
        
        count = 0

        for x in arc:
            if float(x) < float(last_code):
                continue
            elif count==10000:
                break
            else:
                try:
                    url = call_url(name, x[:5], x[5:])
                    if requests.get(url).status_code == (500 or '500'):
                        print('server error 500 in {}'.format(name))
                        pass
                    else:
                        get_data(name, url)
                        count+=1
                except ValueError:
                    continue
        time.sleep(1)

if __name__ == '__main__':
    main()
