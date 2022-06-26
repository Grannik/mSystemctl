#!/bin/bash
source "sSystemctl.sh"
 MARK(){ $e "\e[1;35;100m";}
#
 HEAD()
{
 for (( a=2; a<=36; a++ ))
          do
              TPUT $a 1
                        $E "\e[100;35m│\e[0m                                                                                \e[100;35m│\e[0m";
          done
              TPUT  1 1;$E "\033[0m\033[100;35m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  3 4;$E "\e[1;36m*** systemctl ***\e[0m";
              TPUT  4 4;$E "Управление системой systemd и менеджером сервисов";
              TPUT  5 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 14 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 15 4;$E "\e[35mOptions                                                               Опции\e[0m";
              TPUT 17 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 18 4;$E "\e[35mCommands                                      Понимаются следующие команды:\e[0m";
              TPUT 24 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 25 4;$E "\e[35mManager State Commands                          Команды состояния менеджера\e[0m";
              TPUT 31 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 33 1;$E "\e[100;35m├\e[0m\e[1;35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[100;35m┤\e[0m";
              TPUT 34 4;$E "\e[35mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 37 1;$E "\033[0m\033[100;35m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Краткое содержание                                                \e[32m Synopsis \e[0m";}
  M1(){ TPUT  7 3; $e " Описание                                                       \e[32m Description \e[0m";}
  M2(){ TPUT  8 3; $e " Смотрите также                                                    \e[32m See Also \e[0m";}
  M3(){ TPUT  9 3; $e " Заметки                                                              \e[32m Notes \e[0m";}
  M4(){ TPUT 10 3; $e " Статус выхода                                                  \e[32m Exit Status \e[0m";}
  M5(){ TPUT 11 3; $e " Синтаксис параметров                                      \e[32m Parameter Syntax \e[0m";}
  M6(){ TPUT 12 3; $e " Окружающая среда                                               \e[32m Environment \e[0m";}
  M7(){ TPUT 13 3; $e " Файлы                                                                \e[32m Files \e[0m";}
#
  M8(){ TPUT 16 3; $e " Подразумеваются следующие варианты:                                         ";}
#
  M9(){ TPUT 19 3; $e "\e[36m Команды юнитов (самоанализ и модификация)                                   \e[0m";}
 M10(){ TPUT 20 3; $e "\e[36m Команды юнит-файла                                                          \e[0m";}
 M11(){ TPUT 21 3; $e " Машинные команды                                \e[32m list-machines [PATTERN...] \e[0m";}
 M12(){ TPUT 22 3; $e "\e[36m Системные команды                                                           \e[0m";}
 M13(){ TPUT 23 3; $e "\e[36m Команды окружающей среды и команды работы                                   \e[0m";}
#
 M14(){ TPUT 26 3; $e " Перезагрузите конфигурацию диспетчера systemd                \e[33m daemon-reload \e[0m";}
 M15(){ TPUT 27 3; $e " Перезапустите диспетчер systemd                              \e[32m daemon-reexec \e[0m";}
 M16(){ TPUT 28 3; $e " Bывести текущий уровень журнала менеджера                \e[32m log-level [LEVEL] \e[0m";}
 M17(){ TPUT 29 3; $e " Pаспечатайте текущую цель журнала менеджера            \e[32m log-target [TARGET] \e[0m";}
 M18(){ TPUT 30 3; $e " Bывести состояние сторожевых таймеров менеджера \e[32m service-watchdogs [yes|no] \e[0m";}
#
 M19(){ TPUT 32 3; $e " Grannik Git                                                                 ";}
#
 M20(){ TPUT 35 3; $e " Exit                                                                        ";}
LM=20
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
 systemctl  опции       команда  служба
\e[32m systemctl [OPTIONS...] COMMAND [UNIT...]\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 systemctl может использоваться для самоанализа и контроля состояния
 системы «systemd» и диспетчера служб.
 Пожалуйста, обратитесь к systemd для ознакомления с основными понятиями
 и функциями, которыми управляет этот инструмент.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 service
 systemd
 journalctl
 loginctl
 machinectl
 systemd.unit
 systemd.resource-control
 systemd.special
 wall
 systemd.preset
 systemd.generator
 glob
 \e[0m";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 1. LSB 3.0.0 \e[36m
 http://refspecs.linuxbase.org/LSB_3.0.0/LSB-PDA/LSB-PDA/iniscrptact.html
  \e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 В случае успеха возвращается 0, в противном случае — ненулевой код ошибки.
 Используются коды возврата, определенные LSB, как определено в LSB 3.0.0[1].
 Таблица 3. Коды возврата LSB
 ┌───────┬────────────────────────────────────────┬──────────────────────────────┐
 │ Зна-  │ Описание в LSB                         │ Использование в systemd      │
 │ чение │                                        │                              │
 ├───────┼────────────────────────────────────────┼──────────────────────────────┤
 │ \e[32m0\e[0m     │ программа работает                     │ блок активен                 │
 │       │ или служба в порядке                   │                              │
 ├───────┼────────────────────────────────────────┼──────────────────────────────┤
 │ \e[32m1\e[0m     │ программа мертва и                     │ модуль не дал сбой           │
 │       │ /var/run файл pid существует           │ (используется is-failed)     │
 ├───────┼────────────────────────────────────────┼──────────────────────────────┤
 │ \e[32m2\e[0m     │ программа мертва и файл блокировки     │ не используется              │
 │       │ /var/lock существует                   │                              │
 ├───────┼────────────────────────────────────────┼──────────────────────────────┤
 │ \e[32m3\e[0m     │ программа не запущена                  │ блок не активен              │
 ├───────┼────────────────────────────────────────┼──────────────────────────────┤
 │ \e[32m4\e[0m     │ статус программы или службы неизвестен │ такой единицы нет            │
 └───────┴────────────────────────────────────────┴──────────────────────────────┘
 Сопоставление состояний службы LSB с состояниями юнитов systemd несовершенно,
 поэтому лучше не полагаться на эти возвращаемые значения,
 а вместо этого искать конкретные состояния юнитов и подсостояния.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;./lSystemctlParameterSyntax.sh;ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;./lSystemctlEnvironment.sh;ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Если вы не желаете того чтоб ваш ноутбук при закрытии крышки уходил в режим ожи-
 дания (сна). Вам требуется отредактировать файл /etc/systemd/logind.conf 
\e[32m sudo nano /etc/systemd/logind.conf\e[0m
 Добавьте в этот файл следующие строки:
\e[32m
 [Login]
 HandleLidSwitch=ignore
 HandleLidSwitchDocked=ignore
\e[0m
 Не забудьте перезагрузиться, чтобы изменения которые в сделали вступили в силу.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;./nSystemctlOptionsA.sh;ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;./nSystemctlCommandsUnit.sh;ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;./nSystemctlCommandsUnitFile.sh;ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m list-machines [PATTERN...]\e[0m
 Перечислите хост и все запущенные локальные контейнеры с указанием их состояния.
 Если указан один или несколько ШАБЛОНОВ, отображаются только контейнеры,
 соответствующие одному из них.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;./nSystemctlCommandsSystem.sh;ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;./nSystemctlCommandsEnvironment.sh;ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Перезагрузите конфигурацию диспетчера systemd:
\e[32m sudo systemctl daemon-reload\e[0m

 Это перезапустит все генераторы (см. systemd.generator), перезагрузит все файлы
 модулей и заново создаст все дерево зависимостей. Пока демон перезагружается,
 все сокеты, которые systemd слушает от имени конфигурации пользователя, останутся
 доступными. Эту команду не следует путать с командой перезагрузки.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Перезапустите диспетчер systemd. Это приведет к сериализации состояния менеджера,
 повторному выполнению процесса и повторной десериализации состояния.
 Эта команда малопригодна, за исключением отладки и обновления пакетов.
 Иногда это может быть полезно в качестве тяжеловесной перезагрузки демона.
 Во время повторного запуска демона все сокеты, которые systemd прослушивает
 от имени пользовательской конфигурации, останутся доступными.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Если аргумент не указан, вывести текущий уровень журнала менеджера.
 Если указан необязательный аргумент LEVEL, команда изменяет текущий уровень
 журнала менеджера на LEVEL (принимает те же значения,
 что и --log-levelu003d, описанные в systemd
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Если аргумент не указан, распечатайте текущую цель журнала менеджера.
 Если указан необязательный аргумент TARGET,
 команда изменяет текущую цель журнала менеджера на TARGET
 (принимает те же значения, что и --log-targetu003d, описанные в systemd).
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Если аргумент не указан,
 вывести текущее состояние сторожевых таймеров среды выполнения службы менеджера.
 Если указан необязательный логический аргумент, то глобально включаются или
 отключаются сторожевые таймеры времени выполнения службы (WatchdogSecu003d)
 и действия в экстренных ситуациях
 (например, OnFailureu003d или StartLimitActionu003d); см. systemd.service
 Этот параметр не влияет на аппаратный сторожевой таймер.
";ES;fi;;
#
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 s - source      file источник
 m - menu        file меню
 n - simple menu file простое меню
 l - bash list   file лист
 t - text        file текстовый файл

 So 26 Jun 2022
 mSystemctl - описание утидиты systemctl.
 Управление системой systemd и менеджером сервисов.

 Asciinema  :\e[36m https://asciinema.org/a/504328\e[0m
 Gogs       :\e[36m https://try.gogs.io/Grannik/mSystemctl\e[0m
 Gitea      :\e[36m https://try.gitea.io/Grannik/mSystemctl\e[0m
 Framagit   :\e[36m https://framagit.org/GrannikOleg/msystemctl\e[0m
 Bitbucket  :\e[36m \e[0m
 Codeberg   :\e[36m https://codeberg.org/Grannik/mSystemctl\e[0m
 Notabug    :\e[36m https://notabug.org/Grannikoleg/mSystemctl\e[0m
 Sourceforge:\e[36m https://sourceforge.net/projects/msystemctl/files/\e[0m
 Gitlab     :\e[36m https://gitlab.com/grannik/msystemctl\e[0m
 Github     :\e[36m https://github.com/GrannikOleg/mSystemctl\e[0m
 Phacility  :\e[36m https://admin.phacility.com/F466791\e[0m
";ES;fi;;
#
 20) S=M20;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done
