my_bar = {
    name = my_bar_name
    desc = my_bar_left_text
    second_desc = my_bar_right_text

    start_value = 0
    min_value = -40
    max_value = 40                         # min/max can now be script values

    progress_texture = "gfx/interface/progressbars/progressbar_gold.dds"      # filled part
    background_texture = "gfx/interface/progressbars/progressbar_bad.dds"     # unfilled part
    glow_texture = "..."
    glow_line_texture = "..."
    color = { 1 1 1 1 }                    # tint applied to the whole bar

    marker = yes                           # a sliding marker, for "tug of war" bars
    left_icon = "gfx/.../left.dds"         # icons at the ends of the bar (journal entry panel only)
    right_icon = "gfx/.../right.dds"

    monthly_progress = {
        progress_condition = {
            limit = { ... }
            add = { desc = my_bar_reason_desc value = 2 }
        }
    }
}