# Zero or more outcomes. The journal entry can conclude through any of them.
# Each non-timeout outcome's `trigger` is checked; when one becomes true the JE concludes
# through that outcome and its `effect` runs. Outcomes are presented in the journal entry
# panel in the order they are declared here.
# This replaces the old complete/on_complete, fail/on_fail, invalid/on_invalid and
# timeout/on_timeout blocks - each of those is now just an outcome with the appropriate fields/flags.
# root = owning country or no scope
outcome = {
    # key for the header shown for this outcome in the journal entry panel (the "how to reach this outcome" header)
    # required for all non-hidden outcomes
    # use je_standard_completion_header/je_standard_failure_header for the standard completion/failure look, or any custom key for flavor
    header = je_standard_completion_header

    # key for the header shown above this outcome's effect description (the "what happens" header)
    # required for all non-hidden outcomes
    # use je_standard_on_completion_header/je_standard_on_failure_header for the standard on completion/failure look, or any custom key for flavor
    effect_header = je_standard_on_completion_header

    # key for the flavor text shown once the journal entry has concluded through this outcome
    # required for all outcomes
    conclusion_desc = journal_entry_key_completed_desc

    # optional color used to tint this outcome's header in the panel
    # gold_positive is the standard positive/completion color, blue_negative the standard negative/failure color
    color = "gold_positive"

    # outcome flags, any combination of:
    #   hidden          - the outcome is not shown in the journal entry panel (use for silent conclusions)
    #   timeout         - this outcome is used when the JE times out (see the JE-level `timeout` below).
    #                     a timeout outcome has no `trigger`. At most one timeout outcome is allowed
    #   invalid_outcome - concluding through this outcome silently invalidates the JE. Must also be `hidden`.
    #                     At most one invalid outcome is allowed
    #   fails_subgoal   - concluding through this outcome should also fail the tracked subgoal
    #   historical      - this outcome is the one that happened historically. It is marked as such in the
    #                     journal entry panel and on the concluded entry, and may have an associated web link registered in code
    flags = {}

    # trigger which, when true, concludes the journal entry through this outcome
    # required for every non-timeout outcome
    # root = owning country or no scope
    trigger = {}

    # effect which is executed when this outcome's `trigger` becomes true
    # root = owning country or no scope
    effect = {}

    # effect fired individually for each involved country in a contextless JE
    # only valid in contextless journal entries
    # root = specific country
    effect_all_involved = {}

    # dynamically updated text describing potential event outcomes for this conclusion
    # multiple such entries can be added to an outcome
    # root = owning country or no scope
    event_outcome_desc = {}

    # alternative to event_outcome_desc using the effect system to automatically generate tooltips
    # note that the effects here are only used for description purposes and will not actually happen
    # root = owning country or no scope
    event_outcome_effect_desc = {}
}

	#Completion
	outcome = {
		header = je_standard_completion_header
		effect_header = je_standard_on_completion_header
		conclusion_desc = je_standard_completion_conclusion_desc
		color = "gold_positive"

		trigger = {

		}

		effect = {

		}
	}

	#Invalid
	outcome = {
		flags = { hidden invalid_outcome }
		conclusion_desc = je_standard_failure_conclusion_desc
		trigger = {

		}

        effect = {

        }
	}

	#Failure
	outcome = {
		header = je_standard_failure_header
		effect_header = je_standard_on_failure_header
		conclusion_desc = je_standard_failure_conclusion_desc
		color = "blue_negative"

		trigger = {

		}

        effect = {

        }
	}