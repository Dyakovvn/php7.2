git add -A .
git commit -m "some changes"
docker build -t dyakovvn/php7.2:latest .
docker push dyakovvn/php7.2:latest