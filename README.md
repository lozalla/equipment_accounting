# equipment_accounting
Учет оборудования

Итоговый проект для курса "Основы реляционных баз данных MySQL" на GeekBrains

За основу проекта взят сервис по учету оборудования.

Общее описание проектируемой задачи.
В базе данных учитывается:
- оборудование по предоставлению доступа в интернет
- адрес установки оборудования
- оператор, который вносил данные в базу данных по этому оборудованию

Атрибуты оборудования:
 - название 
 - тип (коммутатор, маршрутизатор, сплиттер и т.п.) - equipment_type_id
          (нужен справочник по типу оборудования - таблица equipment_types)
 - количество портов - number_ports
 - статус для продажи (готов, проектируется, запрет на продажу) - sale_status_id
          (нужен справочник по статусам для продажи - таблица sale_statuses)
 - технический статус (исправен, неисправен, демонтирован) - technical_status_id
          (нужен справочник по техническим статусам оборудования - таблица eqiupment_technical_statuses)
 - тип доступа к сети ( массовый, корпоративный, агрегация) - access_type_id
          (нужен справочник по типам доступа - таблица access_types)
 
 Атрибуты портов оборудования
 - идентификатор оборудования
 - номер оборудования
 - техническое состояние порта (занят, свободен, неисправен)
           ( нужен справочник по техническим статусам порта  - таблица ports_technical_statuses)
 
 Атрибуты адреса (для простоты не вводятся атрибуты улицы и города) (таблица addresses): 
 - идентификатор дома (house_id)
 - регион (region_id) 
          (нужен справочник по регионам - таблица regions)
 - тип недвижимости (многоквартирный дом (МКД), частный сектор (ЧС), отдельно стоящее здание) (property_type_id)
          (нужен справочник типов недвижимости - таблица property_types)  
 - количество квартир (в частном секторе не более 4) (number_apartments)
 - тип обслуживания адреса ( адрес установки оборудования или адрес обслуживания )
          (нужен справочник типов обслуживания адреса - таблица service_types)
 
 Атрибуты оператора (таблица  operators):
 - ФИО
 - email
 - регионы, в которых он имеет право доступа на работу с базой данных
          (см. раздел таблицы связей)
 
 Таблицы связей:
 - оборудование и адреса: на адресе может быть несколько устройств, 
                          устройство может обслуживать несколько адресов - таблица devices_addresses 
        - идентификатор оборудования - device_id
        - идентификатор адреса - address_id
        - тип обслуживания адреса - service_type_id (у оборудования может быть только один адрес установки 
                                                     и несколько адресов обслуживания
                                                     важно, чтобы адреса были из одного региона)
 - операторы и регионы, которые они обслуживают: один оператор может иметь права доступа к БД в несколькиз регионах, 
                                                в регионе может быть несколько операторов) - таблица operators_regions
        - идентификатор оператора - operator_id
        - идентификатор региона - region_id
 - операторы и оборудование: работать с оборудованием могут разные операторы,	
                              оператор может работать с разным оборудованием,
                              важно, чтобы оборудование было в одном из регионов, 
                              который обслуживает оператор) - таблица evices_operators
 
