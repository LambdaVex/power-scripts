import re

urls = \
    '''The website is <a href = https://docs.oldplace.com/chris/report> here </a>
The service is at <a href = http://mail.oldplace.com/mailbox?id=5432"> here </a>
The full thing is at http://events.oldplace.com/index.html'''

regex = re.compile(r"(https?)://(\w+)\.oldplace\.com/(\S+)")
newurls = re.sub(regex, r"\1://\2.newplace.org/\3", urls)
print(re.findall(regex, urls))  # For debugging
print(newurls)
