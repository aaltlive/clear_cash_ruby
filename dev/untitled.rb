# 11.02.20

Написать сервис обновления превью кэша в соцсетях, интерфейса не будет.
Лучше без базы, :редис только.

+ ему летят адреса сайтов в произвольное время
+ он формирует комулитивные запросы каждые 5 секунд

и отправляет их по всем сервисам

4 Телеграм # (0%, 10%, 40% - 1 бан (22 часа), все сломалось -> все переустановил, подключается)
# Получить ошибку компиляции: https://github.com/vysheng/tg
# Решить ее: https://github.com/wbeyda/tg/commit/4336ff8d04268dab7d0e6888e77bec54f9a16e18
# - Либо сразу заменить sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev libjansson-dev libpython-dev make
# - на sudo apt-get install libssl1.0-dev and zlib1g-dev
# - возможно потребуются и остальные, кроме двух выше.
# Запустить telegram-cli: bin/telegram-cli -k tg-server.pub
# - ввести номер, полученный код (войти единственный раз)
# - убедиться, что вход выполнен (contact_list) и выйти (quit)
# Установить telegram-rb: gem 'telegram-rb', github: 'ssut/telegram-rb', require: 'telegram'
# - именно ссылкой на master, иначе не работает.
# Теперь можно использовать это: https://github.com/ssut/telegram-rb
#
# bind: Address already in use
# Причина: закрытие сервера комбинацией ctrl + z
# Решение: удалить файл tg.sock, созданный при запуске сервера в директории запуска команды
# Избежание ошибки: закрывать сервер комбинацией ctrl + c
+ ВК
0 Фейсбук
0 Одноклассники

чтобы они обновили свои превью кэши для этой ссылки.

+ если за 5 секунд, поступили дубли одной и той же ссылки, то их устранять.

# Задачи:
+ Принимать несколько ссылок #(https://vike.io/ru/21113/)
1 eсли запрос не удался, то вернуть ссылку в очередь. Делать так ограниченное кол-во раз
+ Ошибка при попытке обновить кеш у ссылки не из аскей символов 

# Ошибки: (# = пойманы)
# URI::InvalidURIError at /clearcache
# URI must be ascii only "https://api.vk.com/method/pages.clearCache?url=aaasdad\u0432\u0444\u044B\u0432

Запуск:
+ # Сервер api: rake server             (принимает ссылки POST, GET-ом)
- # Сервер tg: ruby dev/ttg.py          (подлючается к telegram-cli, позволяя писать сообщения боту)
+ # Цикл request: rake request          (делает каждый 5 секунд запросы)
# 
# 
