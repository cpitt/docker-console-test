#!/bin/bash

curl -s consul:8500/v1/health/service/app?passing 
