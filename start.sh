#!bin/bash

BeforeBlog=D:/MyBlog/source/_posts
AfterBlog=D:/goberomsu.github.io/content

cd $AfterBlog

for post in $AfterBlog/*
do
    # sed -i '/categories:/d' $post
    # sed -i '/tags:/,+1 d' $post
    # sed -i '/date/d' $post
    # sed -e "2 i\\emoji: 🏃" -i $post
    # sed -e "3 i\\categories: 블로그" -i $post
    # sed -e "5 i\\tags: 블로그" -i $post
    # sed -e "5 i\\date: '2022-03-10 18:00:00'" -i $post
    # sed -e "5 i\\author: 범수" -i $post
    postName=${post:31}
    name='블로그'
    # echo $postName
    if [[ "${postName}" == *${name}* ]];then
        cd $postName
        sed -i '/categories:/d' ${postName}.md
        sed -e "3 i\\categories: etc" -i ${postName}.md
        cd ..
    fi
    # cd $AfterBlog
    # mkdir $postName
    # mv $post $postName/
done
