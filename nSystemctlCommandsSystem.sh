#!/bin/bash
source "sSystemctl.sh"
 MARK(){ $e "\e[1;35m";}
#
 HEAD()
{
 for (( a=2; a<=29; a++ ))
  do
   TPUT $a 1
        $E "\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m";
  done
              TPUT  1 1;$E "\033[0m\033[35m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
              TPUT  2 3;$E "\e[36mSystem Commands                                            Системные команды\e[0m";
              TPUT  3 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 14 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 15 3;$E "\e[35mRegime                                                                Режимы\e[0m";
              TPUT 22 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 23 3;$E "\e[35mКрасные команды                         (отдельно запускающиеся в терминале)\e[0m";
              TPUT 27 1;$E "\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
              TPUT 28 3;$E "\e[35mUp \xE2\x86\x91 \xE2\x86\x93 Down Select Enter\e[0m";
}
 FOOT(){ MARK;TPUT 30 1;$E "\033[0m\033[35m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";UNMARK;}
#
  M0(){ TPUT  4 3; $e "Проверяет работоспособность системы                       \e[32m is-system-running \e[0m";}
  M1(){ TPUT  5 3; $e "Войдите в режим по умолчанию                                        \e[32m default \e[0m";}
  M2(){ TPUT  6 3; $e "Войдите в режим спасения                                             \e[33m rescue \e[0m";}
  M3(){ TPUT  7 3; $e "Войдите в аварийный режим                                         \e[32m emergency \e[0m";}
  M4(){ TPUT  8 3; $e "Выключите и остановите систему                                         \e[31m halt \e[0m";}
  M5(){ TPUT  9 3; $e "Выключите и выключите систему                                      \e[31m poweroff \e[0m";}
  M6(){ TPUT 10 3; $e "Выключите и перезагрузите систему                                    \e[31m reboot \e[0m";}
  M7(){ TPUT 11 3; $e "Выключите и перезагрузите систему через kexec                         \e[32m kexec \e[0m";}
  M8(){ TPUT 12 3; $e "Попросите сервис-менеджера выйти                           \e[32m exit [EXIT_CODE] \e[0m";}
  M9(){ TPUT 13 3; $e "Переключается на другой корневой каталог            \e[32m switch-root ROOT [INIT] \e[0m";}
#
 M10(){ TPUT 16 3; $e "Описание режимов                                                             ";}
 M11(){ TPUT 17 3; $e "Приостановить работу системы                                        \e[33m suspend \e[0m";}
 M12(){ TPUT 18 3; $e "Спящий режим системы                                              \e[33m hibernate \e[0m";}
 M13(){ TPUT 19 3; $e "Спящий режим и приостановка системы                            \e[33m hybrid-sleep \e[0m";}
 M14(){ TPUT 20 3; $e "Приостановить работу системы, перейти в спящий режим \e[33m suspend-then-hibernate \e[0m";}
 M15(){ TPUT 21 3; $e "Coн                                                                   \e[33m sleep \e[0m";}
#
 M16(){ TPUT 24 3; $e "Oстановка                                                              \e[31m halt \e[0m";}
 M17(){ TPUT 25 3; $e "Bыключение                                                         \e[31m poweroff \e[0m";}
 M18(){ TPUT 26 3; $e "Перезагрузка                                                         \e[31m reboot \e[0m";}
#
 M19(){ TPUT 29 3; $e "Выход                                                                  \e[36m Exit \e[0m";}
LM=19
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
 Проверяет работоспособность системы.
 Это возвращает успех (код выхода 0), когда система полностью запущена и работает,
 в частности, не в режиме запуска, выключения или обслуживания и без сбойных служб.
 В противном случае возвращается ошибка (код выхода не равен нулю).
 Кроме того, текущее состояние выводится в виде короткой строки на стандартный
 вывод, см. таблицу ниже.
 Используйте --quiet для подавления этого вывода.
 Используйте --wait, чтобы дождаться завершения процесса загрузки, прежде чем
 распечатать текущее состояние и вернуть соответствующий статус ошибки.
 Если используется --wait, состояние инициализации или запуска не будет сообщено,
 вместо этого команда будет заблокирована до тех пор, пока не будет достигнуто
 более позднее состояние (например, работающее или деградированное).
 Table 2. is-system-running output:
┌───────────────┬──────────────────────────────────────────────────────────┬──────┐
│ Name          │ Description                                              │ Code │
│               │                                                          │ Exit │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ initializing  │ Ранняя загрузка, до достижения basic.target              │ > 0  │
│ инициализация │ или входа в состояние обслуживания.                      │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ starting      │ Поздняя загрузка, до того, как очередь заданий станет    │ > 0  │
│ запуск        │ простаивать в первый раз или будет достигнута одна из    │      │
│               │ целей восстановления.                                    │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ running       │ Система полностью работоспособна.                        │ 0    │
│ ход           │                                                          │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ degraded      │ Система работает, но один или несколько блоков отказали. │ > 0  │
│ вырождающийся │                                                          │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ maintenance   │ Спасательная или аварийная цель активна.                 │ > 0  │
│ обслуживание  │                                                          │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ stopping      │ Менеджер закрывается.                                    │ > 0  │
│ остановка     │                                                          │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ offline       │ Менеджер не работает. В частности, это рабочее состояние,│ > 0  │
│ не в сети     │ если несовместимая программа выполняется от имени        │      │
│               │ системного администратора (PID 1).                       │      │
├───────────────┼──────────────────────────────────────────────────────────┼──────┤
│ unknown       │ Не удалось определить рабочее состояние из-за нехватки   │ > 0  │
│ неизвестный   │ ресурсов или другой причины ошибки.                      │      │
└───────────────┴──────────────────────────────────────────────────────────┴──────┘
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Войдите в режим по умолчанию. Это эквивалентно изоляции systemctl default.target.
 Эта операция блокируется по умолчанию,
 используйте --no-block для запроса асинхронного поведения.
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Войдите в режим спасения:\e[32m sudo systemctl rescue\e[0m
 Это эквивалентно systemctl isolate escape.target. Эта операция блокируется по
 умолчанию, используйте --no-block для запроса асинхронного поведения.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Войдите в аварийный режим. Это эквивалентно изоляции systemctl Emergency.target.
 Эта операция блокируется по умолчанию,
 используйте --no-block для запроса асинхронного поведения.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Выключите и остановите систему:
\e[32m sudo systemctl halt\e[0m
 Это в основном эквивалентно запуску systemctl halt.target
 --job-modeu003dreplace-irreversibly --no-block,
 но также печатает сообщение на стене для всех пользователей. Эта команда асин-
 хронная; он вернется после постановки в очередь операции остановки, не дожидаясь
 ее завершения. Обратите внимание, что операция просто остановит ядро ОС после за-
 вершения работы, оставив аппаратное обеспечение включенным. В сочетании с --force
 отключение всех запущенных служб пропускается, однако все процессы уничтожаются,
 а все файловые системы размонтируются или монтируются только для чтения, после
 чего сразу же происходит остановка системы. Если --force указан дважды, операция
 выполняется немедленно, без завершения каких-либо процессов или размонтирования
 каких-либо файловых систем. Это может привести к потере данных. Обратите внимание,
 что когда --force указан дважды, операция halt выполняется самим systemctl, и си-
 стемный менеджер не связывается. Это означает, что команда должна завершиться ус-
 пешно, даже если произошел сбой системного менеджера.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Выключите систему:
\e[32m sudo systemctl poweroff\e[0m
#
\e[32m poweroff\e[0m

 По большей части это эквивалентно systemctl start poweroff.target
 --job-modeu003dreplace-irreversibly --no-block
 но также выводит сообщение на стену для всех пользователей. Эта команда асинхрон-
 ная; он вернется после того, как операция отключения питания будет поставлена в
 очередь, не дожидаясь ее завершения. В сочетании с --force отключение всех запу-
 щенных служб пропускается, однако все процессы уничтожаются, а все файловые сис-
 темы размонтируются или монтируются только для чтения, после чего немедленно сле-
 дует отключение питания. Если --force указан дважды, операция выполняется немед-
 ленно, без завершения каких-либо процессов или размонтирования каких-либо файло-
 вых систем. Это может привести к потере данных. Обратите внимание, что когда
 --force указан дважды, операция отключения питания выполняется самим systemctl,
 и системный менеджер не связывается. Это означает, что команда должна завершиться
 успешно, даже если произошел сбой системного менеджера.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Выключите и перезагрузите систему:
\e[32m sudo systemctl reboot\e[0m
#
\e[32m reboot\e[0m

 Это в основном эквивалентно запуску
 systemctl reboot.target --job-modeu003dreplace-irreversibly --no-block
 но также печатает сообщение на стене для всех пользователей. Эта команда асин-
 хронная; он вернется после постановки в очередь операции перезагрузки, не дожи-
 даясь ее завершения. В сочетании с --force отключение всех запущенных служб про-
 пускается, однако все процессы уничтожаются, а все файловые системы размонтируют-
 ся или монтируются только для чтения, после чего следует перезагрузка. Если
 --force указан дважды, операция выполняется немедленно, без завершения каких-либо
 процессов или размонтирования каких-либо файловых систем. Это может привести к
 потере данных. Обратите внимание, что когда --force указан дважды, операция пере-
 загрузки выполняется самим systemctl, а системный менеджер не связывается. Это
 означает, что команда должна завершиться успешно, даже если произошел сбой сис-
 темного менеджера. Если указан переключатель --reboot-argumentu003d, он будет
 передан как необязательный аргумент системному вызову reboot
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Выключите и перезагрузите систему через kexec.
 Это эквивалентно запуску
 systemctl kexec.target --job-modeu003dreplace-irreversibly --no-block.
 Эта команда асинхронная; он вернется после постановки в очередь операции
 перезагрузки, не дожидаясь ее завершения.
 В сочетании с --force отключение всех запущенных служб пропускается,
 однако все процессы уничтожаются, а все файловые системы размонтируются
 или монтируются только для чтения, после чего следует перезагрузка.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Попросите сервис-менеджера выйти.
 Это поддерживается только для диспетчеров пользовательских служб т.е. в сочетании
 с параметром --user или в контейнерах и в противном случае эквивалентно отключению
 питания. Эта команда асинхронная; он вернется после постановки в очередь операции
 выхода, не дожидаясь ее завершения.
 Диспетчер служб завершит работу с указанным кодом выхода, если передан EXIT_CODE.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Переключается на другой корневой каталог и выполняет новый процесс системного
 администратора под ним. Это предназначено для использования в начальных
 RAM-дисках («initrd») и будет переходить от процесса системного администратора
 initrd (он же процесс «init») к основному процессу системного администратора,
 который загружается с фактического тома хоста. Этот вызов принимает два аргумента:
 каталог, который должен стать новым корневым каталогом, и путь к новому двоичному
 файлу системного менеджера под ним для выполнения как PID 1.
 Если последний опущен или пустая строка, двоичный файл systemd будет автоматически
 найден и используется как init.
 Если путь системного менеджера опущен, равен пустой строке или идентичен пути к
 двоичному файлу systemd, состояние процесса системного менеджера initrd
 передается главному системному менеджеру, что позволяет позже выполнить
 самоанализ состояния служб, участвующих в фазе загрузки initrd.
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Suspend to RAM (Ждущий режим):
 этот режим используют большинство ноутбуков. И автоматически входят в этот режим
 в случае бездействия по истечению определенного периода времени. А так же при
 закрытии крышки ноутбука, когда компьютер работает от аккумулятора. В этом режи-
 ме питание остается для оперативной памяти, а большинство компонентов отключаются.

 Suspend to Disk (Hibernate):
 в этом режиме состояние ПК сохраняется в файле подкачки, и система полностью вы-
 ключается. Однако включив его, все восстанавливается и вы продолжаете с того
 места, где оставались.

 Suspend to both (Гибридная приостановка):
 здесь состояние машины сохраняется в swap, но система не выключается. А так же
 компьютер выполняет приостановку системы в ОЗУ. Если у вас не установлена батарея
 тогда, вы можете безопасно возобновить работу системы с диска и продолжить свою
 работу. Этот метод намного медленнее, чем приостановка работы в ОЗУ.
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Приостановить работу системы:
\e[32m systemctl suspend\e[0m

 Это вызовет активацию специального целевого юнита suspend.target. Эта команда яв-
 ляется асинхронной и вернется после успешной постановки в очередь операции приос-
 тановки. Он не будет ждать завершения цикла приостановки/возобновления.

 Oтключить systemd:
\e[32m sudo systemctl mask suspend.target\e[0m

 Далее требуется перезагрузить систему и снова войти.

 Проверьте были ли внесены изменения в систему с помощью команды:
\e[32m sudo systemctl status suspend.target\e[0m

 Чтобы снова включить ждущий режим и гибернации требуется выполнить команду:
\e[32m sudo systemctl unmask suspend.target\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Спящий режим системы.
 Это вызовет активацию специального целевого юнита hibernate.target
 Эта команда является асинхронной и вернется после успешной постановки в очередь
 операции гибернации. Он не будет ждать завершения цикла гибернации/оттаивания.

 Oтключить systemd:
\e[32m sudo systemctl mask hibernate.target\e[0m

 Далее требуется перезагрузить систему и снова войти.

 Проверьте были ли внесены изменения в систему с помощью команды:
\e[32m sudo systemctl status hibernate.target\e[0m

 Чтобы снова включить ждущий режим и гибернации требуется выполнить команду:
\e[32m sudo systemctl unmask hibernate.target\e[0m
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Спящий режим и приостановка системы.
 Это вызовет активацию специального целевого юнита hybrid-sleep.target.
 Эта команда является асинхронной и будет возвращена после того, как операция
 гибридного спящего режима будет успешно поставлена в очередь.
 Он не будет ждать завершения цикла сна/пробуждения.

 Oтключить systemd:
\e[32m sudo systemctl mask hybrid-sleep.target\e[0m

 Далее требуется перезагрузить систему и снова войти.

 Проверьте были ли внесены изменения в систему с помощью команды:
\e[32m sudo systemctl status hybrid-sleep.target\e[0m

 Чтобы снова включить ждущий режим и гибернации требуется выполнить команду:
\e[32m sudo systemctl unmask hybrid-sleep.target\e[0m
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "
 Приостановить работу системы и перевести ее в спящий режим после задержки,
 указанной в systemd-sleep.conf. Это вызовет активацию специального целевого
 юнита suspend-then-hibernate.target.
 Эта команда является асинхронной и будет возвращена после того, как операция
 гибридного спящего режима будет успешно поставлена в очередь.
 Он не будет ждать завершения цикла сна/пробуждения или гибернации/оттаивания.

 Oтключить systemd:
\e[32m sudo systemctl mask suspend-then-hibernate.target\e[0m

 Далее требуется перезагрузить систему и снова войти.

 Проверьте были ли внесены изменения в систему с помощью команды:
\e[32m sudo systemctl status suspend-then-hibernate.target\e[0m

 Чтобы снова включить ждущий режим и гибернации требуется выполнить команду:
\e[32m sudo systemctl unmask suspend-then-hibernate.target\e[0m
";ES;fi;;
#
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 Oтключить systemd:
\e[32m sudo systemctl mask sleep.target\e[0m
 Далее требуется перезагрузить систему и снова войти.

 Проверьте были ли внесены изменения в систему с помощью команды:
\e[32m sudo systemctl status sleep.target\e[0m

 Чтобы снова включить ждущий режим и гибернации требуется выполнить команду:
\e[32m sudo systemctl unmask sleep.target\e[0m
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "";ES;fi;;
#
 19) S=M19;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done