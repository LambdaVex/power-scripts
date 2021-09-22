import datetime

def calculate_info(start, end, pause, basis, shortday):
    if shortday > (end - start - pause):
        pause = datetime.timedelta(hours=00, minutes=00, seconds=00)
        print("~Short Day~")

    print("Started at: ", start)
    print("Finished at: ", end)
    print("************************")
    print("Time spent: ", end - start - pause)
    print("SALDO: ", end="")
    if basis < (end - start - pause):
        print((end - start - pause) - basis)
    else:
        print("-", end="")
        print(basis - (end - start - pause))
    print("************************")


calculate_info(datetime.timedelta(hours=7, minutes=30, seconds=00),  # start
               datetime.timedelta(hours=17, minutes=00, seconds=00),  # end
               datetime.timedelta(hours=00, minutes=45, seconds=00),  # pause
               datetime.timedelta(hours=7, minutes=36, seconds=00),  # basis
               datetime.timedelta(hours=6, minutes=00, seconds=00)  # shortday
               )
