-- ============================================
-- Состояние бота LesoРуб
-- Переменные состояния и динамические данные
-- ============================================

local state = {
    -- Переменные состояния
    need_find_telega = false,
    need_find_telega_time = 0,
    has_telega = false,
    pickup_telega_pos = nil,
    next_telega_pos = nil,
    pickup_telega_skip_check = false,
    my_tree_cut = false,
    saved_tree_points = nil,
    saved_tree_point_idx = 1,
    pre_pickup_telega_done = false,

    -- Текущие точки дерева
    current_tree_points = {},
    current_tree_point_idx = 1,

    -- Состояние мини-игры
    minigame_running = false,
    minigame_done_time = 0,
    partner_name = nil,
    partner_absent = false,
    waiting_for_my_turn = false,
    my_turn_ready = false,

    -- Координаты движения
    last_pos_x = 0,
    last_pos_y = 0,
    last_pos_z = 0,
    last_check_time = 0,
    stuck_ticks = 0,
    last_stuck_action_time = 0,
    last_cam_time = 0,
    last_jump = 0,

    -- Камера
    current_cam_angle = 0.0,

    -- NavMesh
    nav = nil,
    nav_current_path = nil,
    nav_path_index = 1,
    nav_target_x = nil,
    nav_target_y = nil,
    nav_target_z = nil,
    nav_path_building = false,
    nav_segment_size = 15.0,
    nav_extend_dist = 10.0,
    nav_full_path = {},
    nav_full_idx = 1,
    nav_last_built_x = nil,
    nav_scan_target_angle = nil,
    nav_detour_angle = 0.0,
    nav_detour_step = 30.0,
    nav_detour_fails = 0,
    set_wait_alt = 0,

    -- Обход
    avoidPoint = nil,
    currentObstacle = nil,
    stuckTimer = 0,
    lastPosition = nil,

    -- Обход дерева
    tree_avoid_circle_points = {},
    tree_avoid_circle_index = 1,
    tree_circle_radius = 5.0,
    tree_circle_direction = 1,

    -- Очередь задач
    taskQueue = {},
    workerRunning = false,
    isProcessingTurn = false,
    autoEnabled = true,

    -- Мини-игра
    currentStart = 0,
    currentWidth = 0,
    currentSpeed = 0,
    currentStage = 0,

    -- Разное
    walking = false,
    chat_replied = false,
    sawmill_hidden = false,
    last_fix_zabor_id = 1,
    bot_state = "IDLE",
    state_entered = {},
    sdacha_wp_index = 1,
    sdacha_index_fixed = nil,
    wps_fixed = nil,
    last_debug_time = 0,
    last_debug_time_final = 0,
    close_spin = 0.0,
    _scroll_offset = 0,
    _tgk_blink_t = 0,
    _last_selected_tab = nil,
    _recent_tabs = {},
    btn_animation_start = nil,
    warn = false,
    warn2 = false,
    active = false,
    lastBeerTime = 0,
    gradient_offset = 0,
    menu_open_time = nil,
    menu_anim_duration = 0.45,
    token = "",
    chat_id = "",
    updateid = nil,
    alert_audio = nil,
    telega_particles = nil,
    avatar_texture = nil,
    avatar_path_cached = "",
    turn_state = { dir=0, intensity=0.0, untilTime=0.0, lastChange=0.0 },
    elements = {
        radar = {
            pos = {x = 187, y = 553},
            set_pos = false,
            set_pos_offset = {x = 0, y = 0},
            draw_points = {}
        },
        custom = {
            toggle_button = {},
            slider_custom = {}
        },
        minimal_menu_btn = {
            hover = false,
            expanded = false,
            expanded_anim = 0,
            left_hover = false,
            right_hover = false,
            texture = nil,
            texture_loaded = false
        }
    },
    -- Флаги для ловли клавиш
    waiting_for_menu_key = false,
    waiting_for_bot_key = false,
    waiting_for_combo_key1 = false,
    waiting_for_combo_key2 = false,
    changepos = false,
    cumshot = false,
    turnleft = false,
    turnright = false,
    piska = false,
    zalupa = false,
    last_message_ids = {},

    -- Константы для проверки застревания
    CHECK_INTERVAL = 0.9,
    MIN_MOVE_DIST = 0.35,
    STUCK_THRESHOLD = 4,
    STUCK_ACTION_COOLDOWN = 2.5,

    -- NavMesh параметры
    nav_segment_size_def = 15.0,
    nav_extend_dist_def = 10.0,
    nav_detour_step_def = 30.0,

    -- Переменные для UI
    content_display_tab = nil,
    content_target_tab = nil,
    content_anim = 1.0,
    content_slide_offset = 0.0,
    content_panel_alpha_multiplier = 1.0,
    selected_tab = u8("\xC3\xEB\xE0\xE2\xED\xE0\xFF"),
    menu_anim_duration_def = 0.45,
    object_popup_open = nil,
    hwin = nil,
}

return state