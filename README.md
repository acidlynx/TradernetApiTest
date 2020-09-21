# TradernetApiTest

Job application

## Toolchain

- Xcode 11.3.1
- Cocoapods

## How to start

1. `pod install`
2. `open TrendernetApiTest.xcworkspace`

## To Do

1. ~~Connect to socket~~
2. ~~Encode JSON and make object map to~~
3. ~~Make storage that store ticker objects~~
4. ~~Make UITableView with dataSource (maybe do it in separate class)~~
5. ~~Make custom UITableViewCell to show data~~
6. ~~Make updates~~
7. Add related info

## Что не сделано

- Красная и зеленая подсветка при изменении значения процентов
- Получение списка котировок
- Округление выводимых значений цены и изменения цены до `min_step`

## Это интересно

1. Биржи работают определенное время. Поэтому тикеры приходят только в рабочее время биржи

## Пожелания к API

1. Иногда в api приходят значения `pcp: -0.5600000000000001`. Нужна проверка на бэке или в мобилках, к какому значению приводить.
