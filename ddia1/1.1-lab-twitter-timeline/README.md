TODO docker instructions

python -m venv venv
source venv/bin/activate
pip install pandas
pip install jupyter
jupyter notebook
create_tweets.ipynb

docker build --platform linux/arm64 -t nathanwilk7/ddia-1.1:arm64 .
docker build --platform linux/amd64 -t nathanwilk7/ddia-1.1:amd64 .
docker push nathanwilk7/ddia-1.1:arm64
docker push nathanwilk7/ddia-1.1:amd64