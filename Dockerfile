FROM developeranaz/jd2rclone
RUN apt update -y
RUN apt install supervisor -y
RUN apt install git -y
RUN apt install nginx ffmpeg -y
COPY start.sh /start.sh
RUN chmod +x start.sh
CMD /start.sh
