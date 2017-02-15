#!/bin/bash

sed -i 's/443/80/g' ~/$WS/valebroker-html-web/configuration.cfm
sed -i 's/https/http/g' ~/$WS/valebroker-html-web/configuration.cfm
sed -i 's/443/80/g' ~/$WS/valebroker-html-web/configuration-template.cfm
sed -i 's/https/http/g' ~/$WS/valebroker-html-web/configuration-template.cfm