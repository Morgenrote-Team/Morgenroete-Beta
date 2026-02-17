###########################
# BALLONING SCRPIT VALUES #
###########################

############################################################################

###########################
# Ballooning Tradition
# Sabby
###########################

curtiss_balloonist_experience_set_up_value = {
	#Ballooning Tradition: 1 Reputation per 100 tradition up to a total of 100 reputation
	if = {
		limit = {
			owner.var:curtiss_ballooning_tradition > 99
		}
		add = 100
	}
	else = {
		value = owner.var:curtiss_ballooning_tradition
	}
}


#This value calculates the next yearly gain/loss ballooning tradition
curtiss_ballooning_tradition = {
	value = 0

	### Achievements ###
	if = {
		limit = {
			owner = {
				OR = {
					has_modifier = curtiss_balloon_distance_record_modifier
					has_modifier = curtiss_balloon_altitude_record_modifier
					has_modifier = curtiss_balloon_time_record_modifier
				}
			}
		}
		add = 1
	}
	if = {
		limit = {
			owner = {
				OR = {
					has_variable = curtiss_balloon_sophie_blanchard_legacy				
					has_variable = curtiss_balloon_alpine_crossing
					has_variable = curtiss_balloon_mediterranean_crossing
				}
			}
		}
		add = 1
	}
	### Technology ###
	if = {
		limit = { has_technology_researched = curtiss_reconnaissance_balloon_tech }
		add = 2
	}
	### Funding ###
	if = {
		limit = { has_variable = curtiss_ballooning_club_subsidies }
		add = 5
	}
	### Balloonist ###
	if = {
		limit = {
			has_variable = curtiss_balloonist_var
		}
		add = {
			value = var:curtiss_balloonist_var.var:curtiss_balloonist_experience_var
			divide = 50
			floor = yes
			max = 10
		}
	}
	### Yearly Decay ###
#	change_variable = {
#		name = curtiss_ballooning_tradition
#		add = -3 
#	}
}


