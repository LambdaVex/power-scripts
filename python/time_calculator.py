import datetime

PAUSE = datetime.timedelta(hours=00, minutes=45, seconds=00)
BASIS = datetime.timedelta(hours=7, minutes=36, seconds=00)
SHORTDAY = datetime.timedelta(hours=6, minutes=00, seconds=00)


def calculate_info(start, end, pause, basis, shortday):
    if shortday > (end - start - pause):
        pause = datetime.timedelta(hours=00, minutes=00, seconds=00)
        print("~Short Day~")

    print("Started at:", start)
    print("Finished at:", end)
    print("************************")
    print("Time spent:", end - start - pause)
    print("SALDO: ", end="")
    if basis < (end - start - pause):
        print((end - start - pause) - basis)
    else:
        print("-", end="")
        print(basis - (end - start - pause))
    print("************************")


def calculate_leave(start, pause, basis, shortday):
    print("Started at:", start)
    print("For a Normal Day, you should finish min at:", start + pause + basis)
    print("For a Short Day, you should finish max at:", start + shortday)
    print("************************")


start_time = datetime.timedelta(hours=8, minutes=0, seconds=0)
calculate_info(start_time,  # start
               datetime.timedelta(hours=14, minutes=0, seconds=0),  # end
               PAUSE, BASIS, SHORTDAY)
print("-------------------------------------------------------------------")
calculate_leave(start_time,  # start
                PAUSE, BASIS, SHORTDAY)
