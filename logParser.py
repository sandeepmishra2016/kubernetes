#https://pythonmana.com/2021/04/20210417005158969I.html
import re
# 47.29.201.179 - - [28/Feb/2019:13:17:10 +0000] "GET /?p=1 HTTP/2.0" 200 5316 "https://domain1.com/?p=1" "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.119 Safari/537.36" "2.75"
obj = re.compile(r'(?P<ip>.*?)- - \[(?P<time>.*?)\] "(?P<request>.*?)" (?P<status>.*?) (?P<bytes>.*?) "(?P<referer>.*?)" "(?P<ua>.*?)"')
def load_log(log):
    with open(log, mode="r", encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            parse(line)
def parse(line):
    #  Parse single line nginx journal
    try:
        result = obj.match(line)
        print(result.group("ip"))
    except:
        pass
if __name__ == '__main__':
    load_log("log")
