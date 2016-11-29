# Validation

after launch all vnfd

## Test Proxy:

 - on your host start chrome on proxy mode:
 - action :
    - `chromium-browser --proxy-server="$PUBLICIP_VHG:8080"`
    - go on https://www.iplocation.net/ 
 - result : 
    - your address should by 143.233.127.4	

## Video playable

 - action: 
    - go on http://clips.vorwaerts-gmbh.de/VfE_html5.mp4
 - result:
    - read the video with the same url
 
## Caching 

 - action: 
    - wait about 1 min 
    - reload `http://clips.vorwaerts-gmbh.de/VfE_html5.mp4`
 - result:
    - URL should by change to 10.10.1.X
 
## Scaling

 - use the script usergetvideo.sh
    - `usergetvideo.sh $NBVIDEOPERMIN $PUBLICIP_VHG:8080`
    - `usergetvideo.sh 18 10.10.1.213:8080`