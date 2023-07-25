import datetime
import re

PAUSE = datetime.timedelta(hours=00, minutes=45, seconds=00)
BASIS = datetime.timedelta(hours=7, minutes=36, seconds=00)
SHORTDAY = datetime.timedelta(hours=6, minutes=00, seconds=00)


def saldo():
    pattern = r'^\d{2}:\d{2}$'
    while True:
        enter_time_q = input("When did you start working (hh:mm)? ")
        enter_time = enter_time_q
        if re.match(pattern, enter_time):
            break
        else:
            print("Input should be of format hh:mm")
    while True:
        leave_time_q = input("When did you finish working (hh:mm)? ")
        leave_time = leave_time_q
        if re.match(pattern, leave_time):
            break
        else:
            print("Input should be of format hh:mm")
    enter_time_parts = enter_time.split(':')
    leave_time_parts = leave_time.split(':')
    enter_time_delta = datetime.timedelta(
        hours=int(enter_time_parts[0]), minutes=int(enter_time_parts[1]), seconds=00)
    leave_time_delta = datetime.timedelta(
        hours=int(leave_time_parts[0]), minutes=int(leave_time_parts[1]), seconds=00)

    if SHORTDAY > (leave_time_delta - enter_time_delta - PAUSE):
        pause = datetime.timedelta(hours=00, minutes=00, seconds=00)
        print("~Short Day~")
    else:
        pause = datetime.timedelta(hours=00, minutes=45, seconds=00)

    print("Started at: ", enter_time_delta)
    print("Finished at: ", leave_time_delta)
    print("************************")
    print("Time spent: ", leave_time_delta - enter_time_delta - pause)
    print("SALDO: ", end="")
    if BASIS < (leave_time_delta - enter_time_delta - pause):
        print((leave_time_delta - enter_time_delta - pause) - BASIS)
    else:
        print("-", end="")
        print(BASIS - (leave_time_delta - enter_time_delta - pause))
    print("************************")


def leave_time():
    pattern = r'^\d{2}:\d{2}$'

    while True:
        enter_time_q = input("When did you start working (hh:mm)? ")
        enter_time = enter_time_q
        if re.match(pattern, enter_time):
            break
        else:
            print("Input should be of format hh:mm")

    time_parts = enter_time.split(':')
    enter_time_delta = datetime.timedelta(
        hours=int(time_parts[0]), minutes=int(time_parts[1]), seconds=00)

    print("You Started at", enter_time)
    print("Normal Day - Work until at least:",
          enter_time_delta + PAUSE + BASIS)
    print("Short Day - Do not work after:", enter_time_delta + SHORTDAY)


user_input = input(
    "Welcome! Please choose one of the following options: \n 1. Show Saldo \n 2. Show leave time\n >>> ")
try:
    choice = int(user_input)
    if choice == 1:
        saldo()
    elif choice == 2:
        leave_time()
    else:
        print("Unrecognized")
except ValueError:
    print("Invalid input. Please enter a valid integer.")
