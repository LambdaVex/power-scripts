import re

regex = re.compile(r"(\d\d)-(\d\d)-(\d{4})")
us_dates = "10-20-1969, 11-28-2010"
print(re.sub(regex, r"\2-\1-\3", us_dates))  # de_date
print(re.sub(regex, r"\2-\1-\3", us_dates, 1))
print(re.findall(regex, us_dates))
