#!bin/bash

BeforeBlog=D:/MyBlog/source/_posts
AfterBlog=D:/goberomsu.github.io/content

for post in $BeforeBlog/*
do

    sed -i '/date/d' $post
    sed -e "5 i\\date: '2022-03-10 18:00:00'" -i $post
    sed -e "5 i\\author: 범수" -i $post
    postName=${post:24:-3}
    cd $AfterBlog
    mkdir $postName
    mv $post $postName/
done
