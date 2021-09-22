import datetime

basis = datetime.timedelta(hours=7, minutes=36, seconds=00)
pause = datetime.timedelta(hours=00, minutes=45, seconds=00)

start = datetime.timedelta(hours=8, minutes=30, seconds=00)
end = datetime.timedelta(hours=17, minutes=10, seconds=00)

print(end - start - pause)

if basis < (end - start - pause):
    print((end - start - pause) - basis)
else:
    print("-", end="")
    print(basis - (end - start - pause))
