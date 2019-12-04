```
             _  _       _            _
._ _ _  ___ | || |     | | ___  ___ | |__
| ' ' |<_> || || | ___ | |/ ._><_> || / /
|_|_|_|<___||_||_||___||_|\___.<___||_\_\

  ▓▓▓▓▓▓▓▓▓▓
 ░▓ about  ▓ This script will check if your e-mail is inside MALL.cz's leaked database.
 ░▓ author ▓ yurisuki <yurisuki@waifu.club>
 ░▓▓▓▓▓▓▓▓▓▓
 ░░░░░░░░░░

mall_bash_checker.sh	> the main script which checks if your password has been leaked in MALL.cz database.
mail_leak.txt		> this file includes list of leaked email addresses, which are hashed by sha256.
example_email_list.txt 	> this is just example file of how should email list look like.
```

## table of contents
 - [executing the script](#executing-the-script)
 - [faq](#faq)
 - [thanks to some bystroshaq guy](#thank-you-bystroushaak)

# executing the script
You can execute this script really easily.

curl way:
```shell
curl https://raw.githubusercontent.com/yurisuki/mall_leak/master/mall_bash_checker.sh | bash -s -- --help
```

***

local way:
```shell
git clone https://github.com/yurisuki/mall_leak.git
cd mall_leak
./mall_bash_checker.sh --help
```

# faq
Why?
- Actually, I made this as a bash test capability. But thanks to this you can actually acknowledge yourself about your security.

Please remove my password from this rheiwujrfgwedjklfbvdcsljfg *angry*.
- The whole list only includes email addresses which are hashed by sha256, so you're safe.

Should I change my password if I'm on that list?
- I highly recommend that.

Where did you get it?
- From [this repository](https://github.com/Bystroushaak/mall_checker)

# thank you bystroushaak
I took your idea and your file with all email addresses.

Check out [his repository](https://github.com/Bystroushaak/mall_checker).
