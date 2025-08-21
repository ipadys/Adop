
	local getData = require(game.ReplicatedStorage.ClientModules.Core.ClientData).get_data
	local petDatabase = require(game.ReplicatedStorage.ClientDB.Inventory.InventoryDB).pets

	local highTierPets = {
		"ugc_refresh_2023_african_wild_dog",
		"albino_monkey",
		"arctic_reindeer",
		"summerfest_2024_balloon_unicorn",
		"bat_dragon",
		"lures_2023_blazing_lion",
		"blue_dog",
		"easter_2024_candyfloss_chick",
		"farm_2023_caterpillar",
		"winter_2023_chocolate_chip_bat_dragon",
		"cow",
		"crow",
		"santa_dog",
		"sanctuary_2022_diamond_premium_butterfly",
		"elephant",
		"evil_unicorn",
		"winter_2024_fairy_bat_dragon",
		"flamingo",
		"frost_dragon",
		"ice_dimension_2025_frostbite_bear",
		"giraffe",
		"pride_2022_goat",
		"springfest_2023_hare",
		"elf_hedgehog",
		"ugc_refresh_2024_honey_badger",
		"summerfest_2023_hotdog_dog",
		"ugc_refresh_2024_jellyfish",
		"kangaroo",
		"lion",
		"ugc_refresh_2023_lion_cub",
		"summerfest_2023_mackerel_shoal",
		"summerfest_2024_minipig",
		"scottish_2023_nessie",
		"butterfly_2025_orchid_butterfly",
		"owl",
		"parrot",
		"winter_2023_peppermint_penguin",
		"random_pets_sept_2023_pelican",
		"pink_cat",
		"winter_2022_ram",
		"rhino",
		"shadow_dragon",
		"summerfest_2023_shark_doggo",
		"meme_2023_sheeeeep",
		"winter_2022_strawberry_shortcake_bat_dragon",
		"turtle",
		"lny_2023_qiongchi",
		"yeti",
		"zombie_buffalo",
	}

	addPet = function(id, properties, X, Xnumber, Stack)
		local function createPet()
			local ageN = 1
			if Stack then
				ageN = math.random(1, 999999)
			end
			local uniquess = "Ctepa_iPad_" .. math.random(1,999999)
			local pet = {
				unique = uniquess,
				category = "pets",
				id = id,
				properties = {
					pet_trick_level = 0,
					rideable = properties.R,
					flyable = properties.F,
					mega_neon = properties.M,
					neon = properties.N,
					friendship_level = 0,
					age = ageN,
					ailments_completed = 0
				},
				kind = id,
				rarity = petDatabase.rarity,
				newness_order = 54
			}
			local inventory = getData()[game.Players.LocalPlayer.Name].inventory
			inventory.pets[pet.unique] = pet
		end

		if X then
			for i = 1, Xnumber do
				createPet()
			end
		else
			createPet()
		end
	end
	for Indexs = 1, 2 do 
		for _, petId in ipairs(highTierPets) do
			addPet(petId, { 
				R = math.random(0, 1) == 1, 
				F = math.random(0, 1) == 1, 
				M = math.random(0, 1) == 1, 
				N = math.random(0, 1) == 1 
			}, false, math.random(1, 2), true)
		end    
	end
