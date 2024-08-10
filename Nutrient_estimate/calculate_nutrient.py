def calculate_nut(vol):
    nutrient = {"Carbohydrate": 0, "Protein": 0, "Fat": 0, "Sodium": 0}
    
    nutritional_info = {
        "bulgogi": {"Carbohydrate": 0.2, "Protein": 2.3, "Fat": 4.5, "Sodium": 300},
        "kimchi": {"Carbohydrate": 1.0, "Protein": 0.5, "Fat": 0.2, "Sodium": 600},
        "meat": {"Carbohydrate": 0.0, "Protein": 3.0, "Fat": 5.0, "Sodium": 60},
        "noodle": {"Carbohydrate": 0.7, "Protein": 0.2, "Fat": 0.5, "Sodium": 5},
        "plate": {"Carbohydrate": 0.0, "Protein": 0.0, "Fat": 0.0, "Sodium": 0},
        "potato": {"Carbohydrate": 0.2, "Protein": 0.1, "Fat": 0.0, "Sodium": 5},
        "pumpkin": {"Carbohydrate": 0.3, "Protein": 0.1, "Fat": 0.0, "Sodium": 1},
        "rice": {"Carbohydrate": 0.3, "Protein": 0.1, "Fat": 0.0, "Sodium": 1},
        "salad": {"Carbohydrate": 0.5, "Protein": 0.2, "Fat": 0.1, "Sodium": 50},
        "scramble": {"Carbohydrate": 0.5, "Protein": 2.0, "Fat": 4.0, "Sodium": 150},
        "soup": {"Carbohydrate": 0.8, "Protein": 0.5, "Fat": 1.0, "Sodium": 400},
        "tofu": {"Carbohydrate": 1.0, "Protein": 2.0, "Fat": 2.0, "Sodium": 5}
    }

    for ingredient, volume in vol.items():
        if ingredient in nutritional_info:
            nutrient_info = nutritional_info[ingredient]
            nutrient["Carbohydrate"] += nutrient_info["Carbohydrate"] * volume
            nutrient["Protein"] += nutrient_info["Protein"] * volume
            nutrient["Fat"] += nutrient_info["Fat"] * volume
            nutrient["Sodium"] += nutrient_info["Sodium"] * volume
        
    nutrient["Carbohydrate"] = int(round(nutrient["Carbohydrate"]))
    nutrient["Protein"] = int(round(nutrient["Protein"]))
    nutrient["Fat"] = int(round(nutrient["Fat"]))
    nutrient["Sodium"] = nutrient["Sodium"] / 1000
    return nutrient
    