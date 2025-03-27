
#pip install military-symbol
import os

import military_symbol

if __name__ == '__main__':
    path = '../assets/images/orbat_icons/unit_types/'

    unit_types = [
        "Combined Arms",
        "Armor",
        "Armored anti-tank",
        "Mechanized Infantry",
        "Heavy Mechanized Infantry",
        "Infantry Fighting Vehicle",
        "Amphibious Infantry Fighting Vehicle",
        "Heavy Infantry Fighting Vehicle",
        "Reconnaissance",
        "Armored Cavalry",
        "Wheeled armored Cavalry",
        "Wheeled Reconnaissance",
        "Motorized Cavalry",
        "Amphibious Armored Cavalry",
        "Amphibious Reconnaissance",
        "Sniper",
        "Mortar",
        "Mortar Heavy",
        "Mortar Medium",
        "Mortar Light",
        "Tracked Mortar",
        "Wheeled Mortar",
        "Amphibious Wheeled Mortar",
        "Motorized Infantry",
        "Motorized Anti-tank",
        "Anti-tank infantry",
        "Infantry",
        "Air mobile Infantry",
        "Airborne Infantry",
        "Air assault with organic lift",
        "Engineer",
        #"Armored Engineer",
        "Combat Engineer",
        "Construction Engineer",
        "Tracked Engineer",
        "Wheeled Engineer",
        "Bridging Engineer",
        "Amphibious Engineer",
        "Artillery",
        "Multiple rocket launcher artillery",
        "Wheeled Multiple rocket launcher artillery",
        "Self-propelled artillery",
        "Wheeled self-propelled artillery",
        "Wheeled artillery",
        "Towed artillery",
        "Amphibious artillery",
        "Amphibious towed artillery",
        "Air defense",
        "Air defense missile",
        "Air defense gun",
        "Wheeled air defense",
        "Wheeled air defense missile",
        "Wheeled air defense gun",
        "Attack rotary wing",
        "Reconnaissance rotary wing",
        "Attack reconnaissance rotary wing",
        "Utility rotary wing",
        "Light utility rotary wing",
        "Medium utility rotary wing",
        "Heavy utility rotary wing",
        "Medevac rotary wing",
        "Rotary wing",
        "Attack fixed wing",
        "Light utility fixed wing",
        "Medium utility fixed wing",
        "Heavy utility fixed wing",
        "Reconnaissance fixed wing",
        "Fixed wing",
        "Aviation composite",
        "Military Police",
        "Military Police Operations",
        "Security",
        "Supply",
        "Maintenance",
        "Medical",
        "Hospital",
        "Wheeled medevac",
        "Communications",
        "Military Intelligence",
        "UAV",
        "UAV Attack",
        "UAV Reconnaissance",
        "Reconnaissance and Surveillance",
        "Electronic Warfare",
        "Radar",
        "K9",
        "Generic",
        "Armor Headquarters unit",
        "Infantry Headquarters unit",
        "Combined Arms Headquarters unit",
        "Motorized Infantry Headquarters unit",
        "Mechanized Infantry Headquarters unit",
        "Cavalry Headquarters unit",
        "Reconnaissance Headquarters unit",
        "Artillery Headquarters unit",
        "Self-propelled Artillery Headquarters unit",
        "Air Defense Headquarters unit",
        "Engineer Headquarters unit",
        "Medical Headquarters unit",
        "Mortar Headquarters unit",
        "Wheeled Mortar Headquarters unit",
        "Military Police Headquarters unit",
        "Rotary wing Headquarters unit",
        "Fixed wing Headquarters unit",
        "Headquarters unit",
        "Supply Headquarters unit",
        "Amphibious Supply Headquarters unit",
        "Supply and Maintenance Headquarters unit",
        "Supply and Maintenance",
        "Tracked multiple rocket launcher artillery",
        "Rotary wing maintenance",
        "Rotary wing supply",
    ]

    # Special types that can't be properly resolved with the from-name method
    special_types = [
        #["Wheeled Mortar Headquarters", "13031000001308029800"], # Doesn't work
        ["Unmanned fixed wing reconnaissance", "13031000001208014700"],
        ["Unmanned rotary wing reconnaissance", "13031000001206014700"],
        #["Assault rotary wing", "130310000012060006561"],
        ["Tracked multiple rocket launcher artillery", "13031000001303014100"],
        ["Tracked demolition multiple rocket launcher artillery", "13031000001303014110"],
        #["Rotary wing maintenance", "13031000001206000038"],
        #["Rotary wing supply", "13031000001206000062"],
        #["Robotic combat vehicle", "1303100000120500000901"],
        ["Navy", "13031000001701000000"],
        ["Amphibious Medical", "13031000001613000060"],
        ["Amphibious Engineer", "13031000001407000060"]
    ]
    if not os.path.exists(path):
        print('Creating directory "{}"'.format(path))
        os.makedirs(path)

    def write_file(symbol, unit_type):
        print('Exporting symbol "{}"'.format(unit_type))

        output_filename = '{}{}.svg'.format(path, unit_type)
        with open(output_filename, 'w') as output_file:
            output_file.write(symbol.get_svg(pixel_padding=4))

    for unit_type in unit_types:
        unit_type = unit_type.lower()
        unit_descriptor = 'Friendly {}'.format(unit_type)
        symbol: military_symbol.individual_symbol.MilitarySymbol = military_symbol.get_symbol_class_from_name(unit_descriptor)

        write_file(symbol, unit_type)

    for special_unit in special_types:
        unit_type = special_unit[0].lower()
        symbol = military_symbol.individual_symbol.MilitarySymbol = military_symbol.get_symbol_class_from_sidc(special_unit[1])

        write_file(symbol, unit_type)
