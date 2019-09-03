#/bin/sh

# Stream rtsp to youtube
# Script takes one paramterer as argument, which is the stream key/code from youtube
# Audio input support not yet implemented

##################################
##         CONFIGURATION	##
## Change the following values	##
## according to yout needs	##
##################################

INPUT="rtsp://192.168.0.100/media/video1"

####### Changing below this line is not needed ########

if [ -z $1 ]; then
	echo "Give the stream key as the first parameter when running the script"
	exit
fi


echo "Using the following as input stream: " $INPUT


ffmpeg  -f lavfi \
        -i anullsrc \
        -rtsp_transport tcp \
        -i $INPUT \
        -preset ultrafast \
        -tune zerolatency \
        -c:v copy \
        -pix_fmt yuv420p \
        -c:a aac \
        -f flv rtmp://a.rtmp.youtube.com/live2/$1
