-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if Config.Language ~= 'cs' then return end

Strings = {
    get_off_stretcher_ui = '[E] - Sestoupit z nosítek',
    move = 'Pohyb',
    move_desc = 'Pohněte nosítky',
    put_in_vehicle = 'Vložit do vozidla',
    stretcher_in_vehicle = 'Uložit nosítka',
    put_in_vehicle_desc = 'Vložte nosítka do vozidla',
    place_on_stretcher = 'Umístit pacienta',
    place_on_stretcher_desc = 'Umístěte pacienta na nosítka',
    remove_from_stretcher = 'Odebrat pacienta',
    remove_from_stretcher_desc = 'Odeberte pacienta z nosítek',
    not_found = 'Nenalezeno',
    already_occupied_ambulance = 'Již obsazeno',
    already_occupied_ambulance_desc = 'Tato sanitka je již obsazena!',
    already_occupied_stretcher = 'Již obsazeno',
    already_occupied_stretcher_desc = 'Tato nosítka jsou již obsazena!',
    vehicle_occupied = 'Vozidlo obsazeno',
    vehicle_occupied_desc = 'Nelze to dělat, když v vozidle někdo řídí!',
    not_occupied_stretcher = 'Není obsazeno',
    not_occupied_stretcher_desc = 'Tato nosítka nejsou obsazena!',
    stretcher_placement_blocked = 'Umístění blokováno',
    stretcher_placement_blocked_desc = 'Nemůžete zde umístit nosítka!',
    knocked_out = 'Vykopnut',
    knocked_out_desc = 'Byli jste vykopnuti na zem!',
    checkin_cooldown = 'Čekací Doba Při Ověřování',
    checkin_cooldown_desc = 'Snažíte se ověřit příliš rychle, počkejte chvíli.',
    checkingin_progress = 'Probíhá Ověřování. . .',
    remove_dead_target = 'Odstranit Nepříčnou Osobu',
    ply_injury_head = 'hlava',
    ply_injury_neck = 'krk',
    ply_injury_spine = 'páteř',
    ply_injury_upper = 'horní tělo',
    ply_injury_lower = 'dolní tělo',
    ply_injury_left_arm = 'levá paže',
    ply_injury_left_leg = 'levá noha',
    ply_injury_right_arm = 'pravá paže',
    ply_injury_right_leg = 'pravá noha',
    diagnosing_patient_progress = 'Diagnostikování Pacienta. . .',
    treating_patient_progress = 'Léčba Pacienta. . .',
    recovering_progress = 'Obnova. . .',
    injury_report = 'Zpráva o Zranění',
    none = 'Žádné',
    mild = 'Mírné',
    moderate = 'Střední',
    severe = 'Těžké',
    deadly = 'Smrtelné',
    injury_report_locations = 'Místo',
    injury_report_type = 'Typ Zranění: %s',
    injury_report_severity = 'Závažnost: %s',
    injury_report_bleed = 'Krvácení',
    light_injury_title = 'Lehké Zranění',
    moderate_injury_title = 'Střední Zranění',
    extreme_injury_title = 'Extrémní Zranění',
    injury_bleed_notify = 'Upozornění na Zranění a Krvácení',
    light_injury_desc = 'Vaše %s je zraněna, měli byste navštívit lékaře!',
    moderate_injury_desc = 'Vaše %s je velmi zraněna, potřebujete lékaře!',
    extreme_injury_desc = 'Vaše %s je extrémně zraněna. Měli byste se dostat k lékaři, než bude pozdě!',
    injury_msg_one = 'Máte významné zranění.',
    injury_msg_two = 'Máte vážné zranění.',
    injury_msg_three = 'Máte těžké zranění.',
    injury_msg_four = 'Máte kritické zranění.',
    bleed_msg_one = 'Krvácíte.',
    bleed_msg_two = 'Silně krvácíte. Aplikujte tlak.',
    bleed_msg_three = 'Budete vykrvácet!',
    fainted_title = 'Omdléváte',
    fainted_so_high_desc = 'Omdléváte z nadměrného požití.',
    cant_jump_title = 'Nemůžete Skočit!',
    cant_jump_desc = 'Jste příliš zranění na to, abyste se pokusili skočit.',
    blackout_title = 'Ztráta Vědomí',
    blackout_desc = 'Ztratili jste vědomí kvůli zranění na %s! Okamžitě vyhledejte lékařskou pomoc!',
    treated_fully_desc = 'Byli jste léčeni a cítíte se lépe než kdy jindy!',
    treated_not_fully_desc = 'Byli jste léčeni, ale potřebujete další léčbu.',
    prescription_menu = 'Menu Předpisů',
    prescription_menu_desc = 'Přístup a správa předpisů',
    no_stretcher_detected = 'Žádný Nosítka',
    no_stretcher_detected_desc = 'Nepodařilo se detekovat aktivní nosítka!',
    cant_run = 'Nemůžete Běžet',
    cant_run_desc = 'Jste příliš zraněni na běh!',
    no_back_seat = 'Žádná Volná Sedadla',
    no_back_seat_desc = 'V této sanitce nejsou žádná volná sedadla vzadu.',
    enter_vehicle_back = 'Vstoupit do Sanitky (Zadní Část)',
    stretcher_already_deployed = 'Nosítka Již Byla Vyložena',
    stretcher_already_deployed_desc = 'Přidělená nosítka této sanitky již byla odstraněna.',
    send_stretcher_home = 'Vrátit se k Vozidlu',
    ambulance_not_found = 'Nosítka byla odstraněna, ale sanitka nebyla nalezena pro návrat!',
    bleedout = 'krvácení',
    player_injury_critical_desc = 'Hráč je v kritickém stavu kvůli zranění %s!',
    gps_active = 'GPS Aktivován',
    gps_active_desc = 'Hráč %s aktivoval své GPS',
    gps_deactive = 'GPS Deaktivován',
    gps_deactive_desc = 'Hráč %s deaktivoval své GPS',
    no_wsb = '^0[^3VAROVÁNÍ^0] bylabi_most nebyl spuštěn PO Framework a/nebo PŘED zdrojem: %s',
    spawn_blocked = 'Výjezd z Garáže Blokován',
    spawn_blocked_desc = 'Nemůžete vyjet se svým vozidlem, protože je blokován!',
    menu_remove_crutch = 'Odstranit Chodidlo',
    menu_remove_crutch_desc = 'Odebrat podpěrnou hůl pacientovi v blízkosti',
    menu_remove_chair = 'Odebrat invalidní vozík',
    menu_remove_chair_desc = 'Odebrat invalidní vozík pacientovi v blízkosti',
    toggle_stretcher = 'Vzít nosítka',
    toggle_stretcher_desc = 'Vezměte nosítka z nejbližšího vozidla',
    no_vehicle_nearby = 'Vozidlo',
    no_vehicle_nearby_desc = 'V okolí není žádné vozidlo',
    no_ambulance_nearby_desc = 'V okolí není žádná sanitka',
    on_duty = 'Na službě',
    on_duty_desc = 'Právě jste přepnuli do služby!',
    off_duty = 'Mimo službu',
    off_duty_desc = 'Právě jste přepnuli mimo službu!',
    amount = 'Množství',
    mr = 'Pan',
    mrs = 'Paní',
    debt_collection = 'Vymáhání dluhu',
    db_email =
    'Drahý %s %s, <br /><br />Centrální soudní vymáhací agentura (CJCA) naúčtovala pokuty, které jste obdrželi od policie.<br />Z vašeho účtu bylo vybráno <strong>$%s</strong>.<br /><br />S pozdravem,<br />Pan Wasabi',
    fine_sent = 'Pokuty odeslány',
    fine_sent_desc = 'Pokuty ve výši $%s byly úspěšně odeslány!',
    fine_received = 'Pokuta obdržena',
    fine_received_desc = 'Obdrželi jste pokutu ve výši $%s',
    log_killed_title = 'Hráč zabit',
    log_killed_desc =
    '> *%s [%s] zabil %s [%s]\n\n**Informace o vrahovi:**\nJméno: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**Informace o oběti:**\nJméno postavy: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **Příčina smrti:** `%s`',
    log_suicide_title = 'Hráč spáchal sebevraždu',
    log_suicide_desc =
    '> %s [%s] zabil sám sebe\n\n**Informace o hráči:**\nJméno: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **Příčina smrti:** `%s`',
    unknown = 'NEZNÁMO',
    log_admin_revive_title = 'Hráč byl administrátorem oživen',
    log_admin_revive_desc =
    '> *%s [%s] administrátor oživil %s [%s]\n\n**Informace o cíli:**\nJméno: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**Informace o administrátorovi:**\nJméno postavy: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_self_revive_title = 'Administrátor sám sebe oživil',
    log_self_revive_desc =
    '> %s [%s] sám sebe oživil\n\n**Informace o hráči:**\nJméno: `%s`\nID hráče: `%s`\nIdentifikátor: `%s`\nSteam: `%s`\nDiscord: `%s`\nLicence: `%s`\nLicence2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_death_logs = 'Záznamy o smrti',
    log_revive_logs = 'Záznamy o oživení',
    medbag_crutch = 'Podpěrná hůl',
    medbag_crutch_desc = 'Podpěrná hůl pro asistenci pacientům při chůzi',
    menu_crutch = 'Použít podpěrnou hůl',
    menu_crutch_desc = 'Přidat podpěrnou hůl pacientovi v blízkosti',
    medbag_chair = 'Invalidní vozík',
    medbag_chair_desc = 'Invalidní vozík pro asistenci pacientům, kteří nemohou chodit',
    menu_chair = 'Použít invalidní vozík',
    menu_chair_desc = 'Přidat invalidní vozík pacientovi v blízkosti',
    shot = 'střelná rána',
    stabbed = 'bodná rána',
    beat = 'úder',
    burned = 'popálenina',
    other = 'neznámé',
    JobMenuTitle = 'Menu záchranářů',
    dispatch = 'Výjezd',
    dispatch_desc = 'Zkontrolovat hráče potřebující pomoc',
    DispatchMenuTitle = 'Výjezd',
    GoBack = 'Zpět',
    key_map_text = 'Menu práce s sanitkou',
    assistance_title = 'Požadována pomoc',
    assistance_desc = 'Osoba požádala o lékařskou pomoc!',
    respawn_available_in = 'Respawn dostupný za ~r~%s minut %s sekund~s~\n',
    respawn_bleedout_in = 'Vyboulíte se za ~r~%s minut %s sekund~s~\n',
    respawn_bleedout_prompt = 'Držte [~r~E~s~] pro respawn',
    distress_send = 'Stiskněte [~r~G~s~] pro odeslání nouzového signálu záchranářům',
    distress_sent_title = 'Požadována pomoc',
    distress_sent_desc = 'Nouzový signál byl odeslán dostupným jednotkám!',
    route_set_title = 'Nastavena trasa',
    route_set_desc = 'Pro osobu v nouzi byla nastavena trasa!',
    diagnose_patient = 'Diagnóza',
    diagnose_patient_desc = 'Diagnostikovat nejbližšího zraněného člověka',
    no_requests = 'Žádné aktivní požadavky',
    revive_patient = 'Oživit',
    revive_patient_desc = 'Pokusit se oživit blízkou osobu',
    heal_patient = 'Uzdravit',
    heal_patient_desc = 'Pokusit se uzdravit blízkou osobu',
    sedate_patient = 'Sedovat',
    sedate_patient_desc = 'Dočasně uspat blízkou osobu',
    drag_patient = 'Táhnout',
    drag_patient_desc = 'Táhnout blízkou zraněnou osobu',
    place_stretcher_target = 'Přidat nebo odebrat pacienta',
    place_patient = 'Položit/do vozidla',
    place_patient_desc = 'Položit nevědomou osobu v blízkosti do/ven z vozidla',
    no_nearby = 'Nenalezeno',
    no_nearby_desc = 'Zdá se, že kolem není nikdo',
    no_injury = 'Žádné zranění',
    no_injury_desc = 'Osoba se zdá, že nepotřebuje žádnou léčbu',
    no_injury_dead_desc =
    'Pacient se zdá, že nepotřebuje další léčbu. Zkuste použít defibrilátor a doufejte v to nejlepší!',
    player_injury = 'Osoba zraněna',
    player_injury_desc = 'Tato osoba se zdá, že má zranění typu %s',
    player_not_unconcious = 'Hráč vědomý',
    player_not_unconcious_desc = 'Zdá se, že hráč je vědomý',
    player_unconcious = 'Hráč nevědomý',
    player_unconcious_desc = 'Pro tuto léčbu je potřeba, aby pacient byl vědomý!',
    player_reviving = 'Oživování',
    player_reviving_desc = 'Probíhá oživování pacienta',
    player_noitem = 'Chybějící položka',
    player_noitem_desc = 'Chybí vám potřebná položka pro toto!',
    player_successful_revive = 'Oživeno',
    player_successful_revive_reward_desc = 'Pacient byl úspěšně oživen a vydělali jste $%s!',
    player_successful_revive_desc = 'Pacient byl úspěšně oživen!',
    player_healing = 'Léčení',
    player_healing_desc = 'Probíhá léčení pacienta',
    player_successful_heal = 'Vyléčeno',
    player_successful_heal_desc = 'Pacient byl úspěšně vyléčen!',
    player_healed_desc = 'Byli jste úspěšně vyléčeni lékařem!',
    not_medic = 'Neautorizováno',
    not_medic_desc = 'Nejste vyškoleni k použití tohoto!',
    target_sedated = 'Sedováno',
    target_sedated_desc = 'Byli jste uspáni zdravotníkem',
    player_successful_sedate_desc = 'Pacient byl úspěšně uspán',
    drop_bag_ui = '[E] - Položit tašku',
    drop_stretch_ui = '[E] - Umístit nosítka',
    pickup_bag_target = 'Zvednout',
    move_target = 'Přesunout',
    interact_bag_target = 'Otevřít',
    successful = 'Úspěšné',
    medbag_pickup = 'Zvedli jste lékařskou tašku',
    medbag_pickup_civ = 'Prohledali jste tašku a vzali jste, co by mohlo být užitečné',
    stretcher_pickup = 'Poslali jste nosítka zpět do vozidla, odkud byla vyjmuta',
    medbag = 'Lékařská taška',
    medbag_tweezers = 'Pinzeta',
    medbag_tweezers_desc = 'Používá se k odstranění střel',
    medbag_suture = 'Suturační sada',
    medbag_suture_desc = 'Používá se k zašívání ran',
    medbag_icepack = 'Ledový obklad',
    medbag_icepack_desc = 'Používá se k redukci otoků',
    medbag_burncream = 'Krém proti popáleninám',
    medbag_burncream_desc = 'Používá se k léčbě popálenin',
    medbag_defib = 'Defibrilátor',
    medbag_defib_desc = 'Pro oživení pacientů',
    medbag_medikit = 'Lékařská sada',
    medbag_medikit_desc = 'Používá se k léčbě pacientů',
    medbag_sedative = 'Sedativ',
    medbag_sedative_desc = 'Používá se k uspávání pacientů',
    medbag_stretcher = 'Skládací nosítka',
    medbag_stretcher_desc = 'Používají se k přesunu pacientů',
    item_grab = 'Vytáhli jste nástroj z lékařské tašky',
    wrong_equipment = 'Nesprávné vybavení!',
    wrong_equipment_desc = 'Jste vůbec školeni?',
    player_not_injured = 'Není zraněn',
    player_not_injured_desc =
    'Tato osoba se zdá, že nepotřebuje žádnou další léčbu a je vhodná pro použití defibrilátoru',
    player_treated = 'Ošetřeno',
    player_treated_desc = 'Pacient byl úspěšně ošetřen',
    revive_command_help = 'Admin příkaz pro oživení hráčů',
    revive_command_arg = 'ID hráče',
    reviveall_command_help = 'Admin příkaz pro oživení všech hráčů',
    revivearea_command_help = 'Admin příkaz pro oživení hráčů v okolí',
    revivearea_command_arg = 'Oblast pro oživení hráčů',
    resetdeathcount_command_help = 'Admin příkaz pro resetování počtu smrtí hráče',
    resetdeathcount_command_arg = 'ID hráče',
    viewdeathcount_command_help = 'Příkaz pro zobrazení počtu vašich smrtí',
    alive_again = 'Živí',
    alive_again_desc = 'Byli jste odvezeni místním občanem do nemocnice!',
    request_supplies_target = 'Lékařské potřeby',
    currency = '$',
    not_enough_funds = 'Nedostatek finančních prostředků',
    not_enough_funds_desc = 'Nemáte dostatek finančních prostředků!',
    hospital_garage = 'Nemocniční garáž',
    used_meditkit = 'Použité medkit',
    used_medikit_desc = 'Podařilo se vám sebevyléčit',
    action_cancelled = 'Akce zrušena',
    action_cancelled_desc = 'Zrušili jste svou poslední akci!',
    healing_self_prog = 'Ošetřování ran',
    checkin_hospital = 'Úspěch',
    checkin_hospital_desc = 'Byli jste úspěšně ošetřeni personálem nemocnice',
    max_ems = 'Dostupní záchranáři',
    max_ems_desc = 'Ve městě je dostatek záchranářů! Volejte o pomoc!',
    player_busy = 'Zaneprázdněný',
    player_busy_desc = 'Momentálně jste příliš zaneprázdněni na to, abyste provedli tuto akci!',
    cloakroom = 'Šatna',
    civilian_wear = 'Civilní oblečení',
    bill_patient = 'Fakturovat pacienta',
    bill_patient_desc = 'Pošlete fakturu nedalekému pacientovi',
    invalid_entry = 'Neplatné',
    invalid_entry_desc = 'Vaše zadání bylo neplatné!',
    medical_services = 'Lékařské služby',
    hospital = 'Nemocnice',
    interact_stretcher_ui = '[E] - Interagovat',
    stretcher_menu_title = 'Interakce s nosítky',
    open_shop_ui = '[E] - Otevřít lékárnu'

}
