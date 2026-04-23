import urllib.request
import json
import time
import sys

URL = "https://query2.finance.yahoo.com/v8/finance/chart/{}"
HEADERS = {'User-Agent': 'Mozilla/5.0'}

def fetch_price(ticker):
    req = urllib.request.Request(URL.format(ticker), headers=HEADERS)
    with urllib.request.urlopen(req) as response:
        data = json.loads(response.read().decode())
        price = data['chart']['result'][0]['meta']['regularMarketPrice']
        previous = data['chart']['result'][0]['meta']['previousClose']
        diff = price - previous
        return f"{price:.2f},{diff:.2f}"

def main():
    if len(sys.argv) <= 1:
        sys.exit(1)
    ticker = sys.argv[1]
    while True:
        print(fetch_price(ticker))
        sys.stdout.flush()
        time.sleep(10)

if __name__ == "__main__":
    main()
