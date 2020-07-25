#!/bin/bash
# author: Le Van Anh
# get current working dir name
wd=$( echo $PWD | sed -E 's#(^\/.*)*\/##' )
echo "working dir: $wd "
# Create README.md file
echo "Creating README.md"
> README.md
# Get Project's name for README.md title
project_name=$( echo $wd | sed -E 's#[-_]# #g' )
echo "Project name: $project_name"
echo "# $project_name


 " >> README.md

echo "## Table of contents

- [Pre-Requisites](#Pre-Requisites)
- [How to run](#How-to-run)
- [What's included](#whats-included)
- [Creators](#creators)

## Pre-Requisites
- [Install Anaconda](https://www.anaconda.com/distribution/#download-section)

## How to run

- Type and run these command
> conda env create -f env.yml

> conda activate machine-learning

> jupyter notebook



## What's included


\`\`\`text" >> README.md

# get tree picture
tree_pic=""
if [ "$1" == "-L" ];then
	echo "Contain -L need deep tree"
	cd ..
	tree  $1 $2 $wd >> $wd/README.md
	cd $wd
else
	echo "No contain deep tree option."
	cd ..
	tree $wd >> $wd/README.md
	cd $wd
fi

echo "\`\`\`

## Creators

- [Github](https://github.com/leanh153)

- Make friend [FACEBOOK](https://WWW.facebook.com/leanh153)

- My [LinkIn](https://www.linkedin.com/in/lênanh)

Enjoy :metal:" >> README.md
echo "Complete!"
# zipping files
echo "zipping files"

zip -r ../$wd.zip *