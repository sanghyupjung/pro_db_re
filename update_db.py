import json
import pymysql

def update_db(json_file_name, li=[]):

    # Personal test file
    #db = pymysql.connect(host='127.0.0.1', port = 3310, user = 'root', passwd = 'cobra512', db = 'building_ledger', charset = 'utf8')
    # Server test file
    db = pymysql.connect(host='127.0.0.1', port = 3306, user = 'user', passwd ='password', db = 'building_approval', charset = 'utf8')
    cursor = db.cursor()

    is_num = ['rnum', 'flrNo', 'mainBldCnt', 'atchBldDongCnt', 'archArea', 'hhldCnt', 'hoCnt', 'fmlyCnt', 'totPkngCnt', 'bldCnt', 'platArea', 'archArea', 'bcRat', 'totArea', 'vlRatEstmTotArea', 'vlRat', 'area', 'flrArea', 'len', 'heit', 'hoNo', 'silHoHhldCnt', 'silHoHhldArea', 'indrAutoUtcnt', 'indrAutoArea', 'oudrAutoUtcnt', 'oudrAutoArea', 'indrMechUtcnt', 'indrMechArea', 'oudrMechUtcnt', 'oudrMechArea', 'neigAutoUtcnt', 'neigAutoArea', 'neigMechUtcnt', 'neigMechArea', 'exmptUtcnt', 'roadLenTotal', 'roadWidthTotal', 'roadAreaTotal', 'ranoSeqno', 'roadChangOdr', 'grndFlrCnt', 'sumArchArea', 'sumTotArea', 'capaPsper', 'capaLube']

    for alpha in li:
        temp = ''
        temp2 = ''
        is_first = True
        for key,value in alpha.items():
            if value == '' or value == ' ' or value == None or value == '\\':
                continue
            else:
                if is_first:
                    temp += '{}'.format(key)
                    temp2 += '"{}"'.format(value)
                    is_first = False
                else:
                    temp += ', {}'.format(key)
                    if key in is_num:
                        temp2 += ', {}'.format(value)
                    else:
                        temp2 += ', "{}"'.format(value)
        try:
            cursor.execute("INSERT IGNORE INTO {} ({}) VALUES({});".format(json_file_name, temp, temp2))
        except:
            continue
        
        db.commit()
