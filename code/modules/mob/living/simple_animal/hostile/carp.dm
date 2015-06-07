/mob/living/simple_animal/hostile/carp
	name = "space carp"
	desc = "A ferocious, fang-bearing creature that resembles a fish."
	icon_state = "carp"
	icon_living = "carp"
	icon_dead = "carp_dead"
	icon_gib = "carp_gib"
	speak_chance = 0
	turns_per_move = 5
	butcher_results = list(/obj/item/weapon/reagent_containers/food/snacks/carpmeat = 3)
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "flails at"
	speed = 0
	maxHealth = 30
	health = 30

	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	speak_emote = list("gnashes")

	//Space carp aren't affected by cold.
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("carp")
	flying = 1

/mob/living/simple_animal/hostile/carp/Process_Spacemove(var/movement_dir = 0)
	return 1	//No drifting in space for space carp!	//original comments do not steal


/mob/living/simple_animal/hostile/carp/AttackingTarget()
	..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.adjustStaminaLoss(8)

/mob/living/simple_animal/hostile/carp/holocarp
	icon_state = "holocarp"
	icon_living = "holocarp"
	maxbodytemp = INFINITY

/mob/living/simple_animal/hostile/carp/holocarp/death()
	..(1)
	ghostize()
	qdel(src)
	return

/mob/living/simple_animal/hostile/carp/megacarp
	icon = 'icons/mob/alienqueen.dmi'
	name = "Mega Space Carp"
	desc = "A ferocious, fang bearing creature that resembles a shark. This one seems especially ticked off."
	icon_state = "megacarp"
	icon_living = "megacarp"
	icon_dead = "megacarp_dead"
	icon_gib = "megacarp_gib"
	maxHealth = 75
	health = 75
	pixel_x = -16
	mob_size = MOB_SIZE_LARGE
	speak_emote = list("GNASHES ANGRILY")

	melee_damage_lower = 16
	melee_damage_upper = 16
