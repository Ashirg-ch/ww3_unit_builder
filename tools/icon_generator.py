
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
        #"Infantry Fighting Vehicle", # TODO: Add once the symbol is available
        "Heavy weapons mechanized",
        "Reconnaissance",
        "Armored Cavalry",
        "Wheeled armored Cavalry",
        "Wheeled Reconnaissance",
        "Motorized Cavalry",
        "Sniper",
        "Mortar",
        "Mortar Heavy",
        "Mortar Medium",
        "Mortar Light",
        "Tracked Mortar",
        "Wheeled Mortar",
        "Motorized Infantry",
        "Motorized Anti-tank",
        "Infantry",
        "Air mobile Infantry",
        "Airborne Infantry",
        "Air assault with organic lift",
        "Infantry headquarters",
        "Engineer",
        #"Armored Engineer",
        "Combat Engineer",
        "Construction Engineer",
        "Tracked Engineer",
        "Wheeled Engineer",
        "Bridging Engineer",
        "Multiple rocket launcher artillery",
        "Wheeled Multiple rocket launcher artillery",
        "Self-propelled artillery",
        "Wheeled self-propelled artillery",
        "Wheeled artillery",
        "Air defense",
        "Air defense missile",
        "Air defense gun",
        "Wheeled air defense",
        "Wheeled air defense missile",
        "Wheeled air defense gun",
        "Attack rotary wing",
        "Reconnaissance rotary wing",
        "Light utility rotary wing",
        "Medium utility rotary wing",
        "Heavy utility rotary wing",
        "Rotary wing",
        "Attack fixed wing",
        "Light utility fixed wing",
        "Medium utility fixed wing",
        "Heavy utility fixed wing",
        "Fixed wing",
        "Military Police",
        "Military Police Operations",
        "Security",
        "Supply",
        "Maintenance",
        "Medical",
        "Hospital",
        "Communications",
        "UAV",
        "Unmanned Aerial Vehicle",
        "Unmanned Aerial Vehicle Attack",
        "K9",
        "Generic"
    ]

    # Special types that can't be properly resolved with the from-name method
    special_types = [
        ["Armor Headquarters", "13031000001205009800"],
        ["Infantry Headquarters", "13031000001211009800"],
        ["Combined Arms Headquarters", "13031000001210009800"],
        ["Motorized Infantry Headquarters", "13031000001211049800"],
        ["Mechanized Infantry Headquarters", "13031000001211029800"],
        ["Cavalry Headquarters", "13031000001205019800"],
        ["Reconnaissance Headquarters", "13031000001213009800"],
        ["Artillery Headquarters", "13031000001303009800"],
        ["Self-propelled Artillery Headquarters", "13031000001303019800"],
        ["Air Defense Headquarters", "13031000001301009800"],
        ["Engineer Headquarters", "13031000001407009800"],
        ["Medical Headquarters", "13031000001613009800"],
        ["Mortar Headquarters", "13031000001308009800"],
        ["Headquarters", "13031000000000009800"],
        #["Wheeled Mortar Headquarters", "13031000001308029800"] # Doesn't work
        #["Supply and Maintenance", "13031000001611000062"]
        ["Military Police Headquarters", "13031000001412009800"],
        #["Attack reconnaissance rotary wing", "130310000012060106001"],
        ["Reconnaissance rotary wing", "13031000001206010000"],
        ["Reconnaissance fixed wing", "13031000001208010000"],
        #["Unmanned fixed wing reconnaissance", "13031000001208014700"],
        #["Unmanned rotary wing reconnaissance", "13031000001206014700"],
        #["Assault rotary wing", "130310000012060006561"],
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
