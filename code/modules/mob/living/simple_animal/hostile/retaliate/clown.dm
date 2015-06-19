/mob/living/simple_animal/hostile/retaliate/clown
	name = "Clown"
	desc = "A denizen of clown planet"
	icon_state = "clown"
	icon_living = "clown"
	icon_dead = "clown_dead"
	icon_gib = "clown_gib"
	speak_chance = 0
	turns_per_move = 5
	response_help = "hugs"
	response_disarm = "gently pushes aside"
	response_harm = "whacks"
	speak = list("HONK", "Honk!", "Henk Henk!", "Honk?")
	emote_see = list("honks")
	speak_chance = 1
	a_intent = "harm"
	maxHealth = 100 // Why was it at 75 before?
	health = 100
	speed = 0
	harm_intent_damage = 5 // this was at 8 before, the regular is usually 5, why do you hate clowns?
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "attacks"
	attack_sound = 'sound/items/bikehorn.ogg'
	environment_smash = 0

	var/corpse = /obj/effect/landmark/mobcorpse/clown

	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 270
	maxbodytemp = 370
	unsuitable_atmos_damage = 10

/mob/living/simple_animal/hostile/retaliate/clown/handle_temperature_damage()
	if(bodytemperature < minbodytemp)
		adjustBruteLoss(10)
	else if(bodytemperature > maxbodytemp)
		adjustBruteLoss(15)

/mob/living/simple_animal/hostile/retaliate/clown/death(gibbed)
	..(gibbed)
	if(corpse)
		new corpse (src.loc)
	qdel(src)
	return