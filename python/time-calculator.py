import datetime

soll = datetime.timedelta(hours= 7 , minutes=36, seconds=00)
pause = datetime.timedelta(hours= 00, minutes=45, seconds=00)

start = datetime.timedelta(hours= 7 , minutes=15, seconds=00)
end = datetime.timedelta(hours= 13, minutes=10, seconds=00)

print(end - start - pause)

if soll < (end - start - pause):
    print((end - start - pause) - soll)
else:
    print("-", end="")
    print(soll - (end - start - pause))
