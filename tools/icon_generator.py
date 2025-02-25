
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
        "Motorized Mortar",
        "Motorized Infantry",
        "Motorized Anti-tank",
        "Infantry",
        "Air mobile Infantry",
        "Airborne Infantry",
        "Air assault with organic lift",
        "Infantry headquarters",
        "Engineer",
        "Armored Engineer",
        "Multiple rocket launcher artillery",
        "Wheeled Multiple rocket launcher artillery",
        "Self-propelled artillery",
        "Wheeled self-propelled artillery",
        "Wheeled artillery",
        "Tracked self-propelled artillery",
        "Anti-air missile",
        "Wheeled Anti-air missile",
        "Tracked anti-air missile",
        "Wheeled anti-air gun",
        "Tracked anti-air gun",
        "Attack rotary wing",
        "Light utility rotary wing",
        "Medium utility rotary wing",
        "Heavy utility rotary wing",
        "Military Police",
        "Security",
        "Supply",
        "Medical",
        "Hospital",
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
    ]
    if not os.path.exists(path):
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
