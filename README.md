# SETUP NOTES
* Setup virtual env

`virtualenv --no-site-packages -p python3.6 .`
* Activate the env

`source bin/activate`

* Install pip-tools.

`pip install pip-tools`

requirements.in should contain the high level packages that we want e.g. flask, numpy etc. pip-compile will generate requirements.txt which will have all the dependencies.

`pip-compile requirements.in` 

`pip install -r requirements.txt` 

* Run local server

`python application.py`