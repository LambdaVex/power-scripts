import requests

user_name = "Fill_Value"
authorization_token = "Fill_Value"

mode = input("Would you like to use API-Tokens in the request (1:yes / 2:no ): ").lower()

followers_list = []
following_list = []
followers_data_url = "https://api.github.com/users/" + user_name + "/followers?per_page=2000"
following_data_url = "https://api.github.com/users/" + user_name + "/following?per_page=2000"


def show_data(followers, following):
    for value in followers:
        followers_list.append(str(value.get('login')))
    for value in following:
        following_list.append(str(value.get('login')))
    print("Out of the " + str(
        len(following)) + " user(s) you are following, the following user(s) are not following you back: ")
    print(list(set(following_list).difference(set(followers_list))))
    print(
        "Out of the " + str(len(followers)) + " user(s) following you, you are not following these user(s) back: ")
    print(list(set(followers_list).difference(set(following_list))))


if mode == "1":
    print('Request with authorization was selected ...')
    headers = {'Authorization': authorization_token}

    followers_data = requests.get(followers_data_url, headers=headers).json()
    following_data = requests.get(following_data_url, headers=headers).json()

    show_data(followers_data, following_data)
elif mode == "2":
    print('Request without authorization was selected ...')
    followers_data = requests.get(followers_data_url).json()
    following_data = requests.get(following_data_url).json()

    show_data(followers_data, following_data)
else:
    print('choice is not recognized!')
