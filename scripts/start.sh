#!/bin/bash

php artisan migrate

php artisan key:generate

php artisan serve --host 0.0.0.0 --port 8000
