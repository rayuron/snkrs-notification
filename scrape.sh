curl -L https://www.nike.com/jp/launch > out.html
sed -i "s/<head>/'<head><meta charset=utf-8 \/>/g" out.html

pre_url=`tail -n 1 info.txt`
cat $pre_url
post_url=https://www.nike.com/jp/launch/`xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html | sed 's/^.*"\(.*\)".*$/\1/'`
cat $post_url

if [ $pre_url = $post_url ]; then
echo "::set-output name=changed::false"
else 
echo `xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html | sed 's/^.*"\(.*\)".*$/\1/'` > info.txt
echo https://www.nike.com/jp/launch/`xmllint --html --xpath "//div[@data-qa='product-card-0']//@href" out.html | sed 's/^.*"\(.*\)".*$/\1/'` >> info.txt
echo "::set-output name=changed::true"
fi