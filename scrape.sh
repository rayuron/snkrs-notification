curl -L https://www.nike.com/jp/launch > out.html
sed -i -e "s/<head>/<head><meta charset=utf-8 \/>/g" out.html

pre_title=`head -n 1 info.txt`
echo $pre_title
post_title=`xmllint --html --xpath "//div[@data-qa='product-card-0']//@aria-label" out.html 2>/dev/null | sed 's/^.*"\(.*\)".*$/\1/'`
echo $post_title

if [[ `echo ${pre_title} | sed 's/ *$//g'` = `echo ${post_title} | sed 's/ *$//g'` ]]; then
echo "::set-output name=changed::false"
echo "same name"
else
echo $post_title > info.txt
## echo https://www.nike.com/jp/launch`xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html 2>/dev/null | sed 's/^.*"\(.*\)".*$/\1/'` >> info.txt
title=`head -n 1 info.txt`
## url=`tail -n 1 info.txt`
echo "different name"
echo "::set-output name=changed::true"
echo "::set-output name=title::$(echo $title)"
## echo "::set-output name=url::$(echo $url)"
fi