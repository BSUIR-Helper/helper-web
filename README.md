# BSUIR Helper
[![Build Status](https://travis-ci.org/BSUIR-Helper/helper-web.png?branch=master)](https://travis-ci.org/BSUIR-Helper/helper-web) [![Code Climate](https://codeclimate.com/github/BSUIR-Helper/helper-web.png)](https://codeclimate.com/github/BSUIR-Helper/helper-web) [![Coverage Status](https://coveralls.io/repos/BSUIR-Helper/helper-web/badge.png)](https://coveralls.io/r/BSUIR-Helper/helper-web) [![Dependency Status](https://gemnasium.com/BSUIR-Helper/helper-web.png)](https://gemnasium.com/BSUIR-Helper/helper-web)

The next version of http://bsuir-helper.ru

BSUIR Helper is a web site for students of Belarusian State University of Informatics and Radioelectronics. It contains some helping materials, forum discussions. It allows students to share theirs thoughts on lector's work and etc. We have a lot more ideas in our heads! ;)

Originally the web site was made with Drupal, but looks like it's time for the upgrade!

---

БГУИР хелпер - это сайт-помощник студента БГУИР (Белорусский Государственный Университет Информатики и Радиоэлектроники). На сайте размещаются некоторые вспомогательные материалы для студентов, форум, а так же сайт является местом, где пользователи могут делиться своими мнениями о преподавателях.

Текущая версия сайта работает на Drupal, но пора уже переписать по нормальному, сделать это open source, чтобы будущие программисты могли добавлять желаемые фичи на сайт.

## Development setup

```sh
cp config/database.yml.example config/database.yml # edit
bundle install
rake db:setup
rails s
```

To run tests automatically each time you save a file run `guard`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT

