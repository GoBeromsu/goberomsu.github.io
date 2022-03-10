#!bin/bash

BeforeBlog=D:/MyBlog/source/_posts
AfterBlog=D:/goberomsu.github.io/content

for post in $BeforeBlog/*
do
    # sed -i '/categories:/,+4 d' $post
    # sed -i '/tags:/,+1 d' $post
    # sed -i '/date/d' $post
    # sed -e "2 i\\emoji: 🏃" -i $post
    # sed -e "3 i\\categories: 블로그" -i $post
    # sed -e "5 i\\tags: 블로그" -i $post
    # sed -e "5 i\\date: '2022-03-10 18:00:00'" -i $post
    # sed -e "5 i\\author: 범수" -i $post
    postName=${post:24:-3}
    cd $AfterBlog
    mkdir $postName
    mv $post $postName/
done
