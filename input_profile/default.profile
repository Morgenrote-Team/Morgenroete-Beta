version=1

input_context={
	name="common"

	input_action = {
		name = "pause"
		text = "SETTING_INPUT_ACTION_PAUSE"
		scancode = 44			# Space
		mouse_button = MOUSE_X2	# Mouse 5 AKA forward
	}

	input_action = {
		name = "increase_speed"
		text = "SETTING_INPUT_ACTION_INCREASE_SPEED"
		scancode = 46	# Equals (=)
		scancode = 87	# Keypad +
	}

	input_action = {
		name = "decrease_speed"
		text = "SETTING_INPUT_ACTION_DECREASE_SPEED"
		scancode = 45	# Minus (-)
		scancode = 86	# Keypad -
	}

	input_action = {
		name = "speed_1"
		text = "SETTING_INPUT_ACTION_SPEED_ONE"
		scancode = 30	# 1
		scancode = 89	# Keypad 1
	}

	input_action = {
		name = "speed_2"
		text = "SETTING_INPUT_ACTION_SPEED_TWO"
		scancode = 31	# 2
		scancode = 90	# Keypad 2
	}

	input_action = {
		name = "speed_3"
		text = "SETTING_INPUT_ACTION_SPEED_THREE"
		scancode = 32	# 3
		scancode = 91	# Keypad 3
	}

	input_action = {
		name = "speed_4"
		text = "SETTING_INPUT_ACTION_SPEED_FOUR"
		scancode = 33	# 4
		scancode = 92	# Keypad 4
	}

	input_action = {
		name = "speed_5"
		text = "SETTING_INPUT_ACTION_SPEED_FIVE"
		scancode = 34	# 5
		scancode = 93	# Keypad 5
	}

	input_action = {
		name = "music_play_pause"
		text = "SETTING_INPUT_ACTION_PLAY_PAUSE_MUSIC"
		scancode = 96	# Keypad 8
		scancode = 261	# PLAY/PAUSE
	}

	input_action = {
		name = "music_next_track"
		text = "SETTING_INPUT_ACTION_NEXT_MUSIC_TRACK"
		scancode = 97	# Keypad 9
		scancode = 258	# AUDIONEXT
	}

	input_action = {
		name = "camera_up"
		text = "SETTING_INPUT_ACTION_CAMERA_UP"
		scancode = 26	# W
		scancode = 82	# Arrow Up
	}

	input_action = {
		name = "camera_left"
		text = "SETTING_INPUT_ACTION_CAMERA_LEFT"
		scancode = 4	# A
		scancode = 80	# Arrow Left
	}

	input_action = {
		name = "camera_down"
		text = "SETTING_INPUT_ACTION_CAMERA_DOWN"
		scancode = 22	# S
		scancode = 81	# Arrow Down
	}

	input_action = {
		name = "camera_right"
		text = "SETTING_INPUT_ACTION_CAMERA_RIGHT"
		scancode = 7	# D
		scancode = 79	# Arrow Right
	}
	
	input_action = {
		name = "open_politics"
		text = "SETTING_INPUT_ACTION_OPEN_POLITICS"
		scancode = 58	# F1
	}

	input_action = {
		name = "open_budget"
		text = "SETTING_INPUT_ACTION_OPEN_BUDGET"
		scancode = 59	# F2
	}

	input_action = {
		name = "open_buildings"
		text = "SETTING_INPUT_ACTION_OPEN_BUILDINGS"
		scancode = 60	# F3
	}

	input_action = {
		name = "open_market"
		text = "SETTING_INPUT_ACTION_OPEN_MARKET"
		scancode = 61	# F4
	}

	input_action = {
		name = "open_military"
		text = "SETTING_INPUT_ACTION_OPEN_MILITARY"
		scancode = 62	# F5
	}

	input_action = {
		name = "open_power_bloc"
		text = "SETTING_INPUT_ACTION_OPEN_POWER_BLOC"

		scancode = 63	# F6
	}

	input_action = {
		name = "open_diplomatic"
		text = "SETTING_INPUT_ACTION_OPEN_DIPLOMATIC"
		scancode = 64	# F7
	}

	input_action = {
		name = "open_technology"
		text = "SETTING_INPUT_ACTION_OPEN_TECHNOLOGY"
		scancode = 65	# F8
	}

	input_action = {
		name = "open_society"
		text = "SETTING_INPUT_ACTION_OPEN_SOCIETY"
		scancode = 66	# F9
	}

	input_action = {
		name = "open_population"
		text = "SETTING_INPUT_ACTION_OPEN_POPULATION"
		scancode = 67	# F10
		
	}

	input_action = {
		name = "open_journal"
		text = "SETTING_INPUT_ACTION_OPEN_JOURNAL"
		scancode = 13	# J
	}

	input_action = {
		name = "open_companies"
		text = "SETTING_INPUT_ACTION_OPEN_COMPANIES"
		binding = {	# shift+F1
			scancode = 58
			modifier = shift
		}
		
	}

	input_action = {
		name = "location_finder"
		text = "SETTING_INPUT_ACTION_LOCATION_FINDER"
		scancode = 9	# F
	}

	input_action = {
		name = "map_list"
		text = "SETTING_INPUT_ACTION_MAP_LIST"
		scancode = 20	# Q
	}

	input_action = {
		name = "tab_1"
		text = "SETTING_INPUT_ACTION_TAB_1"
		binding = {	# shift+1"
			scancode = 30
			modifier = shift
		}
	}

	input_action = {
		name = "tab_2"
		text = "SETTING_INPUT_ACTION_TAB_2"
		binding = {	# shift+2"
			scancode = 31
			modifier = shift
		}
	}

	input_action = {
		name = "tab_3"
		text = "SETTING_INPUT_ACTION_TAB_3"
		binding = {	# shift+3"
			scancode = 32
			modifier = shift
		}
	}

	input_action = {
		name = "tab_4"
		text = "SETTING_INPUT_ACTION_TAB_4"
		binding = {	# shift+4"
			scancode = 33
			modifier = shift
		}
	}

	input_action = {
		name = "tab_5"
		text = "SETTING_INPUT_ACTION_TAB_5"
		binding = {	# shift+5"
			scancode = 34
			modifier = shift
		}
	}

	input_action = {
		name = "production_lens"
		text = "SETTING_INPUT_ACTION_PRODUCTION_LENS"
		binding = {	# alt+1"
			scancode = 30
			modifier = alt
		}
	}

	input_action = {
		name = "political_lens"
		text = "SETTING_INPUT_ACTION_POLITICAL_LENS"
		binding = {	# alt+2"
			scancode = 31
			modifier = alt
		}
	}

	input_action = {
		name = "diplomatic_lens"
		text = "SETTING_INPUT_ACTION_DIPLOMATIC_LENS"
		binding = {	# alt+3"
			scancode = 32
			modifier = alt
		}
	}

	input_action = {
		name = "military_lens"
		text = "SETTING_INPUT_ACTION_MILITARY_LENS"
		binding = {	# alt+4"
			scancode = 33
			modifier = alt
		}
	}

	input_action = {
		name = "trade_lens"
		text = "SETTING_INPUT_ACTION_TRADE_LENS"
		binding = {	# alt+5"
			scancode = 34
			modifier = alt
		}
	}

	input_action = { 
		name = "outliner_toggle_pinned"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_PINNED"
		binding = {
			scancode = 30
			modifier = ctrl
		}
	}

	input_action = { 
		name = "outliner_toggle_economy"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_ECONOMY"
		binding = {
			scancode = 31
			modifier = ctrl
		}
	}

	input_action = { 
		name = "outliner_toggle_politics"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_POLITICS"
		binding = {
			scancode = 32
			modifier = ctrl
		}
	}

	input_action = { 
		name = "outliner_toggle_diplomacy"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_DIPLOMACY"
		binding = {
			scancode = 33
			modifier = ctrl
		}
	}

	input_action = { 
		name = "outliner_toggle_military"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_MILITARY"
		binding = {
			scancode = 34
			modifier = ctrl
		}
	}

	input_action = { 
		name = "outliner_toggle_all"
		text = "SETTING_INPUT_ACTION_OUTLINER_TOGGLE_ALL"
		binding = {
			scancode = 35
			modifier = ctrl
		}
	}

	input_action = {
		name = "construction_queue"
		text = "SETTING_INPUT_ACTION_CONSTRUCTION_QUEUE"
		scancode = 5 			# B
	}

	input_action = {
		name = "toggle_construction_queue_pause"
		text = "SETTING_INPUT_ACTION_TOGGLE_CONSTRUCTION_QUEUE_PAUSE"
		binding = {	# ctrl+B
			scancode = 5
			modifier = ctrl
		}
	}

	input_action = {
		name = "back"
		text = "SETTING_INPUT_ACTION_BACK"
		mouse_button = MOUSE_X1	# mb4
	}

	input_action = {
		name = "confirm"
		text = "SETTING_INPUT_ACTION_CONFIRM"
		scancode = 6 			# C
	}

	input_action = {
		name = "current_situation"
		text = "SETTING_INPUT_ACTION_CURRENT_SITUATION"
		scancode = 8 			# E
	}

	input_action = {
		name = "go_to_details"
		text = "SETTING_INPUT_ACTION_GO_TO_DETAILS"
		scancode = 10 			# G
	}

	input_action = { 
		name = "toggle_pin"
		text = "SETTING_INPUT_ACTION_TOGGLE_PIN"
		binding = {
			scancode = 27	# X
		}
	}

	input_action = { 
		name = "zoom_to"
		text = "SETTING_INPUT_ACTION_ZOOM_TO"
		binding = {
			scancode = 29 	# Z
		}
	}

	input_action = {
		name = "scroll_up"
		text = "SETTING_INPUT_ACTION_SCROLL_UP"
		scancode = 75 			# Page Up
	}

	input_action = {
		name = "scroll_down"
		text = "SETTING_INPUT_ACTION_SCROLL_DOWN"
		scancode = 78 			# Page Down
	}

	input_action = {
		name = "toggle_gui_debug"
		text = "SETTING_INPUT_ACTION_TOGGLE_GUI_DEBUG"
		scancode = 18 			# O
	}
	
	###MOD ADDED###

	#Choose an unused keybind and add "input_action = "input_m" " or similar to your GUI.
	#Put the localization of it into the replace folder localization/*language*/replace

	input_action = {
		name = "input_h"
		text = "SETTING_INPUT_ACTION_H"
		scancode = 11			# H
	}

	input_action = {
		name = "input_i"
		text = "SETTING_INPUT_ACTION_I"
		scancode = 12			# I
	}

	input_action = {
		name = "input_k"
		text = "SETTING_INPUT_ACTION_K"
		scancode = 14			# K
	}

	input_action = {
		name = "input_l"
		text = "SETTING_INPUT_ACTION_L"
		scancode = 15			# L
	}

	input_action = {
		name = "input_m"
		text = "SETTING_INPUT_ACTION_M" #Reserved for Morgenröte
		scancode = 16			# M
	}
	
	input_action = {
		name = "input_n"
		text = "SETTING_INPUT_ACTION_N"
		scancode = 17			# N
	}

	input_action = {
		name = "input_p"
		text = "SETTING_INPUT_ACTION_P"
		scancode = 19			# P
	}

	input_action = {
		name = "input_r"
		text = "SETTING_INPUT_ACTION_R"
		scancode = 21			# R
	}

	input_action = {
		name = "input_t"
		text = "SETTING_INPUT_ACTION_T"
		scancode = 23			# T
	}

	input_action = {
		name = "input_u"
		text = "SETTING_INPUT_ACTION_U"
		scancode = 24			# U
	}

	input_action = {
		name = "input_v"
		text = "SETTING_INPUT_ACTION_V"
		scancode = 25			# V
	}

	input_action = {
		name = "input_y"
		text = "SETTING_INPUT_ACTION_Y"
		scancode = 28			# Y
	}
}
