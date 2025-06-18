################################
# MR TECH EFFECT SCRPIT VALUES #
################################

############################################################################

# !!! Unused right now as the tech effects don't accept values sadly !!! #

### Balloonists ###

curtiss_tech_effect_small_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 1000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 250
	}
}

curtiss_tech_effect_medium_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 2000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 1000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 500
	}
}

curtiss_tech_effect_big_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 3500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 1750
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 900
	}
}

### General ###

#Small
mr_tech_effect_small_early_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 1500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 750
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 375
	}
}

mr_tech_effect_small_mid_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 3000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 1500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 750
	}
}

mr_tech_effect_small_late_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 5500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 2750
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 1375
	}
}

#Medium
mr_tech_effect_medium_early_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 3500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 750
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 375
	}
}

mr_tech_effect_medium_mid_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 5500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 1750
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 875
	}
}

mr_tech_effect_medium_late_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 9000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 4500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 2250
	}
}

#Medium
mr_tech_effect_large_early_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 6000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 3000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 1500
	}
}

mr_tech_effect_large_mid_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 9000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 4500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 2250
	}
}

mr_tech_effect_large_late_value = {
	if = {
		limit = { has_game_rule = mr_tech_normal_rule }
		value = 15000
	}
	else_if = {
		limit = { has_game_rule = mr_tech_half_rule }
		value = 7500
	}
	else_if = {
		limit = { has_game_rule = mr_tech_quarter_rule }
		value = 3750
	}
}
