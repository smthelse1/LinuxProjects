#!/bin/bash

code=$(($RANDOM%10))
if [[ $code -eq 0 ]]; then
	code="200"						#200 OK: Запрос успешно обработан, и сервер возвращает запрашиваемые данные.
elif [[ $code -eq 1 ]]; then
	code="201"						#201 Created: Запрос успешно выполнен, и на сервере создан новый ресурс (например, после POST-запроса).
elif [[ $code -eq 2 ]]; then
	code="400"						#400 Bad Request: Сервер не может обработать запрос из-за синтаксической ошибки.
elif [[ $code -eq 3 ]]; then
	code="401"						#401 Unauthorized: Для доступа к ресурсу требуется аутентификация.
elif [[ $code -eq 4 ]]; then
	code="403"						#403 Forbidden: Доступ к ресурсу запрещен (например, из-за отсутствия прав).
elif [[ $code -eq 5 ]]; then
	code="404"						#404 Not Found: Запрашиваемый ресурс не найден на сервере.
elif [[ $code -eq 6 ]]; then
	code="500"						#500 Internal Server Error: Общая ошибка сервера, которая не подходит под другие категории.
elif [[ $code -eq 7 ]]; then
	code="501"						#501 Not Implemented: Сервер не поддерживает возможностей, необходимых для обработки запроса. Типичный ответ для случаев, когда сервер не понимает указанный в запросе метод.
elif [[ $code -eq 8 ]]; then
	code="502"						#502 Bad Gateway: Сервер, выступающий в роли шлюза или прокси, получил недействительный ответ от вышестоящего сервера.
elif [[ $code -eq 9 ]]; then
	code="503"						#503 Service Unavailable: Сервер временно не может обработать запрос (например, из-за перегрузки или технического обслуживания).
	fi