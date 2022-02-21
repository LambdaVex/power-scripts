# Be aware that you might the following error, if you use the api frequently 
# {'message': "API rate limit exceeded. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)", 'documentation_url': 'https://docs.github.com/rest/overview/resources-in-the-rest-api#rate-limiting'}

import requests

followers_data = requests.get("https://api.github.com/users/AliDenno/followers?per_page=2000").json()
following_data = requests.get("https://api.github.com/users/AliDenno/following?per_page=2000").json()

followers_list = []
following_list = []

for value in followers_data:
    followers_list.append(str(value.get('login')))
for value in following_data:
    following_list.append(str(value.get('login')))

print("Out of the " + str(
    len(following_data)) + " user(s) you are following, the following user(s) are not following you back: ")
print(list(set(following_list).difference(set(followers_list))))

print("Out of the " + str(len(followers_data)) + " user(s) following you, you are not following these user(s) back: ")
print(list(set(followers_list).difference(set(following_list))))
