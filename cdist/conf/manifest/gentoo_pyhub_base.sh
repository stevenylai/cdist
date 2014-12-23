. $__manifest/gentoo_base.sh
__package dev-python/sphinx_rtd_theme --state present
__package dev-python/tox --state present
__package www-servers/tornado --state present
require="__package/dev-python/sphinx_rtd_theme" __package dev-python/couchdb-python --state present
__package sci-libs/scipy --state present
__package sci-libs/scikits_learn --state present
__package dev-python/jsonschema --state present
__package dev-python/alembic --state present
__package dev-python/pymysql --state present
__package dev-python/nosexcover --state present
__package dev-python/pytest-cov --state present
__package dev-python/pep8 --state present

