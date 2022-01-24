# maintenance

# Jdownloader-2-Rclone-Heroku (Beta)
currently: Working but not possible on large file links `results application error`
## How To Deploy ?

### Step 0
Jdownloader account needed [click here to create or register](https://my.jdownloader.org/login.html#register)
### Step 1
* Star my repository
* Create a [Heroku](https://dashboard.heroku.com/login) Free account
* Log in to Heroku in any browser
* Click on the Rapid deployment button [![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://developeranaz.github.io/Jdownloader-2-Rclone-Heroku/random.html)

### Step 2 
i) `conf_in_url` section -
 * Generate rclone.conf file from any terminal or cmd or termux or by using RCX android.    
 * Make sure you have a valid config and the remote name shouldn't have spaces in it. eg- [devanaz]    
 * You can't use Multiple cloud drive accounts in single rclone.conf file, if you done that your first config is only taken for upload.    
 * We need any text/code hosting website, Use gist-github github account needed.    
 * Open rclone.config file using any text editors and copy all text inside rclone.conf and paste it in gist    
 * Choose any file name and save it by clicking Create secret gist.    
 * Then Click RAW button and copy the url (RAW is important)
 * Paste your config Url in the heroku `conf_in_url` Section
 * note : Don't share this url to anyone
    
ii) Type your jdownloader useremail in `JD_USER_EMAIL` section

iii) type your jdownloader user password in `JD_USER_PASSWORD` section

### Step 3
click DEPLOY TO HEROKU

### Step 4
Use Jdownloader remote for pc or [Android](https://play.google.com/store/apps/details?id=org.appwork.myjdandroid) or use [WEB interference](https://my.jdownloader.org/index.html) and  login to your corresponding account
. Your downloader will shows

## For Custom / VPS Users
 ### By using Docker
Use this command for any paid vps or google free cloudshell ie., Any vps /server with docker installed

Flags or arguments used in my docker image
* `-u` for Your JD user email
* `-p` for Your JD password
* `-c` your rclone.conf in raw url format (gist-github recommended)

command example below replace your email, password and config in raw
<pre>
 docker run -itd developeranaz/jd2rclone:vps jd -u 'email@gmail.com' -p 'Mystrongpass' -c 'https://yourconf.in.raw.gist/rclone.conf' 
</pre>

### NOTE
* Here some of the source code are hosted outside this repository [`#1 branch`](https://github.com/developeranaz/Jdownloader-2-Rclone-Heroku/tree/development-stage), i'll add in here soon.
* About config : If the config file has multiple remotes, only first remote is used for upload.


`This sourcecode has a lot of bugs, cause its initial release. I will fix them step by step and do my best`

