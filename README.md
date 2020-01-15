# SETUP NOTES
### Setup virtual env
`virtualenv --no-site-packages -p python3.6 .`
### Activate the env
`source bin/activate`
### Install pip-tools.

`pip install pip-tools`

requirements.in should contain the high level packages that we want e.g. flask, numpy etc. pip-compile will generate requirements.txt which will have all the dependencies.

``` 
pip-compile requirements.in
pip install -r requirements.txt
```

### Run local server
`python application.py`

# DEVELOPMENT NOTES

```
docker-compose up
docker ps
docker exec -it <containr-id-of-flask-server> /bin/bash
gunicorn -b 0.0.0.0:80 --log-file=- --workers=2 --threads=4 --worker-class=gthread storyScraperAPI:app --reload
```

# DEPLOYMENT NOTES

Create a multi-docker environment on Elastic Beanstalk
Make sure you add the environment variables.
Required fields are 
```
GECKO_DRIVER_PATH=
SCRAPING_URL=

ACCESS_ID=
ACCESS_KEY=

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_DB_DIRECTORY=
```

Push to github to have the service be deployed on
```
staging : 
production : tattle-factcheck-search.ap-south-1.elasticbeanstalk.com 
```