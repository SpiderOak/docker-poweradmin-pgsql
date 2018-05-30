# Copyright 2018 SpiderOak, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
gettext \
libmcrypt-dev \
libpq-dev \
&& docker-php-ext-install \
gettext \
mcrypt \
pdo \
pdo_pgsql \
&& true

COPY src/ /usr/share/pdns
COPY poweradmin-entrypoint /usr/local/bin/

ENTRYPOINT ["poweradmin-entrypoint"]
CMD ["apache2-foreground"]
