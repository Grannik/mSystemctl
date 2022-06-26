#!/bin/bash
source "sSystemctl.sh"
 MARK(){ $e "\e[1;35m";}
#
 HEAD()
{
 for (( a=2; a<=40; a++ ))
  do
   TPUT $a 1
        $E "\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  1 1;$E "\033[0m\033[35m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  2 3;$E "\e[36mCommands Unit                      Команды юнитов (самоанализ и модификация)\e[0m";
              TPUT  3 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT  4 3;$E "\e[35mList                                                                  Cписок\e[0m";
              TPUT 10 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 11 3;$E "\e[35mIs                                                                  Проверка\e[0m";
              TPUT 15 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 39 1;$E "\033[35m├─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────┤\e[0m";
}
 FOOT(){ MARK;TPUT 41 1;$E "\033[0m\033[35m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  5 3; $e "Посмотреть все службы (юниты), аналог опции -t      \e[33m list-units [PATTERN...] \e[0m";}
  M1(){ TPUT  6 3; $e "Вывод содержит следующие столбцы:                                            ";}
  M2(){ TPUT  7 3; $e "увидеть дерево зависимостей модуля              \e[33m list-dependencies [UNIT...] \e[0m";}
  M3(){ TPUT  8 3; $e "посмотреть все службы сокетов                     \e[32m list-sockets [PATTERN...] \e[0m";}
  M4(){ TPUT  9 3; $e "Список единиц таймера, находящихся в памяти        \e[32m list-timers [PATTERN...] \e[0m";}
#
  M5(){ TPUT 12 3; $e "Проверьте, активны ли какие-либо из указанных устройств \e[33m is-active PATTERN.. \e[0m";}
  M6(){ TPUT 13 3; $e "Проверьте, находится ли из устройств в состоянии «сбой»\e[33m is-failed PATTERN... \e[0m";}
  M7(){ TPUT 14 3; $e "Проверить, включен ли сервис для автозапуска при загрузке системы\e[33m is-enabled \e[0m";}
#
  M8(){ TPUT 16 3; $e "посмотреть параметры управления службой в Linux    \e[33m show [PATTERN...|JOB...] \e[0m";}
  M9(){ TPUT 17 3; $e "Отображение файла модуля                                     \e[33m cat PATTERN... \e[0m";}
 M10(){ TPUT 18 3; $e "Показать справочные страницы устройст                \e[32m help PATTERN...|PID... \e[0m";}
 M11(){ TPUT 19 3; $e "Команда для отображения текущего набора значений     \e[32m systemctl --state=help \e[0m";}
 M12(){ TPUT 20 3; $e "Запустить (активировать) один или несколько юнитов         \e[33m start PATTERN... \e[0m";}
 M13(){ TPUT 21 3; $e "Остановить (деактивировать) один или несколько юнитов       \e[33m stop PATTERN... \e[0m";}
 M14(){ TPUT 22 3; $e "обновить конфигурацию службы из файла юнита                \e[33m reload PATTERN.. \e[0m";}
 M15(){ TPUT 23 3; $e "Перезапустить работающую службу                           \e[33m restart PATTERN.. \e[0m";}
 M16(){ TPUT 24 3; $e "перезапустить службу, только если она запущена          \e[32m try-restart PATTERN \e[0m";}
 M17(){ TPUT 25 3; $e "обновить конфигурацию и выполнить перезапуск      \e[33m reload-or-restart PATTERN \e[0m";}
 M18(){ TPUT 26 3; $e "Перезагрузите один или несколько юнитов    \e[32m try-reload-or-restart PATTERN... \e[0m";}
 M19(){ TPUT 27 3; $e "запустить только одну службу вместе с ее зависимостями         \e[33m isolate UNIT \e[0m";}
 M20(){ TPUT 28 3; $e "отправить сигнал завершения процессу                        \e[32m kill PATTERN... \e[0m";}
 M21(){ TPUT 29 3; $e "Удалите конфигурацию, состояние, кеш, журналы ...          \e[32m clean PATTERN... \e[0m";}
 M22(){ TPUT 30 3; $e "Заморозить один или несколько юнитов                      \e[32m freeze PATTERN... \e[0m";}
 M23(){ TPUT 31 3; $e "Разморозить (разморозить) один или несколько юнитов         \e[32m thaw PATTERN... \e[0m";}
 M24(){ TPUT 32 3; $e "Задайте указанные свойства модуля       \e[32m set-property UNIT PROPERTY=VALUE... \e[0m";}
 M25(){ TPUT 33 3; $e "Привязывает файл или каталог с хоста к пространству   \e[32m bind UNIT PATH [PATH] \e[0m";}
 M26(){ TPUT 34 3; $e "Подключает образ\e[32m mount-image UNIT IMAGE [PATH[PARTITION_NAME:MOUNT_OPTIONS]] \e[0m";}
 M27(){ TPUT 35 3; $e "Pаспечатайте уровень журнала              \e[32m service-log-level SERVICE [LEVEL] \e[0m";}
 M28(){ TPUT 36 3; $e "Pаспечатайте текущую цель журнала       \e[32m service-log-target SERVICE [TARGET] \e[0m";}
 M29(){ TPUT 37 3; $e "перезапустить службы linux, завершившиеся с ошибкой\e[32m reset-failed [PATTERN..] \e[0m";}
 M30(){ TPUT 38 3; $e "Показать инфу о состоянии выполнения устройств  \e[33m status [PATTERN...|PID...]] \e[0m";}
#
 M31(){ TPUT 40 3; $e "Выход                                                                  \e[36m Exit \e[0m";}
LM=31
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
 Список единиц, которые systemd в данный момент имеет в памяти.
 Сюда входят модули, на которые ссылаются напрямую или через зависимость, модули,
 которые программно закреплены приложениями, или модули, которые были активны в
 прошлом и вышли из строя.
 По умолчанию отображаются только блоки, которые активны, имеют ожидающие задания
 или отказали; это можно изменить опцией --all.
 Если указан один или несколько ШАБЛОНОВ, отображаются только единицы,
 соответствующие одному из них. Отображаемые единицы дополнительно фильтруются
 параметрами --typeu003d и --stateu003d, если эти параметры указаны.
 Обратите внимание, что эта команда не показывает шаблоны юнитов,
 а только экземпляры шаблонов юнитов.
 Шаблоны юнитов, экземпляры которых не созданы, не могут быть запущены
 и следовательно, никогда не будут отображаться в выводе этой команды.
 В частности, это означает, что foo@.service никогда не будет отображаться в этом
 списке, если не создан экземпляр, например, как foo@bar.service
 Используйте list-unit-files

 Показать:
 \e[32m systemctl\e[0m

 получить список служб linux, в который входят все службы:
 \e[32m systemctl list-units --type service -all\e[0m

 \e[32m systemctl list-units\e[0m

 Показать все сервисы:
 \e[32m systemctl list-unit-files -t service\e[0m
 или
 \e[32m systemctl list-units --type service\e[0m

";ES;fi;;
  1) S=M1;SC;if [[ $cur == enter ]];then R;echo -e "
 Вывод содержит следующие столбцы:
\e[32m UNIT\e[0m        имя модуля systemd
\e[32m LOAD\e[0m        указывает на то, парсила ли systemd конфигурацию модуля.
             Конфигурация загруженных модулей сохраняется в памяти.
\e[32m ACTIVE\e[0m      краткое состояние активности модуля. Обычно это довольно стандартный
             способ сообщить, запущен модуль или нет.
\e[32m SUB\e[0m         это состояние более низкого уровня, которое указывает более подробную
             информацию о модуле. Это часто зависит от типа модуля, состояния и
             фактического метода работы модуля.
\e[32m DESCRIPTION\e[0m краткое текстовое описание того, чем является модуль/что делает.

 Перечислено 123 загруженных единицы. Передайте --all, чтобы увидеть загруженные,
 но неактивные юниты. Чтобы показать все установленные юнит-файлы,
 используйте «systemctl list-unit-files».

 Заголовок и последняя единица данного типа подчеркнуты,
 если терминал поддерживает это.
 Цветная точка отображается рядом со службами, которые были замаскированы,
 не найдены или по какой-либо иной причине не удались.

 Столбец LOAD показывает состояние загрузки:
 загружено не найдено неправильная настройка ошибка замаскировано.
 loaded    not-found  bad-setting            error  masked

 Столбцы ACTIVE показывают общее состояние устройства, одно из следующих:
 active  reloading       inactive  failed activating deactivating
 активно перезагружается неактивнo сбой   активация  деактивация.

 Столбец SUB показывает подробное состояние устройства для конкретного типа
 устройства, возможные значения зависят от типа устройства.
 Список возможных состояний LOAD, ACTIVE и SUB не является постоянным,
 и новые выпуски systemd могут как добавлять, так и удалять значения.
";ES;fi;;
  2) S=M2;SC;if [[ $cur == enter ]];then R;echo -e "
 Показывает юниты, требуемые и разыскиваемые указанными юнитами:
\e[32m systemctl list-dependencies bluetooth.service\e[0m
 Это рекурсивно перечисляет единицы, следующие за зависимостями:
 Requiresu003d, Requisiteu003d, ConsistsOfu003d, Wantsu003d, BindsTou003d.
 Если единицы не указаны, подразумевается default.target.
 По умолчанию рекурсивно расширяются только целевые единицы.
 Когда передается --all, все остальные модули также рекурсивно расширяются.
 Опции: --reverse, --after, --before
 могут использоваться для изменения отображаемых типов зависимостей.
 Обратите внимание, что эта команда только перечисляет модули, загруженные
 в память менеджером служб. В частности, эта команда не подходит для получения
 исчерпывающего списка всех обратных зависимостей от определенного модуля,
 поскольку она не выводит список зависимостей,
 объявленных модулями, которые в данный момент не загружены.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Список блоков сокетов, находящихся в настоящее время в памяти, упорядоченных по
 адресу прослушивания. Если указан один или несколько ШАБЛОНОВ, отображаются
 только блоки сокетов, соответствующие одному из них.

 Производит вывод, аналогичный:
 ПРОСЛУШИВАНИЕ    УСТРОЙСТВА                  АКТИВИРУЕТСЯ
 LISTEN           UNIT                        ACTIVATES
 /dev/initctl     systemd-initctl.socket      systemd-initctl.service
 ...
 [::]:22          sshd.socket                 sshd.service
 kobject-uevent 1 systemd-udevd-kernel.socket systemd-udevd.service
 В списке 5 розеток.
 Примечание: поскольку адреса могут содержать пробелы,
 этот вывод не подходит для программного использования.
 Смотрите также: --show-types, --all, and --state=
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Список единиц таймера, находящихся в настоящее время в памяти, упорядоченных по
 времени, когда они истекают в следующий раз. Если указан один или несколько
 ШАБЛОНОВ, отображаются только единицы, соответствующие одному из них.

 Производит вывод, аналогичный:
 СЛЕДУЮЩИЙ                    СЛЕВА         ПОСЛЕДНИЙ
 NEXT                         LEFT          LAST
 n/a                          n/a           Thu 2017-02-23 13:40:29 EST
 Sun 2017-02-26 18:55:42 EST  1min 14s left Thu 2017-02-23 13:54:44 EST
 Sun 2017-02-26 20:37:16 EST  1h 42min left Sun 2017-02-26 11:56:36 EST
 Sun 2017-02-26 20:57:49 EST  2h 3min left  Sun 2017-02-26 11:56:36 EST

 ПРОЙДЕННЫЙ БЛОК                         АКТИВИРУЕТСЯ
 PASSED     UNIT                         ACTIVATES
 3 days ago ureadahead-stop.timer        ureadahead-stop.service
 3 days ago systemd-tmpfiles-clean.timer systemd-tmpfiles-clean.service
 6h ago     apt-daily.timer              apt-daily.service
 6h ago     snapd.refresh.timer          snapd.refresh.service

 NEXT      показывает время следующего запуска таймера.
 LEFT      показывает, сколько времени осталось до следующего запуска таймера.
 LAST      показывает время последнего запуска таймера.
 PASSED    показывает, сколько времени прошло с момента последнего запуска таймера.
 UNIT      показывает имя таймера
 ACTIVATES показывает имя службы, которую активирует таймер при запуске.

 Также смотрите --all и --stateu003d.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Проверьте, активны ли какие-либо из указанных устройств, т.е. работают:
\e[32m systemctl is-active bluetooth\e[0m
 Возвращает код выхода 0, если хотя бы один из них активен, или ненулевой в про-
 тивном случае. Если не указан --quiet, это также выведет текущее состояние
 устройства на стандартный вывод.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Проверьте, не находится ли какое-либо из указанных устройств в состоянии «сбой»:
\e[32m systemctl is-failed приложение.service\e[0m
 Возвращает код выхода 0, если хотя бы один из них не прошел,
 в противном случае ненулевой. Если не указан --quiet,
 это также выведет текущее состояние устройства на стандартный вывод.
";ES;fi;;
  7) S=M7;SC;if [[ $cur == enter ]];then R;echo -e "
\e[32m systemctl is-enabled bluetooth\e[0m
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Показать свойства одного или нескольких объектов, рабочих мест или самого
 менеджера:\e[32m systemctl show bluetooth.service\e[0m
 Если аргумент не указан, будут показаны свойства менеджера.
 Если указано имя модуля, отображаются свойства модуля, если указан идентификатор
 задания, отображаются свойства задания. По умолчанию пустые свойства подавляются.
 Используйте --all, чтобы показать и их. Чтобы выбрать определенные свойства для
 отображения, используйте --propertyu003d. Эта команда предназначена для исполь-
 зования всякий раз, когда требуется компьютерно-анализируемый вывод. Используйте
 статус, если вы ищете форматированный удобочитаемый вывод. Многие свойства,
 отображаемые systemctl show, напрямую связаны с настройками конфигурации сис-
 темного и сервисного менеджера и его юнит-файлов.
 Обратите внимание, что свойства, отображаемые командой, обычно являются более
 низкоуровневыми, нормализованными версиями исходных параметров конфигурации и
 отображают состояние среды выполнения в дополнение к конфигурации.
 Например, свойства, отображаемые для единиц службы, включают текущий идентификатор
 основного процесса службы как «MainPID» (который является состоянием времени
 выполнения), а настройки времени всегда отображаются как свойства, оканчивающиеся
 на суффикс «...USec», даже если соответствующий параметры конфигурации
 заканчиваются на «...Sec», потому что микросекунды - это нормализованная единица
 времени, используемая внутренне системным и сервисным менеджером.
 Подробнее о многих из этих свойств см. в документации интерфейса D-Bus,
 поддерживающего эти свойства, см. org.freedesktop.systemd1
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Показать резервные файлы одного или нескольких устройств:
\e[32m systemctl cat bluetooth.service\e[0m
 Печатает «фрагменты» и «вставки» «fragment» «drop-ins» (исходные файлы) юнитов.
 Каждому файлу предшествует комментарий, который включает имя файла.
 Обратите внимание, что это показывает содержимое резервных файлов на диске,
 которое может не совпадать с системными менеджерами.
";ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;echo -e "
 Показать справочные страницы для одного или нескольких устройств,
 если они доступны. Если задан PID,
 отображаются справочные страницы для модуля, которому принадлежит процесс.
";ES;fi;;
 11) S=M11;SC; if [[ $cur == enter ]];then R;echo -e "
 Команда может использоваться для отображения текущего набора возможных значений.
 Это команда по умолчанию.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Запустить (активировать) один или несколько юнитов, указанных в командной строке.
\e[32m
  sudo systemctl start имя_сервиса
 или
  sudo systemctl start bluetooth.service
\e[0m
 Обратите внимание, что шаблоны единиц измерения расширяются до имен единиц,
 которые в данный момент находятся в памяти.
 Блоки, которые не активны и не находятся в состоянии сбоя,
 обычно не находятся в памяти и не будут соответствовать никакому шаблону.
 Кроме того, в случае созданных юнитов systemd часто не знает об имени экземпляра
 до тех пор, пока экземпляр не будет запущен. Следовательно, использование шаблонов
 глобуса с start имеет ограниченную полезность.
 Также не учитываются вторичные псевдонимы юнитов.
 Опция --all также может использоваться для работы с неактивными модулями,
 на которые ссылаются другие загруженные модули.
 Обратите внимание, что это не то же самое, что работать со «всеми» возможными
 единицами измерения, потому что, как описано в предыдущем абзаце, такой список
 плохо определен. Тем не менее, systemctl start --all GLOB может быть полезен,
 если все модули, которые должны соответствовать шаблону,
 загружаются некоторой целью, которая, как известно, загружена.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Остановить (деактивировать) один или несколько юнитов, указанных в командной
 строке:
\e[32m
  sudo systemctl stop bluetooth
 или
  sudo systemctl stop bluetooth -f
\e[0m
 Эта команда завершится ошибкой, если модуль не существует или его
 остановка запрещена (см. RefuseManualStopu003d в systemd.unit).
 Это не приведет к сбою, если какая-либо из команд, сконфигурированных для
 остановки устройства (ExecStopu003d и т. д.), завершится ошибкой,
 потому что менеджер все равно принудительно завершит работу устройства.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Мягкая перезагрузка:
\e[32m systemctl reload bluetooth\e[0m
 Просит все устройства, перечисленные в командной строке, перезагрузить свою кон-
 фигурацию. Обратите внимание, что это перезагрузит конфигурацию службы, а не файл
 конфигурации модуля systemd. Если вы хотите, чтобы systemd перезагрузил файл кон-
 фигурации устройства, используйте команду daemon-reload. Другими словами: в при-
 мере с Apache это перезагрузит httpd.conf Apache на веб-сервере, а не файл модуля
 apache.service systemd. Эту команду не следует путать с командой daemon-reload.
";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Обратите внимание, что перезапуск модуля с помощью этой команды не обязательно
 приводит к сбросу всех ресурсов модуля перед его повторным запуском.
\e[32m
  sudo systemctl restart NetworkManager
 или
  sudo systemctl restart bluetooth
\e[0m
 Например, хранилище файловых дескрипторов для каждой службы
 (см. FileDescriptorStoreMaxu003d в systemd.service) остаются нетронутыми до тех
 пор, пока устройство имеет ожидающее задание, и очищается только тогда, когда
 устройство полностью остановлено и больше нет ожидающих заданий.
 Если предполагается, что хранилище файловых дескрипторов также очищается во время
 операции перезапуска, явный Должна быть выполнена команда systemctl stop,
 за которой следует запуск systemctl.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "
 Остановите, а затем запустите один или несколько модулей, указанных в командной
 строке, если они работают. Это ничего не делает, если юниты не работают.
";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "
 Перезагрузите один или несколько юнитов, если они это поддерживают.
 Если нет, остановитесь, а затем запустите их вместо этого.
 Если блоки еще не запущены, они будут запущены:
\e[32m sudo systemctl reload-or-restart имя.service\e[0m
";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Перезагрузите один или несколько юнитов, если они это поддерживают.
 Если нет, остановитесь, а затем запустите их вместо этого.
 Это ничего не делает, если устройства не работают.
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 Запустите модуль, указанный в командной строке, его зависимости и остановите все:
\e[32m sudo systemctl isolate multi-user.target\e[0m
 остальные, если только они не имеют IgnoreOnIsolateu003dyes (см. systemd.unit).
 Если указано имя модуля без расширения, предполагается расширение «.target».
 Эта команда опасна, так как она немедленно остановит процессы, которые не включе-
 ны в новой цели, возможно, включая графическую среду или терминал, который вы ис-
 пользуете в данный момент. Обратите внимание, что это разрешено только для уст-
 ройств, для которых включен параметр AllowIsolateu003d.
 Подробности смотрите в systemd.unit
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 Отправить сигнал одному или нескольким процессам устройства.
 Используйте --kill-whou003d, чтобы выбрать, какой процесс убить.
 Используйте --signalu003d для выбора сигнала для отправки.
";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "
 Удалите конфигурацию, состояние, кеш, журналы или данные времени выполнения ука-
 занных модулей. Используйте --whatu003d, чтобы выбрать тип ресурса для удаления.
 Для сервисных модулей это может быть использовано для удаления каталогов,
 настроенных с помощью ConfigurationDirectoryu003d, StateDirectoryu003d,
 CacheDirectoryu003d, LogsDirectoryu003d и RuntimeDirectoryu003d,
 подробности см. в systemd.exec.
 Для таймеров это может быть использовано для очистки данных постоянной временной
 метки, если используется Persistentu003d и выбрано --whatu003dstate,
 см. systemd.timer. Эта команда применяется только к устройствам, которые
 используют любую из этих настроек. Если --whatu003d не указано, удаляются и кэш,
 и данные времени выполнения (поскольку эти два типа данных обычно избыточны
 и воспроизводятся при следующем вызове модуля).
";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "
 Заморозить один или несколько юнитов, указанных в командной строке, с помощью
 заморозки cgroup. Замораживание устройства приведет к приостановке всех процессов,
 содержащихся в контрольной группе, соответствующей устройству.
 Приостановка означает, что процессы устройства не будут запланированы для запуска
 на ЦП до тех пор, пока они не будут разморожены.
 Обратите внимание, что эта команда поддерживается только в системах, использующих
 единую иерархию cgroup. Юнит автоматически размораживается непосредственно перед
 тем, как мы выполняем работу с ним, т.е. перед остановкой агрегата.
";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "
 Разморозить (разморозить) один или несколько юнитов, указанных в командной строке.
 Это операция, обратная команде замораживания,
 и возобновляет выполнение процессов в контрольной группе объекта.
";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e "
 Задайте указанные свойства модуля во время выполнения, если это поддерживается.
 Это позволяет изменять свойства параметров конфигурации, такие как параметры
 управления ресурсами, во время выполнения. Не все свойства могут быть изменены во
 время выполнения, но многие параметры управления ресурсами (в основном, в
 systemd.resource-control) могут быть изменены. Изменения применяются немедленно и
 сохраняются на диске для будущих загрузок, за исключением случаев,
 когда --runtime передается, и в этом случае настройки применяются только до
 следующей перезагрузки.
 Синтаксис назначения свойств очень похож на синтаксис назначений в юнит-файлах.
 Пример: systemctl set-property foobar.service CPUWeightu003d200

 Если указанный юнит окажется неактивным, изменения будут сохранены только на диске
 как описано выше, поэтому они вступят в силу, когда юнит будет запущен. Обратите
 внимание, что эта команда позволяет изменять несколько свойств одновременно,
 что предпочтительнее, чем настраивать их по отдельности.
 Пример: systemctl set-property foobar.service CPUWeightu003d200 MemoryMaxu003d2G
 IPAccountingu003dyes

 Как и в случае с параметрами конфигурации файла модуля, назначение пустого
 параметра обычно сбрасывает свойство до его значений по умолчанию.
 Пример: systemctl set-property avahi-daemon.service IPAddressDenyu003d
";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo -e "
 Привязывает файл или каталог с хоста к указанному пространству имен монтирования
 устройства. Первый аргумент пути — это исходный файл или каталог на хосте,
 второй аргумент пути — конечный файл или каталог в пространстве имен монтирования
 устройства. Когда последний опущен, путь назначения в пространстве имен
 монтирования устройства совпадает с исходным путем на хосте. В сочетании с
 параметром --read-only создается монтирование только для готовой привязки.
 переключатель --mkdir,
 путь назначения сначала создается до применения монтирования
";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo -e "
 Подключает образ с хоста в указанное пространство имен монтирования устройства.
 Первый аргумент пути — это исходный образ на хосте,
 второй аргумент пути — это каталог назначения в пространстве имен монтирования
 устройства (т. е. внутри RootImageu003d/RootDirectoryu003d ).
 Следующий аргумент, если он есть, интерпретируется как разделенный двоеточиями
 кортеж имени раздела и разделенный запятыми список параметров монтирования для
 этого раздела. Формат такой же, как и у параметра службы MountImagesu003d.
 В сочетании с параметром --read-only создается готовое монтирование.
 В сочетании с параметром --mkdir
 путь назначения сначала создается до применения монтирования.
 Обратите внимание, что этот параметр в настоящее время поддерживается только для
 модулей, работающих в пространстве имен монтирования (т. е. с RootImageu003d,
 PrivateMountsu003d и т. д.). Обратите внимание, что упомянутое здесь пространство
 имен, в которое будет добавлено монтирование образа, — это пространство, в котором
 выполняется основной процесс службы. Обратите внимание, что упомянутое здесь
 пространство имен, в которое будет добавлено монтирование привязки, — это то
 пространство, в котором выполняется основной процесс службы.
 Другие процессы (выполняемые ExecReloadu003d, ExecStartPreu003d и т. д.)
 выполняются в разных пространствах имен.
 Example:
 systemctl mount-image foo.service /tmp/img.raw /var/lib/image root:ro,nosuid
 systemctl mount-image --mkdir bar.service /tmp/img.raw /var/lib/baz/img
";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo -e "
 Если аргумент LEVEL не указан,
 распечатайте текущий уровень журнала, как сообщает служба SERVICE.
 Если указан необязательный аргумент LEVEL,
 измените текущий уровень журнала службы на LEVEL. Уровень журнала должен быть
 типичным уровнем журнала системного журнала, т. е. значением в диапазоне 0...7
 или одной из строк emerg, alert, crit, err, warning, notice, info, debug
 подробности смотрите в syslog
 Служба должна иметь соответствующее свойство BusNameu003ddestination,
 а также реализовывать универсальный интерфейс org.freedesktop.LogControl1
 (systemctl будет использовать общий протокол D-Bus для доступа к интерфейсу
 org.freedesktop.LogControl1.LogLevel для назначения имени D-Bus.)
";ES;fi;;
 28) S=M28;SC;if [[ $cur == enter ]];then R;echo -e "
 Если аргумент TARGET не указан, распечатайте текущую цель журнала,
 как сообщает служба SERVICE.
 Если указан необязательный аргумент TARGET,
 измените текущую цель журнала службы на TARGET.
 Цель журнала должна быть одной из строк:
 console (для вывода журнала в стандартный поток ошибок службы),
 kmsg (для вывода журнала в буфер журнала ядра),
 log (для вывода журнала в systemd-journald.service
 с использованием собственного протокола журнала),
 syslog (для вывода журнала в классический сокет системного журнала /dev/log),
 null (без вывода журнала вообще)
 auto (для автоматически определяемого выбора, обычно эквивалентного консоли,
 если служба вызывается в интерактивном режиме)
 и журнал или системный журнал в противном случае).
 Для большинства служб имеет смысл только небольшое подмножество целей журнала.
 В частности, большинство «обычных» служб должны реализовывать только консоль,
 журнал и ноль. Все остальное подходит только для низкоуровневых служб,
 которые активны в очень ранней загрузке, прежде чем будет установлено правильное
 ведение журнала.
 Служба должна иметь соответствующее свойство BusNameu003ddestination,
 а также реализовывать общий интерфейс org.freedesktop.LogControl1
 (systemctl будет использовать общий протокол D-Bus для доступа к
 org.freedesk интерфейс top.LogControl1.LogLevel для назначения имени D-Bus.)
";ES;fi;;
 29) S=M29;SC;if [[ $cur == enter ]];then R;echo -e "
 Сбросить состояние «сбой» указанных модулей или, если имя модуля не передано,
 сбросить состояние всех модулей.
 Когда устройство каким-либо образом выходит из строя (например, процесс заверша-
 ется с ненулевым кодом ошибки, завершается ненормально, истекает время ожидания),
 он автоматически переходит в состояние «сбой», а его код выхода и состояние
 записываются для самоконтроля администратором до тех пор, пока служба
 останавливается/перезапускается или сбрасывается с помощью этой команды.
 В дополнение к сбросу состояния «сбой» юнита он также сбрасывает различные другие
 свойства юнита:
 счетчик ограничения начальной скорости всех типов юнитов сбрасывается на ноль,
 как и счетчик перезапуска сервисных юнитов. Таким образом, если начальный лимит
 юнита в соответствии с настройками StartLimitIntervalSecu003d/StartLimitBurstu003d
 превышен, а юнит отказывается запускаться снова, используйте эту команду,
 чтобы сделать его снова доступным для запуска.
";ES;fi;;
 30) S=M30;SC; if [[ $cur == enter ]];then R;echo -e "
 Показать краткую информацию о состоянии выполнения одного или нескольких уст-
 ройств, а затем самые последние данные журнала из журнала.
\e[32m systemctl status bluetooth\e[0m

 Если единицы измерения не указаны, показать состояние системы. В сочетании с
 --all также показывает состояние всех объектов (с учетом ограничений, указанных
 с помощью -t). Если передан PID, показать информацию о единице, к которой
 принадлежит процесс. Эта функция предназначена для создания удобочитаемого вывода.
 Если вы ищете вывод, пригодный для компьютерного анализа, используйте вместо него
 show. По умолчанию эта функция показывает только 10 строк вывода и эллипсизирует
 строки, чтобы они поместились в окне терминала. Это можно изменить с помощью
 --lines и --full, см. выше. Кроме того, journalctl --unitu003dNAME или journalctl
 --user-unitu003dNAME используют аналогичный фильтр для сообщений и могут быть
 более удобными. systemd неявно загружает модули по мере необходимости, поэтому
 просто запуск состояния будет пытаться загрузить файл. Таким образом, команда
 бесполезна для определения того, было ли что-то уже загружено или нет.
 Блоки также могут быть быстро выгружены после завершения операции,
 если нет необходимости хранить их в памяти после этого.
 Пример 1. Пример вывода из состояния systemctl:
 \$ systemctl status bluetooth
 ● bluetooth.service - Bluetooth service
 Loaded: loaded (/lib/systemd/system/bluetooth.service; enabled; vendor preset:
 enabled)
 Active: active (running) since Wed 2017-01-04 13:54:04 EST; 1 weeks 0 days ago
 Docs: man:bluetoothd(8)
 Main PID: 930 (bluetoothd)
 Status: \"Running\"
 Tasks: 1
 Memory: 648.0K
 CPU: 435ms
 CGroup: /system.slice/bluetooth.service
         └─930 /usr/lib/bluetooth/bluetoothd

 Jan 12 10:46:45 example.com bluetoothd[8900]:
 Not enough free handles to register service
 недостаточно свободных дескрипторов для регистрации службы

 Jan 12 10:46:45 example.com bluetoothd[8900]:
 Current Time Service could not be registered
 служба текущего времени не может быть зарегистрирована

 Jan 12 10:46:45 example.com bluetoothd[8900]:
 gatt-time-server: Input/output error (5)
 gatt-time-server: ошибка ввода/вывода (5)

 Точка («●») использует цвет на поддерживаемых клеммах, чтобы с первого взгляда
 суммировать состояние устройства.
 Наряду с цветом его форма варьируется в зависимости от состояния:
 «inactive» или «maintenance» — белый круг («○»),
 «active» — зеленая точка («●»),
 «deactivating» — белая точка,
 «failed» или «error» — красный крестик ( «×»),
 «reloading» — зеленая стрелка по часовой стрелке («↻»).
 В строке «Loaded:» в выводе будет указано «[oaded»,
 если устройство было загружено в память.

 Другие возможные значения для «Loaded:» включают:
 «error», если возникла проблема с его загрузкой,
 «not-found», если для этого модуля не найдено ни одного файла модуля,
 «bad-setting», если не удалось установить важный параметр файла модуля.
 анализируется и «masked», если файл модуля был замаскирован.

 Наряду с указанием пути к файлу модуля в этой строке также отображается
 состояние включения. Включенные команды запускаются при загрузке.
 См. полную таблицу возможных состояний включения, включая определение
 «masked», в документации по команде is-enabled.

 Строка «Active:» показывает активное состояние.
 Обычно это значение «active» или «inactive».
 Активный может означать запущенный, связанный, подключенный и т. д.
 в зависимости от типа устройства.
 Устройство также может находиться в процессе изменения состояния,
 сообщая о состоянии «activating» или «deactivating».
 В специальное состояние «failed» входит, когда служба каким-либо образом вышла
 из строя, например, сбой, выход с кодом ошибки или превышение времени ожидания.
 Если вводится состояние сбоя, причина будет зарегистрирована
 для дальнейшего использования.
";ES;fi;;
 31) S=M31;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done