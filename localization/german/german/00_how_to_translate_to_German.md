### By Lord R ###

This File gives you an overview on how to translate (or improve) the German Translation.

# ID
To start, there is always an id. The id looks like this usually "lepsius_something:".
Don't change anything about the id. It is necessary for Vicky 3 to find
the right localizations.

# Sie oder Du
We use the Sie form except where it obviously doesn't make sense at all.

# Marking localizations you already checked
Please mark every id you have changed or checked with a numeral after the ":" like this id:1 "Blablabla" .
That way every translator knows which files are already set up. 

# String
The id is followed by a string. The String usually looks like this "Something something somethin".
As you might have noted, everything in the " belongs to the string.
The Strings are your workspace.

# Brackets
There are some special things in those Strings that might confuse you.
[ ] mark parts that get replaced with something else by the game, e.g. a character.
You usually don't have to care about them. One exception:
Concepts can be renamed by you by creating a new string with an id. E.g. like this:
akademischen_mission: "Akademischen Mission"
[Concept('concept_academics_academic_mission','$akademischen_mission$')]
Now the game will display "Akademischen Mission" instead of "Akademische Mission".
Note that the everything in [] is case sensitive. So Concept has to be written exactly that case, otherwise
our example will show an error.

# Custom Localizations
Another use case of [] are the Casus Endings. If they depend on a character, you can use them to give you the right ending.
E.g. [ROOT.GetCountry.GetRuler.GetCustom('DE_ART_DEF_S_A')] [ROOT.GetCountry.GetRuler.GetPrimaryRoleTitle] would display
die Presidentin if you had a female president and den König if you had a male king.
Usually there is already a use of the title or character name there and you can just add GetCustom(' ').
I will add the official list of all the articles and endings at the end. just put those inside the brackets like this: ('here')
If you need new custom locs you can ask Lord R to make some (e.g. for die Archäologin, der Archäologe).

# Using a string from somewhere else in a string
Imagine you want to reference a specific Technology like elgar_classicism_tech.
Instead of searching for the name of said technology, you can get the exact name like this:
$elgar_classicism_tech$

This works for every localization. So you can use it for buildings, production methods, names, etc.

# Comments
You can add Comments with a hastag #, outside of the " like this "My String" #I noticed bla.
Comments will not show up in the game and are a way for us to communicate.

# Texticons
Things like @verrier_astronomicalobjects! are Texticons (the small pictures next to Astronomical Objects e.g.).
You can ignore them.

# Formatting
You can change the layout of the text with stuff like #p My Text#! which results in a positive (green) Text.
You can use something similar for the custom localizations if you add |U at the very end for example,
the first letter will be a capital letter. E.g.: [ROOT.GetCountry.GetRuler.GetCustom('DE_ART_DEF_S_A')|U].
For more different formatting look at this google sheet: https://docs.google.com/spreadsheets/d/1UDvof0bn4fuD5mcedk2VT5krUBpzLZiM64hL1WZFB3M/edit?usp=sharing

# List of relevant Custom Localizations
Note: All the custom locs below were created by Paradox. Paradox might change them, so check xxx\Victoria 3\game\common\customizable_localization\99_de_custom_loc.txt to see if it still works.

### GERMAN CUSTOM LOCALISATION
### By t-recs studios and Christiansen & Plischke

###################################
## ARTICLES #######################
###################################

## Articles, Definite, Plural, 

# DE_ART_DEF_P_A || male: die // female: die
# DE_ART_DEF_P_D || male: der // female: der
# DE_ART_DEF_P_G || male: den // female: den
# DE_ART_DEF_P_N || male: die // female: die

## Articles, Definite, Singular, 

# DE_ART_DEF_S_A || male: den // female: die
# DE_ART_DEF_S_D || male: dem // female: der
# DE_ART_DEF_S_G || male: des // female: der
# DE_ART_DEF_S_N || male: der // female: die

## Articles, Indefinite, Singular, 

# DE_ART_IND_A || male: einen // female: einer
# DE_ART_IND_D || male: einem // female: einer
# DE_ART_IND_G || male: eines // female: einer
# DE_ART_IND_N || male: ein // female: eine


###################################
## ENDINGS-ADJECTIVES #############
###################################


## Endings-Adjectives, Definite, Plural, 

# DE_END_ADJ_DEF_P_A || male: en // female: en
# DE_END_ADJ_DEF_P_D || male: en // female: en
# DE_END_ADJ_DEF_P_G || male: en // female: en
# DE_END_ADJ_DEF_P_N || male: en // female: en

## Endings-Adjectives, Definite, Singular, 

# DE_END_ADJ_DEF_S_A || male: en // female: e
# DE_END_ADJ_DEF_S_D || male: en // female: en
# DE_END_ADJ_DEF_S_G || male: en // female: en
# DE_END_ADJ_DEF_S_N || male: e // female: e

## Endings-Adjectives, Indefinite, Plural, 

# DE_END_ADJ_IND_P_A || male: en // female: en
# DE_END_ADJ_IND_P_D || male: en // female: en
# DE_END_ADJ_IND_P_G || male: en // female: en
# DE_END_ADJ_IND_P_N || male: en // female: en

## Endings-Adjectives, Indefinite, Singular, 

# DE_END_ADJ_IND_S_A || male: en // female: e
# DE_END_ADJ_IND_S_D || male: en // female: en
# DE_END_ADJ_IND_S_G || male: en // female: en
# DE_END_ADJ_IND_S_N || male: er // female: e

## Endings-Adjectives, Null, Plural, 

# DE_END_ADJ_NUL_P_A || male: e // female: e
# DE_END_ADJ_NUL_P_D || male: en // female: en
# DE_END_ADJ_NUL_P_G || male: er // female: er
# DE_END_ADJ_NUL_P_N || male: e // female: e

## Endings-Adjectives, Null, Singular, 

# DE_END_ADJ_NUL_S_A || male: en // female: e
# DE_END_ADJ_NUL_S_D || male: em // female: er
# DE_END_ADJ_NUL_S_G || male: en // female: er
# DE_END_ADJ_NUL_S_N || male: er // female: e


###################################
## ENDINGS-NOUNS ##################
###################################


## Endings-Nouns, , Singular, 

# DE_END_NOU_S_G || female: "" // male: s

## Endings-Nouns, , Singular, Gender-Suffix

# DE_END_NOU_S_GS_N || female: in // male: ""


###################################
## ENDINGS-PRONOUNS ###############
###################################


## Endings-Pronouns, , Plural, 

# DE_END_PRO_P_A || male: e // female: e
# DE_END_PRO_P_D || male: en // female: en
# DE_END_PRO_P_G || male: er // female: er
# DE_END_PRO_P_N || male: e // female: e

## Endings-Pronouns, , Singular, 

# DE_END_PRO_S_A || male: en // female: e
# DE_END_PRO_S_D || male: em // female: er
# DE_END_PRO_S_G || male: es // female: er
# DE_END_PRO_S_N || male: "" // female: e


###################################
## PRONOUNS #######################
###################################


## Pronouns, Demostrative, , 

# DE_PRO_DEM || male: dies // female: dies

## Pronouns, Personal, Plural, 3rd Person

# DE_PRO_PER_P_3P_A || male: sie // female: sie
# DE_PRO_PER_P_3P_D || male: ihnen // female: ihnen
# DE_PRO_PER_P_3P_G || male: ihrer // female: ihrer
# DE_PRO_PER_P_3P_N || male: sie // female: sie

## Pronouns, Personal, Singular, 3rd Person

# DE_PRO_PER_S_3P_A || male: ihn // female: sie
# DE_PRO_PER_S_3P_D || male: ihm // female: ihr
# DE_PRO_PER_S_3P_G || male: seiner // female: ihrer
# DE_PRO_PER_S_3P_N || male: er // female: sie

## Pronouns, Possesive, Plural, 1st Person

# DE_PRO_POS_P_1P || male: unser // female: unser

## Pronouns, Possesive, Plural, 2nd Person

# DE_PRO_POS_P_2P || male: eur // female: eur
# DE_PRO_POS_P_2P_N || male: euer // female: eure

## Pronouns, Possesive, Plural, 3rd Person

# DE_PRO_POS_P_3P || female: ihr // male: ihr

## Pronouns, Possesive, Singular, 1st Person

# DE_PRO_POS_S_1P || male: mein // female: mein

## Pronouns, Possesive, Singular, 2nd Person

# DE_PRO_POS_S_2P || male: dein // female: dein

## Pronouns, Possesive, Singular, 3rd Person

# DE_PRO_POS_S_3P || female: ihr // male: sein

###################################
## COUNTRIES ######################
###################################

You can use .GetAltName('DAT') to get a country in Dativ.

You can also replace DAT with other ids to get other forms. Here is an overview:
- NOM --> Nominativ
- GEN --> Genitiv
- DAT --> Dativ
- AKK --> Akkusativ
- VON --> von xyz (or matching variant for country)
- IN --> in xyz (or matching variant for country)
- NACH --> nach xyz (or matching variant for country)

