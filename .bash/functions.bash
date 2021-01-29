# get .gitignore template
gi() {
    curl -L -s http://gitignore.io/api/$@ ;
}

ip-info() {
    curl -L -s https://checkip.amazonaws.com/
}

if type ffmpeg >/dev/null 2>&1; then
    giffy() {
        ffmpeg -i $1 -r 10 $(echo $1 | sed -E 's/\.mov$/.gif/')
    }

    githubfy() {
        ffmpeg -i $1 -vf scale=640:-1 -r 10 $(echo $1 | sed -E 's/\.mov$/.gif/')
    }

    mp4fy() {
        ffmpeg -i $1 -vcodec libx264 -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -an -crf 26 $(echo $1 | sed -E 's/\.[a-zA-Z0-9]*$/.mp4/')
    }
fi

charalias() {
    alias | grep 'alias .=' | sed "s/['|\']//g" | sed "s/^alias //g" | sed "s/=/: /"| sort
}
