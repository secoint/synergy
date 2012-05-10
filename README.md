Synergy
=======

Решение для создания российских интернет-магазинов, основанное на Spree.


Установка
=========

1. Установите Rails 3.2.2
    
        gem install rails -v 3.2.2
    
2. Создайте новое приложение
    
        rails new synergy_app -GJTq
    
3. Настройте подключение к базе данных (рекомендуется MySQL с адаптером mysql2)

4. Добавьте в Gemfile следующие строки:
    
        gem 'mysql2'
        gem 'synergy', '~> 1.0', :git => 'git://github.com/secoint/synergy.git'
        gem 'spree_i18n', :git => 'git://github.com/spree/spree_i18n.git'
        gem 'spree_editor', :git => 'git://github.com/spree/spree_editor.git'
        gem 'spree_static_content', :git => 'git://github.com/spree/spree_static_content.git'
        gem 'spree_blue_theme', :git => 'git://github.com/spree/spree_blue_theme.git'
        # gem 'synergy_default_theme'
    
5. Выполните следующие команды:
    
        bundle install
        rails g spree:site
        rails g spree_static_content:install
        rails g spree_editor:install
        # rails g spree_address_book:install
        rails g synergy:install
        rake db:migrate
        rake db:seed db:sample
        rails s
    

Copyright (c) 2011 Roman Smirnov, released under the GNU GPL v3
