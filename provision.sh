#!/bin/bash
# Copyright (c) 2017 Malicious Genius
#

echo " >> Shell script provision ..."

# Установка часовго пояса
configure_timezone(){
    ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
}

# Настройка локали
configure_locale(){
    cp /etc/locale.gen /etc/locale.gen_bak
    sed 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen_bak > /etc/locale.gen
    cp /etc/locale.gen /etc/locale.gen_bak
    sed 's/#ru_RU.UTF-8/ru_RU.UTF-8/g' /etc/locale.gen_bak > /etc/locale.gen
    rm /etc/locale.gen_bak

    # Генерация локали
    locale-gen

    echo 'LANG="ru_RU.UTF-8"' >> /etc/locale.conf
}

# Настройка русской клавиатуры и шрифта
select_keymap(){
    echo 'KEYMAP=ru' >> /etc/vconsole.conf
    echo 'FONT=cyr-sun16' >> /etc/vconsole.conf
}

# Установка Python
install_packages() {
    pacman -Syyu
    pacman -S python --noconfirm
}

configure_timezone
configure_locale
select_keymap
install_packages

exit 0
