sed -i -e "s/<head>/'<head><meta charset=utf-8 \/>/g" out.html
echo `xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html | sed 's/^.*"\(.*\)".*$/\1/'` > info.txt
echo https://www.nike.com/jp/launch/`xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html | sed 's/^.*"\(.*\)".*$/\1/'` >> info.txt
